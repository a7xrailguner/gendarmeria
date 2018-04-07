var connection = require('./../config');

module.exports.registrar=function(req,res){

  var nombreFarmacologico = req.body.nombreFarmacologico;
  var cantidadRebaje = req.body.cantidadRebaje;
  var codigoEnvio = req.body.codEnvio;
  var guiaDespacho = req.body.guiaDespacho;
  var despachoLab = req.body.despachoLab;
  var numeroDocumento = req.body.numeroDocumento;
  var numeroGuia = req.body.numeroGuia;
  

  connection.query('CALL Generar_Id_salidaCanje (?,?,?,?,?,?)',
                  [ nombreFarmacologico, codigoEnvio, guiaDespacho , despachoLab, numeroDocumento, numeroGuia],
                  function(error, results, fields){
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
