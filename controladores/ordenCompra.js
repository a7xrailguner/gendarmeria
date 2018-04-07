var connection = require('./../config');

//Crear Orden de Compra
module.exports.registrar=function(req,res){


var nombreProveedor = req.body.proveedor;
var detal = req.body.detalle;


  connection.query('CALL Generar_Id_ordencompra (?,?)',[nombreProveedor,detal], function (error,results,fields){
        if(error){
        res.json({
          status:false,
          message:'Error en la query'
        })
      }else{
        res.json({
          
          status:true,
          data:results,
          message:'Registro exitoso'
        })
      }
    });
}
