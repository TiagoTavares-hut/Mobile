import 'package:biblioteca_app/models/emprestimo_model.dart';
import 'package:biblioteca_app/services/api_service.dart';

class EmprestimoController {
  // GET - todos os empréstimos
  Future<List<EmprestimoModel>> pegarTodos() async {
    final list = await ApiService.getList("emprestimos?_sort=dataEmprestismo");
    return list
        .map<EmprestimoModel>((item) => EmprestimoModel.fromJson(item))
        .toList();
  }

  // GET - empréstimo por id
  Future<EmprestimoModel> pegarPorId(String id) async {
    final emprestimo = await ApiService.getOne("emprestimos", id);
    return EmprestimoModel.fromJson(emprestimo);
  }

  // POST - criar empréstimo
  Future<EmprestimoModel> criar(EmprestimoModel e) async {
    final created = await ApiService.post("emprestimos", e.toJson());
    return EmprestimoModel.fromJson(created);
  }

  // PUT - atualizar empréstimo
  Future<EmprestimoModel> atualizar(EmprestimoModel e) async {
    final updated = await ApiService.put("emprestimos", e.toJson(), e.id!);
    return EmprestimoModel.fromJson(updated);
  }

  // DELETE - apagar empréstimo
  Future<void> apagar(String id) async {
    await ApiService.delete("emprestimos", id);
  }
}
