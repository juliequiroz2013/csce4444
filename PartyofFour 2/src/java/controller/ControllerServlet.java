/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import cart.ShoppingCart;
import entity.Category;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;
import javax.ejb.EJB;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import session.CategoryFacade;
import session.OrderManager;
import session.ProductFacade;

/**
 *
 * @author Julie
 */
@WebServlet(name = "ControllerServlet", loadOnStartup = 1, urlPatterns = {"/category", "/addToCart", "/viewCart", "/updateCart", "/checkout", "/purchase", "/callAssistance", "/drinkRefill"})
public class ControllerServlet extends HttpServlet {
    
    @EJB
    private CategoryFacade categoryFacade;
    @EJB
    private ProductFacade productFacade;
    @EJB
    private OrderManager orderManager;
    
    @Override
    public void init(ServletConfig servletConfig) throws ServletException {

        super.init(servletConfig);
        
        // store category list in servlet context
        getServletContext().setAttribute("categories", categoryFacade.findAll());
    }
    /**
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String userPath = request.getServletPath();
        HttpSession session = request.getSession();
        Category selectedCategory;
        Collection<Product> categoryProducts;

        // if category page is requested
        switch (userPath) {
            case "/category":
                //get categoryID from request
                String categoryId = request.getQueryString();
                if (categoryId != null) {
                    
                    // get selected category
                    selectedCategory = categoryFacade.find(Integer.parseInt(categoryId));
                    
                    // place selected category in session scope
                    session.setAttribute("selectedCategory", selectedCategory);
                    
                    // get all products for selected category
                    categoryProducts = selectedCategory.getProductCollection();
                    
                    // place category products in session scope
                    session.setAttribute("categoryProducts", categoryProducts);
                }
                
                // if cart page is requested
                break;
            case "/viewCart":
                String clear = request.getParameter("clear");
                if ((clear != null) && clear.equals("true")) {

                    ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
                    cart.clear();
                }   userPath = "/cart";
                
                // if checkout page is requested
                break;
            case "/checkout":
                ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
                // calculate total
                cart.calculateTotal();

            // forward to checkout page and switch to a secure channel
                break;
            case "/callAssistance":
                break;
            case "/drinkRefill":
                break;
        }

        // use RequestDispatcher to forward request internally
        String url = "/WEB-INF/view" + userPath + ".jsp";

        try {
            request.getRequestDispatcher(url).forward(request, response);
        } catch (ServletException | IOException ex) {
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String userPath = request.getServletPath();
        HttpSession session = request.getSession();
        ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");

        // if addToCart action is called
        switch (userPath) {
            case "/addToCart":
                {
                    // if user is adding item to cart for first time
                    // create cart object and attach it to user session
                    if (cart == null) {
                        
                        cart = new ShoppingCart();
                        session.setAttribute("cart", cart);
                    }       // get user input from request
                    String productId = request.getParameter("productId");
                    if (!productId.isEmpty()) {
                        
                        Product product = productFacade.find(Integer.parseInt(productId));
                        cart.addItem(product);
            }       userPath = "/category";


        // if updateCart action is called
            break;
                }
            case "/updateCart":
            {
                // get input from request
                String productId = request.getParameter("productId");
                String quantity = request.getParameter("quantity");
                Product product = productFacade.find(Integer.parseInt(productId));
                cart.update(product, quantity);
                    userPath = "/cart";


        // if purchase action is called
                    break;
            }
            case "/purchase":
                if (cart != null) {
                    String name = request.getParameter("name");
                    int orderId = orderManager.placeOrder(name, cart);
                }

                userPath = "/confirmation";
                break;
        }

        // use RequestDispatcher to forward request internally
        String url = "/WEB-INF/view" + userPath + ".jsp";

        try {
            request.getRequestDispatcher(url).forward(request, response);
        } catch (ServletException | IOException ex) {
        }
    }

}