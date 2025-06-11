import 'package:sa_petshop/models/consulta_model.dart';
import 'package:sa_petshop/services/db_helper.dart';

import '../models/consulta_model.dart';
import '../services/db_helper.dart';

class ConsultaController {
  final _dbHelper = DbHelper();

  // metodos 

  //create
  createConsulta(Consulta consulta) async {
    return _dbHelper.insertConsulta(consulta);
  }

  //readConsultas
  readConsultaByPet(int petId) async {
    return _dbHelper.getConsultaByPetId(petId);
  }

  //deleteConsulta
  deleteConsulta(int id) async{
    return _dbHelper.deleteConsulta(id);
  }
}