<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : category
    Created on : Apr 7, 2015, 10:04:23 PM
    Author     : Julie
--%>

<sql:query var="categories" dataSource="jdbc/partyoffour">
    SELECT * FROM category
</sql:query>
<sql:query var="selectedCategory" dataSource="jdbc/partyoffour">
    SELECT name FROM category WHERE id = ?
    <sql:param value="${pageContext.request.queryString}"/>
</sql:query>
<sql:query var="categoryProducts" dataSource="jdbc/partyoffour">
    SELECT * FROM product WHERE category_id = ?
    <sql:param value="${pageContext.request.queryString}"/>
</sql:query>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/partyoffour.css">
        <title>Party of Four!</title>
    </head>
    <body>
        <div id="main">
            <div id="header">
                 <div id="widgetBar">
                    <div class="headerWidget">
                        [ Drink Refill ]
                    </div>
                     
                    <div class="headerWidget">
                        [ Call for Assistance ]
                    </div>

                    <div class="headerWidget">
                        [ shopping cart widget ]
                    </div>

                </div>

                <a href="#">
                    <img src="#" id="logo" alt="Party of Four logo">
                </a>

                <img src="#" id="logoText" alt="Party of Four!">
            </div>

            <div id="categoryLeftColumn">
                <c:forEach var="category" items="${categories.rows}">

                    <c:choose>
                        <c:when test="${category.id == pageContext.request.queryString}">
                            <div class="categoryButton" id="selectedCategory">
                                <span class="categoryText">
                                    ${category.name}
                                </span>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <a href="category?${category.id}" class="categoryButton">
                                <div class="categoryText">
                                    ${category.name}
                                </div>
                            </a>
                        </c:otherwise>
                    </c:choose>

                </c:forEach>
            </div>

            <div id="categoryRightColumn">
                <p id="categoryTitle">${selectedCategory.rows[0].name}</p>

                <table id="productTable">

                    <c:forEach var="product" items="${categoryProducts.rows}" varStatus="iter">

                        <tr class="${((iter.index % 2) == 0) ? 'lightBlue' : 'white'}">
                            <td>
                                <img src="${initParam.productImagePath}${product.name}.png"
                                    alt="image of ${product.name}">
                            </td>
                            <td>
                                ${product.name}
                                <br>
                                <span class="smallText">${product.description}</span>
                            </td>
                            <td>
                                &#36; ${product.amount} / unit
                            </td>
                            <td>
                                <form action="addToCart" method="post">
                                    <input type="hidden"
                                           name="productId"
                                           value="${product.id}">
                                    <input type="submit"
                                           value="add to cart">
                                </form>
                            </td>
                        </tr>

                    </c:forEach>

                </table>
            </div>

            <div id="footer">
                <hr>
                <p id="footerText">[ footer text ]</p>
            </div>
        </div>
    </body>
</html>
