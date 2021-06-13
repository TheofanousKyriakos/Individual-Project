var mysql2 = require("mysql2");

var connection = mysql2.createConnection({
    host: '127.0.0.1',
    user:'root',
    password: '13100887',
    database:'privateschool',
    port:3306
});

connection.connect(function(error) {
    if(error) {
        console.log(error);
    } else {
        console.log("Connected!");
    }
});

module.exports = connection;