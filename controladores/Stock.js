var connection = require('./../config');

//Registrar
module.exports.listar=function(req,res){

  var idStock = req.body.IdStock;
  var idProcuto   = req.body.IdProcuto;
  var minimo =  req.body.Minimo;
  var maximo = req.body.Maximo;
  var cantidadStock = req.body.CantidadStock;

  connection.query('CALL stock (?,?,?,?,?)',
                  [idStock ,idProducto, minimo, maximo, cantidadStock], function(error, results, fields){
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
