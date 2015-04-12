<%-- 
    Document   : checkout
    Created on : Apr 7, 2015, 10:04:50 PM
    Author     : Julie
--%>
            <div id="centerColumn">

                <h2>checkout</h2>

                <p>Push submit to send your order to the kitchen</p>

                <form action="purchase" method="post">

                    <table id="checkoutTable">
                        <tr>
                            <td><input type="submit" value="submit button"></td>
                        </tr>
                    </table>

                </form>

                <div id="infoBox">
                    <table id="priceBox">
                        <tr>
                            <td>subtotal:</td>
                            <td class="checkoutPriceColumn">
                                &#36;${cart.subtotal}</td>
                        </tr>
                        <tr>
                            <td class="total">total:</td>
                            <td class="total checkoutPriceColumn">
                                &#36;${cart.total}</td>
                        </tr>
                    </table>
                </div>
            </div>
