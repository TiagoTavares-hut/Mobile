import 'package:biblioteca_app/controllers/emprestimo_model.dart';
import 'package:flutter/material.dart';
import 'package:biblioteca_app/models/emprestimo_model.dart';

class EmprestimosListView extends StatefulWidget {
  const EmprestimosListView({super.key});

  @override
  State<EmprestimosListView> createState() => _EmprestimosListViewState();
}

class _EmprestimosListViewState extends State<EmprestimosListView> {
  late Future<List<EmprestimoModel>> _emprestimosFuture;
  final EmprestimoController _controller = EmprestimoController();

  @override
  void initState() {
    super.initState();
    _emprestimosFuture = _controller.pegarTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Empréstimos')),
      body: FutureBuilder<List<EmprestimoModel>>(
        future: _emprestimosFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Nenhum empréstimo encontrado.'));
          }

          final emprestimos = snapshot.data!;
          return ListView.builder(
            itemCount: emprestimos.length,
            itemBuilder: (context, index) {
              final e = emprestimos[index];
              return ListTile(
                leading: Icon(
                  e.devolvido ? Icons.check_circle : Icons.book,
                  color: e.devolvido ? Colors.green : Colors.orange,
                ),
                title: Text('Livro: ${e.livroId}'),
                subtitle: Text(
                  'Usuário: ${e.usuarioId}\n'
                  'Empréstimo: ${e.dataEmprestimo}\n'
                  'Devolução: ${e.dataDevolucao}',
                ),
                trailing: e.devolvido
                    ? const Text(
                        'Devolvido',
                        style: TextStyle(color: Colors.green),
                      )
                    : const Text(
                        'Pendente',
                        style: TextStyle(color: Colors.red),
                      ),
                isThreeLine: true,
              );
            },
          );
        },
      ),
    );
  }
}
