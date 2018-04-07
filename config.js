var mysql = require('mysql');

var connection = mysql.createConnection({
   host: '127.0.0.1',
   user: 'root',
   password: '',
   database: 'InventarioFarmacia',
   multipleStatements: true
});

connection.connect(function(err)
{
if(!err) {

    console.log("Contado a la BD");

} else {

    console.log("Error al conectar");
}

});

module.exports = connection;
