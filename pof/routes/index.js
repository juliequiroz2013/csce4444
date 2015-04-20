var express = require('express');
var router = express.Router();
var fs = require('fs'); //This is your file stream
var customerCart = require('./../customer-cart.json');

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', {
    title: 'Party of Four!'
  });
});

module.exports = router;

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