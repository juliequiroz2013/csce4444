var express = require('express');
var router = express.Router();

/* GET menu page. */
router.get('/', function(req, res, next) {
    res.render('menu', {
        title: 'Party of Four!'
    });
});

module.exports = router;