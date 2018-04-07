var connection = require('./../config');

//validar
exports.validar=function(req,res){

  connection.query('SELECT * FROM usuario WHERE Nombre = ? and Contraseña = ?', [req.body.Nombre, req.body.Contraseña], function(error, results, fields){

    if(results.length){
      console.log(results[0].Nombre);
      res.render("inicio");
    }
    else{
      console.log("ERROR!");
    }
  });
}
