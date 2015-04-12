<%-- 
    Document   : confirmation
    Created on : Apr 7, 2015, 10:05:12 PM
    Author     : Julie
--%>

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

                <a href="index.jsp">
                    <img src="#" id="logo" alt="Party of Four logo">
                </a>

                <img src="#" id="logoText" alt="Party of Four!">
            </div>

            <div id="singleColumn">

                <p id="confirmationText">
                    [ text ]
                    <br><br>
                    [ order reference number ]
                </p>

                <div class="summaryColumn" >

                    <table id="orderSummaryTable" class="detailsTable" >
                        <tr class="header">
                            <th style="padding:10px">[ order summary table ]</th>
                        </tr>
                    </table>

                </div>

                <div class="summaryColumn" >

                    <table id="deliveryAddressTable" class="detailsTable">
                        <tr class="header">
                            <th style="padding:10px">[ customer details ]</th>
                        </tr>
                    </table>
                </div>
            </div>

            <div id="footer">
                <hr>
                <p id="footerText">Julie Quiroz, Justin Durko, & Travis Allan</p>
            </div>
        </div>
    </body>
</html>