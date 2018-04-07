var connection = require('./../config');
//import {nombre} from "";

module.exports.listProducto = function(req, res) {

    var idCategoria = req.body.categoria;
    var Dosis = req.body.dosis;

    connection.query('CALL Generar_Id_dosis (?,?)', [idCategoria ,Dosis], function (error,results,fields){
            
            if (error) {
                res.json({
                    status: false,
                    message: 'Error en la query'
                })
            } else {
                res.json({
                    status: true,
                    data: results,
                    message: 'Registro exitoso'
                })
            }
        });
    }

   