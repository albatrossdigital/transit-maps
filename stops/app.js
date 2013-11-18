var express = require('express');
var app = express();

// Get variables
app.set('port', process.env.PORT || 3000);

var pg = require('pg'); 
var conString = "postgres://postgres@localhost/postgres";



//or native libpq bindings
//var pg = require('pg').native

app.get('/', function(req, res){

  var client = new pg.Client(conString);
  client.connect(function(err) {
    if(err) {
      return res.jsonp(500, { error: 'could not connect to postgres' });
    }
    client.query('SELECT NOW() AS "theTime"', function(err, result) {
      if(err) {
        return res.jsonp(500, { error: 'could not connect to postgres' });
      }
      console.log(result.rows);
      res.jsonp({ user: 'tobi' })
      client.end();
    });
  });

});

app.listen(app.get('port'));