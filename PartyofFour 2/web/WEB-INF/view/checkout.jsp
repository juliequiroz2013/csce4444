<%-- 
    Document   : checkout
    Created on : Apr 7, 2015, 10:04:50 PM
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

            <div id="centerColumn">

                <h2>checkout</h2>

                <p>[ text ]</p>

                <form action="purchase" method="post">

                    <table id="checkoutTable">
                        <tr>
                            <td>[ form containing fields to
                                <br>capture customer details ]</td>
                        </tr>
                        <tr>
                            <td></td>
                        </tr>
                        <tr>
                            <td><input type="submit" value="submit button"></td>
                        </tr>

                    </table>

                </form>

                <div id="infoBox">

                    <div style="border: black solid 1px; height:100px; padding: 10px">
                        [ purchase conditions ]
                    </div>

                    <div id="priceBox">
                        [ purchase calculations:<br>subtotal + delivery charge ]
                    </div>
                </div>
            </div>

            <div id="footer">
                <hr>
                <p id="footerText">Julie Quiroz, Justin Durko, & Travis Allan</p>
            </div>
        </div>
    </body>
</html>