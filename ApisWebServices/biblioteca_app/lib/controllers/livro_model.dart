import 'package:biblioteca_app/models/usuario_model.dart';
import 'package:biblioteca_app/services/api_service.dart';

class LivroController {
  //metodo

  //get - all
  Future<List<UsuarioModel>> pegarTodosAll() async{
    final list = await ApiService.getList("usuarios?_sort=nome");//ordenando pelo nome A->Z
    //retorna a Lista de Usuários (Json) Convertida para Usuario Model(DART
    return list.map<UsuarioModel>((item)=>UsuarioModel.fromJson(item)).toList();
  }

  //get - one
  Future<UsuarioModel> pegarTodosOne(String id) async{
    final usuario = await ApiService.getOne("usuarios", id);
    return UsuarioModel.fromJson(usuario);
  }
  //post
  Future<UsuarioModel> criar(UsuarioModel u) async{
    final created = await ApiService.post("usuarios", u.toJson());
    //adicionar o usuário e retorna o usuario adicionado
    return UsuarioModel.fromJson(created);
  }
  //put
  Future<UsuarioModel> atualizar(UsuarioModel u) async{
    final updated = await ApiService.put("usuarios", u.toJson(), u.id!);
    //retorna o usuário atualizado
    return UsuarioModel.fromJson(updated);
  }
  //delete
  Future<void> apagar(String id) async{
    await ApiService.delete("usuarios", id);
    //não tem retorno
  }
}