/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Category;
import entity.Product;
import java.io.IOException;
import java.util.Collection;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import session.CategoryFacade;

/**
 *
 * @author Julie
 */
@WebServlet(name = "ControllerServlet", loadOnStartup = 1, urlPatterns = {"/category", "/addToCart", "/viewCart", "/updateCart", "/checkout", "/purchase", "/callAssistance", "/drinkRefill"})
public class ControllerServlet extends HttpServlet {

    @EJB
    private CategoryFacade categoryFacade;
    
    @Override
    public void init() throws ServletException {

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

        // if category page is requested
        switch (userPath) {
            case "/category":
                // get categoryId from request
                String categoryId = request.getQueryString();
                if (categoryId != null) {
                    // get selected category
                    Category selectedCategory = categoryFacade.find(Short.parseShort(categoryId));
                    
                    // place selected category in request scope
                    request.setAttribute("selectedCategory", selectedCategory);
                    
                    // get all products for selected category
                    Collection<Product> categoryProducts = selectedCategory.getProductCollection();
                    
                    // place category products in request scope
                    request.setAttribute("categoryProducts", categoryProducts);
                }
                
                // if cart page is requested
                break;
            case "/viewCart":
                // TODO: Implement cart page request

            userPath = "/cart";

        // if checkout page is requested
                break;
            case "/checkout":
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

        // if addToCart action is called
        switch (userPath) {
            case "/addToCart":
                break;
            case "/updateCart":
                break;
            case "/purchase":
                // TODO: Implement purchase action
                
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