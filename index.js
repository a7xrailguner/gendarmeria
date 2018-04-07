var express = require("express");
var bodyParser =require('body-parser');
var path = require('path');
var multer = require('multer');
var connection = require('./config');
var sql = require('mysql');

//Variables
var app = express();
var upload = multer();
var Proveedor = require('./controladores/Proveedor');
var Producto = require('./controladores/Producto');
var Login = require('./controladores/Login');
var OrdenCompra = require('./controladores/ordenCompra');
var RebajeCanje = require('./controladores/rebajePorCanje');
var RebajeDanos = require('./controladores/rebajePorDanos');
var Factura = require('./controladores/Factura');
var CategorizarProducto = require('./controladores/CategorizarProducto');
var stock = require('./controladores/stock');
var RebajeMerma = require('./controladores/rebajeMerma');

app.use(bodyParser.urlencoded({extended:false}));
app.use(bodyParser.json());

//Abrir Vistas
app.set("view engine","ejs");

app.use(express.static('public'));
app.use('/static', express.static(__dirname + '/public'));

//Pagina de Login
app.get("/", function(req, res){
	res.render("login");
});
app.post('/login', Login.validar);

//Pagina de Inicio
app.get("/inicio.ejs", function(req, res){
	res.render("inicio");
});

//Registro Proveedors
app.get("/registroProveedor.ejs", function(req, res){
  res.render("registroProveedor");
});
app.post('/addProveedor', Proveedor.registrar);

//Registro Producto

app.get("/registroProducto.ejs", function(req,res){
	
connection.query('SELECT nombreProveedor FROM Proveedor', function(err,rows){
		if(err){
			throw err;
		}else{
			console.log(rows);
			 res.render('registroProducto' , {rows} );
			
		}
	});
     
connection.query('SELECT nombreCategoria FROM Categoria', function(err,rows){
		if(err){
			throw err;
		}else{
			
			console.log(rows);
			 res.render('registroProducto', {rows});
			
		}
	});

});


app.post('/addProducto', Producto.registrar);

//Factura
app.get("/registroFactura.ejs", function(req,res){
	res.render("registroFactura");

});
app.post("/addFactura", Factura.registrar);

//categorizar producto
app.get("/categorizarProducto.ejs", function(req, res){
	
	connection.query('SELECT nombreCategoria FROM Categoria', function(err,rows){
		if(err){
			throw err;
		}else{
			
		    console.log(rows);
			
			res.render("CategorizarProducto", {rows} );
			
		}

});
});


//Categorizar
app.get("/categorizarProducto.ejs", function(req,res){
	res.render("categorizarProducto");
})
app.post('/categoProducto', CategorizarProducto.listProducto);//Nacho


//Orden de Compra
app.get("/crearOrdenCompra.ejs", function(req,res){
	connection.query('SELECT NombreProveedor FROM proveedor', function(err,rows){
		if(err){
			throw err;
		}else{
		    console.log(rows);
			//console.log('rows is', rows);
			res.render("crearOrdenCompra", {rows}); //mmmmmm.... ¬¬
			
		}
	});
 
});
app.get("/crearOrdenCompra.ejs", function(req, res){
	res.render("crearOrdenCompra");
});

app.post('/orden', OrdenCompra.registrar);


//Rebaje por Canje
app.get("/rebajePorCanje.ejs", function(req,res){
	connection.query('SELECT nombreFarmacologico FROM producto', function(err,rows){
		if(err){
			throw err;
		}else{
		    console.log(rows);
			res.render("rebajePorCanje", {rows}); //mmmmmm.... ¬¬
			
		}
	});
 
});
app.post('/rebajeCanje', RebajeCanje.registrar);

//Rebaje por Daños
app.get("/rebajePorDanos.ejs", function(req,res){
	connection.query('SELECT nombreFarmacologico FROM producto', function(err,rows){
		if(err){
			throw err;
		}else{
		    console.log(rows);
			//console.log('rows is', rows);
			res.render("rebajePorDanos", {rows}); //mmmmmm.... ¬¬
			
		}
	});
 
});
app.post('/addRebajaDano', RebajeDanos.registrar);

//Rebaje por Merma 
app.get("/rebajePorMerma.ejs", function(req,res){

	connection.query('SELECT nombreFarmacologico FROM producto', function(err,rows){
		if(err){
			throw err;
		}else{
		    console.log(rows);
			
			res.render("rebajePorMerma", {rows}); //mmmmmm.... ¬¬
			
		}
	});
});
app.post('/addRebajaMerma', RebajeMerma.registrar);

//Stock

app.get("/stock.ejs", function(req,res){
	res.render("stock");
});
app.post('/listStock', stock.listar);

app.listen(8080);
