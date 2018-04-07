var connection = require('./../config');

//Registrar
module.exports.registrar=function(req,res){

  var idRebajeStock = req.body.idRebajeStock;
  var motivo = req.body.Motivo;
  var numeroDocumento =  req.body.NumeroDocumento;
  var documento = req.body.Documento;

  connection.query('CALL Generar_Id_danos (?,?,?,?)',
                  [idRebajeStock, motivo, numeroDocumento, documento], function(error, results, fields){
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
