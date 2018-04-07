var connection = require('./../config');

//Registrar
module.exports.registrar=function(req,res){

  var rut = req.body.RutProveedor;
  var nombre = req.body.NombreProveedor;
  var direccion = req.body.Direccion;
  var contacto = req.body.FormaContacto;
  var tipo = req.body.TipoProveedor


  connection.query('CALL Generar_Id_proveedor(?,?,?,?,?)',[rut,nombre,direccion,contacto,tipo], function(error, results, fields){
    //Mensajes para saber si se guardo correctamente
    if(error) {
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

//Buscar

//Eliminar

//Actualizar
