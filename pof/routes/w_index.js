var express = require('express');
var fs = require('fs'); //This is your file stream
var customerCart = require('./../customer-cart.json');
var router = express.Router();

/* GET menu page. */
router.get('/', function(req, res, next) {
    res.render('w_index', {
        title: 'Party of Four!',
        customerCart: customerCart //Sends the most updated cart to the customer
    });
});

//This is how menu.js calls up to the server
//The function below takes the customer's cart and saves it to customer-cart.json now you and the customer cart to any page
router.post('/addItem', function(req, res) {
    customerCart = req.body; //So the car you send up is the most updated customer-cart
    var stringCustomerCart = JSON.stringify(customerCart, null, 2);
    fs.writeFile('./customer-cart.json', stringCustomerCart, function(err) { //Update the file
        if(err) {
            console.log(err);
        }
        else
        {
            console.log("File Saved");
            res.send(customerCart);
        }
    });
});

module.exports = router;