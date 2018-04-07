var connection = require('./../config');

//Registrar
module.exports.registrar=function(req,res){

    var categoria = req.body.categoria;
    var insumo = req.body.Insumo;
    var lote = req.body.Lote;
    var nombre = req.body.NombreFarmatologico;
    var vencimiento = req.body.fecVenc;
    var dosis = req.body.Dosis;
    var cantidad = req.body.CantidadUnidad;
    var descripcion = req.body.Descripcion;
    var proveedor = req.body.proveedor;
    //parse chek .

    connection.query('CALL Generar_Id_producto (?,?,?,?,?,?,?,?)', [categoria, insumo, lote, nombre, vencimiento, dosis, cantidad, descripcion], function(error, results, fields){
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
