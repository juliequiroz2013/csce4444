var express = require('express');
var router = express.Router();

/* GET survey page. */
router.get('/', function(req, res, next) {
    res.render('survey', {
        title: 'Party of Four!'
    });
});

module.exports = router;