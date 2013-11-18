var express = require('express');
var app = express();

// Get variables
app.set('port', process.env.PORT || 3000);

var pg = require('pg'); 
var conString;

var moment = require('moment');
var moment = require('moment-timezone');

//or native libpq bindings
//var pg = require('pg').native

app.get('/', function(req, res){

  var db = req.query.db ? req.query.db : 'gtfs.corvallis.transit';
  var tz = req.query.tz ? req.query.tz : 'America/Los_Angeles';
  var timeformat = req.query.timeformat ? req.query.timeformat: 'fromnow';
if (db == undefined) {
  return res.jsonp(500, { error: 'Missing db parameter' });
}
conString = "postgres://postgres@localhost:5432/" + db;
console.log(conString);

if (req.query.time == undefined && req.query.date == undefined) {
  var datetime = moment().tz(tz);
}
else {
  var day = req.query.date ? req.query.date : moment().format('YYYY-MM-DD');
  var time = req.query.time ? req.query.time : moment().format('HH:mm:ss');
  var datetime = moment(day+" "+time, 'YYYY-MM-DD HH:mm:ss'); 
}


  var query = "select t.departure_time, trip.trip_headsign, r.route_short_name, r.route_long_name, r.route_color from stops s";
  query += " left join stop_times t on s.stop_id=t.stop_id";
  query += " left join trips trip on t.trip_id=trip.trip_id";
  query += " left join routes r on r.route_id=trip.route_id";
  query += " left join calendar c on c.service_id=trip.service_id";
  query += " where s.stop_id = '" + req.query.stop_id + "'";
  query += " and t.arrival_time >= '" + datetime.format('HH:mm:ss') + "'";
  query += " and c." + datetime.format('dddd').toLowerCase() + " = 't'";
  query += " limit 10;";
    console.log(query);

  fetch(query, function(err, data){
    var date = datetime.format('YYYY-MM-DD');
    for (var i in data.items) {
      data.items[i].departure_time = item_datetime = moment(date+' '+data.items[i].departure_time, 'YYYY-MM-DD HH:mm:s').format();
    }
    res.jsonp(data);
  });
  


});




app.listen(app.get('port'));

var fetch = function (query, callback) {
  var client = new pg.Client(conString);
  client.connect(function(err) {
    if(err) {
    console.log('err');
      return callback(500, { error: 'could not connect to postgres' });
    }
    client.query(query, function(err, result) {
      if(err) {
        return callback(500, { error: 'could not connect to postgres' });
      }
      client.end();
      console.log(result.rows);
      var data = {
        itemCount: result.rowCount,
        items: result.rows
      }
      return callback({}, data);
      console.log('asdf');
      console.log(err);
      console.log(result);
      return result;


    });
  });
}
