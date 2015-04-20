var express = require('express');
var customerCart = require('./../customer-cart.json'); //Cart gets the customer cart json
var router = express.Router();

/* GET pay page. */
router.get('/', function(req, res, next) {
    res.render('pay', {
        title: 'Party of Four!',
        customerCart: customerCart //and sends it to the customercart page
    });
});

module.exports = router;