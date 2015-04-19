/**
 * Created by Julie on 4/18/15.
 */

var cart = [];

function addItem(item, price){
    cart.push({
        fooditem: item,
        price: price
    });

    //making cart compliant to json
    var cartString = JSON.stringify(cart);

    //This is where I get confused
    //$.ajax({
    //    type: 'POST',
    //    data: cartString,
    //    url: './'
    //});
}

