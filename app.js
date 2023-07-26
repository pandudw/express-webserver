var express = require('express'); 
var app = express();
// Respond to requests for / with 'Hello World' 
app.get('/', function(req, res){ 
 res.send('Hello world!'); 
}); 
// Listen on port 80 
app.listen(80, () => console.log('Express server started successfully.'));
