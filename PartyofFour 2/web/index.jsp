<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : index
    Created on : Apr 7, 2015, 10:09:07 PM
    Author     : Julie
    This is the home page that shows each category to the user to show their menu items within.
--%>

            <div id="indexLeftColumn">
                <div id="welcomeText">
                    <p><br><br><br>Welcome to Party of Four!<br>Try our spicy Buffalo Wings!</p>
                </div>
            </div>

<!--            Shows categories and takes them to their links-->
            <div id="indexRightColumn">
                <c:forEach var="category" items="${categories}">
                    <div class="categoryBox">
                        <a href="category?${category.id}">
                            <span class="categoryLabel"></span>
                            <span class="categoryLabelText"><br><br>${category.name}</span>
                        </a>
                    </div>
                </c:forEach>
            </div>
