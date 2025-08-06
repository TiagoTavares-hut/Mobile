import 'package:flutter/material.dart';
import '../models/contact_model.dart';

class DetalheScreen extends StatefulWidget {
  final Contact contato;
  const DetalheScreen({required this.contato, super.key});

  @override
  State<DetalheScreen> createState() => _DetalheScreenState();
}

class _DetalheScreenState extends State<DetalheScreen> {
  final List<Map<String, String>> camposAdicionais = [];

  final _tipoController = TextEditingController();
  final _valorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.contato.nome)),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Telefone: ${widget.contato.telefone}'),
            Text('E-mail: ${widget.contato.email}'),
            SizedBox(height: 20),
            Text('Campos Adicionais:', style: TextStyle(fontWeight: FontWeight.bold)),
            ...camposAdicionais.map((campo) => ListTile(
              title: Text('${campo['tipo']}: ${campo['valor']}'),
            )),
            Divider(),
            TextField(
              controller: _tipoController,
              decoration: InputDecoration(labelText: 'Tipo (ex: aniversário)'),
            ),
            TextField(
              controller: _valorController,
              decoration: InputDecoration(labelText: 'Valor'),
            ),
            ElevatedButton(
              child: Text('Adicionar Campo'),
              onPressed: () {
                setState(() {
                  camposAdicionais.add({
                    'tipo': _tipoController.text,
                    'valor': _valorController.text,
                  });
                  _tipoController.clear();
                  _valorController.clear();
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}