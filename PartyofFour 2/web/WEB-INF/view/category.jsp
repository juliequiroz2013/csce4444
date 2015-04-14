<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : category
    Created on : Apr 7, 2015, 10:04:23 PM
    Author     : Julie
    This is the categories file, that show the menu items and their descriptions and their descriptions with Add to Cart capabilities.
--%>
<!--            This is the left column where the categories are able to switch from one to another-->
            <div id="categoryLeftColumn">
                <c:forEach var="category" items="${categories}">

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
                <p id="categoryTitle">
                    <span style="background-color: #f5eabe; padding: 7px;">
                        ${selectedCategory.name}
                    </span>
                </p>

                <table id="productTable">

                    <c:forEach var="product" items="${categoryProducts}" varStatus="iter">

                        <tr class="${((iter.index % 2) == 0) ? 'lightBlue' : 'white'}">
                            <td>
                                <img src="${initParam.productImagePath}${product.name}.png"
                                    alt="image of ${product.name}" style="width: 50%">
                            </td>
                            <td>
                                ${product.name}
                                <br>
                                <span class="smallText">${product.description}</span>
                            </td>
                            <td>
                                &#36;${product.amount}
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
