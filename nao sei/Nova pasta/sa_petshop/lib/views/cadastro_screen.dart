import 'package:flutter/material.dart';
import 'package:sa_petshop/models/contact_model.dart';

class CadastroScreen extends StatefulWidget{ //extends é uma herança
  final Function(Contact) onSave; //onSave recebe uma funcao
  const CadastroScreen({required this.onSave, super.key}); // super.key -> chama o construtor da classe pai
  
  @override
  State<CadastroScreen> createState() => _CadastroScreenState();
} 

class _CadastroScreenState extends State<CadastroScreen> {
  final _formKey = GlobalKey<FormState>(); // chave para o formulario
  
  String _nome = "";
  String _telefone = "";
  String _email = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(title: Text('Novo Contato')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Nome'),
                onSaved: (value) => _nome = value ?? '',
                validator: (value) => value!.isEmpty ? 'Informe o nome' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Telefone'),
                onSaved: (value) => _telefone = value ?? '',
                validator: (value) => value!.isEmpty ? 'Informe o telefone' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'E-mail'),
                onSaved: (value) => _email = value ?? '',
                validator: (value) => value!.isEmpty ? 'Informe o e-mail' : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child: Text('Salvar'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    widget.onSave(Contact(nome: _nome, telefone: _telefone, email: _email));
                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}