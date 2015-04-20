//orderitems is now include in here since you included it in menu.ejs

//Now you want to add a menu item

function addItem(item, price) {
    var newitem = {
        fooditem: item,
        price: price
    };
    customerCart.cart.push(newitem);
    console.log(item);
    console.log(price);
    var stringCart = JSON.stringify(customerCart);
    $.ajax({
        type: 'POST',
        data: stringCart,
        url: './menu/addItem',
        contentType: 'application/json',
        success: function (returnCart) { //I usually just return to in case there is an error even if the cart is updated
            customerCart = returnCart;
        }
    });
}

function heretogo(answer) {
    var where = answer;
    customerCart.where = where;
    console.log(answer);
    var stringCart = JSON.stringify(customerCart);
    $.ajax({
        type: 'POST',
        data: stringCart,
        url: './menu/addItem',
        contentType: 'application/json',
        success: function (returnCart) { //I usually just return to in case there is an error even if the cart is updated
            customerCart = returnCart;
        }
    });
}


function drinkrefill() {
    customerCart.refill = 1;
    console.log(refill);
    var stringCart = JSON.stringify(customerCart);
    $.ajax({
        type: 'POST',
        data: stringCart,
        url: './header/addItem',
        contentType: 'application/json',
        success: function (returnCart) { //I usually just return to in case there is an error even if the cart is updated
            customerCart = returnCart;
        }
    });
}

function assist() {
    customerCart.assist = 1;
    console.log(refill);
    var stringCart = JSON.stringify(customerCart);
    $.ajax({
        type: 'POST',
        data: stringCart,
        url: './header/addItem',
        contentType: 'application/json',
        success: function (returnCart) { //I usually just return to in case there is an error even if the cart is updated
            customerCart = returnCart;
        }
    });
}