var connection = require('./../config');
//Registrar
module.exports.registrar=function(req,res){

	var numeroFactura = req.body.NumeroFactura;
	var valorNeto = req.body.ValorNeto;
	var iva = req.body.Iva;
	var total= req.body.Total;
	var numeroDeLote = req.body.NumeroLote;
	var caracteristica = req.body.Caracteristicas;

	connection.query('CALL Generar_Id_factura (?,?,?,?,?,?)',
		[numeroFactura,valorNeto,iva,total,numeroDeLote,caracteristica],
		 function(error, results, fields){
		//Mensajes para saber si se guardo correctamente
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
  

//Buscar

//Eliminar

//Actualizar