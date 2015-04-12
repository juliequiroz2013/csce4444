<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : index
    Created on : Apr 7, 2015, 10:09:07 PM
    Author     : Julie
--%>
<sql:query var="categories" dataSource="jdbc/partyoffour">
    SELECT * FROM category
</sql:query>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

            <div id="indexLeftColumn">
                <div id="welcomeText">
                    <p><br><br><br>Welcome to Party of Four!<br>Try our spicy Buffalo Wings!</p>
                </div>
            </div>

            <div id="indexRightColumn">
                <c:forEach var="category" items="${categories.rows}">
                    <div class="categoryBox">
                        <a href="category?${category.id}">
                            <span class="categoryLabel"></span>
                            <span class="categoryLabelText"><br><br>${category.name}</span>
                        </a>
                    </div>
                </c:forEach>
            </div>
