var express = require('express');
var router = express.Router();

/* GET win dessert page. */
router.get('/', function(req, res, next) {
    res.render('win', {
        title: 'Party of Four!'
    });
});

module.exports = router;