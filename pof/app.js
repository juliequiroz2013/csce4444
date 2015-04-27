var express = require('express');
var path = require('path');
var logger = require('morgan');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');

var routes = require('./routes/index');
var menu = require('./routes/menu');
var games = require('./routes/games');
var pay = require('./routes/pay');
var survey = require('./routes/survey');
var header  = require('./routes/header');
var k_index = require('./routes/k_index');
<<<<<<< HEAD
var win = require('./routes/win');
=======
var w_index = require('./routes/w_index');
>>>>>>> origin/master

var app = express();

app.locals.menuitems = require('./menu.json');

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

// uncomment after placing your favicon in /public
//app.use(favicon(__dirname + '/public/favicon.ico'));
app.use(logger('dev'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.use('/', routes);
app.use('/menu', menu);
app.use('/games', games);
app.use('/pay', pay);
app.use('/survey', survey);
app.use('/header', header);
app.use('/k_index', k_index);
<<<<<<< HEAD
app.use('/win', win);
=======
app.use('/w_index', w_index);
>>>>>>> origin/master

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  var err = new Error('Not Found');
  err.status = 404;
  next(err);
});

// error handlers

// development error handler
// will print stacktrace
if (app.get('env') === 'development') {
  app.use(function(err, req, res, next) {
    res.status(err.status || 500);
    res.render('error', {
      message: err.message,
      error: err
    });
  });
}

// production error handler
// no stacktraces leaked to user
app.use(function(err, req, res, next) {
  res.status(err.status || 500);
  res.render('error', {
    message: err.message,
    error: {}
  });
});


module.exports = app;
