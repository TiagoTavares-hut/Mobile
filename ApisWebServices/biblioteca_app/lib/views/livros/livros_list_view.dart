import 'package:biblioteca_app/controllers/usuario_model.dart';
import 'package:biblioteca_app/models/usuario_model.dart';
import 'package:biblioteca_app/views/usuarios/usuario_form_view.dart';
import 'package:flutter/material.dart';

class LivrosListView extends StatefulWidget {
  const LivrosListView({super.key});

  @override
  State<LivrosListView> createState() => _LivrosListViewState();
}

class _LivrosListViewState extends State<LivrosListView> {
  //atributos
  final _buscarField = TextEditingController();
  List<UsuarioModel> _usuariosFiltrados = [];
  final _controller = UsuarioController();
  List<UsuarioModel> _usuarios = []; //lista par guardar os usuário
  bool _carregando = true; //bool par usar no view

  @override
  void initState() {
    // carregar os dados antes da contrução da tela
    super.initState();
    _load(); //método par carregar dados da api
  }

  _load() async {
    setState(() {
      _carregando = true;
    });
    try {
      _usuarios = await _controller.fetchAll();
      _usuariosFiltrados = _usuarios;
    } catch (e) {
      ScaffoldMessenger.of(
        context, 
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    }
    setState(() {
      _carregando = false;
    });
  }
  void _filtrar() {
    final busca = _buscarField.text.toLowerCase();
    setState(() {
      _usuariosFiltrados = _usuarios.where((user) {
        return user.nome.toLowerCase().contains(busca) ||
            user.email.toLowerCase().contains(busca);
      }).toList();
    });
  }

  //criar metodo deletar 
  void _delete(UsuarioModel user) async {
    if (user.id == null) return; //interrompe o método
    final confirme = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Confirmação"),
        content: Text("Deseja realmente apagar o usuário ${user.nome}?"),
        actions: [
          TextButton(onPressed: ()=> Navigator.pop(context,false), child: Text("Cancelar")),
          TextButton(onPressed: ()=> Navigator.pop(context,true), child: Text("Ok"))
        ],
      ));
    if(confirme == true){
      try {
        await _controller.delete(user.id!);
        _load();
        //mensagem de confirmação
      } catch (e) {
        //tratar erro
      }
    }
  }

  void _openForm({UsuarioModel? user}) async{
    await Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (context)=> UsuarioFormView(user: user,)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //operador ternario
      body: _carregando
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(16),
                  child: TextField(
                    controller: _buscarField,
                    decoration: InputDecoration(
                      labelText: "Buscar",
                      suffixIcon: IconButton(
                        onPressed: () {
                          _buscarField.clear();
                          _filtrar();
                        },
                        icon: Icon(Icons.clear),
                      ),
                    ),
                    onChanged: (value) => _filtrar(),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: _usuariosFiltrados.length,
                      itemBuilder: (context, index) {
                        final usuario = _usuariosFiltrados[index];
                        return Card(
                            child: ListTile(
                              //leading para editar usuario
                              leading: IconButton(
                                onPressed: ()=>_openForm(user: usuario),
                                icon: Icon(Icons.edit)),
                               title: Text(usuario.nome),
                               subtitle: Text(usuario.email),
                               //trailing para deletar usuario
                              trailing: IconButton(
                                onPressed: ()=>_delete(usuario),
                                icon: Icon(Icons.delete, color: Colors.red,)),
                           ),
                       );
                   }),
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: ()=>_openForm(),
              child: Icon(Icons.add),
            ),
          );
        }
      }