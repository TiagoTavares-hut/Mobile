import 'package:flutter/material.dart';
import 'package:sa_petshop/models/contact_model.dart';
import 'package:sa_petshop/views/detalhe_screen.dart';


class ListagemScreen extends StatelessWidget{
  final List<Contact> contatos;
  final Function(Contact) onAdd;

  const ListagemScreen({required this.contatos, required this.onAdd, super.key});

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contatos')),
      body: ListView.builder(
        itemCount: contatos.length,
        itemBuilder: (context, index) {
          final contato = contatos[index];
          return ListTile(
            title: Text(contato.nome),
            subtitle: Text(contato.telefone),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder:(context) => DetalheScreen(contato: contato) )
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          // Aqui você pode abrir a tela de cadastro e adicionar o contato à lista
        },
      ),
    );
  }
}