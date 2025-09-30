import 'package:biblioteca_app/controllers/livro_model.dart';
import 'package:biblioteca_app/models/livro_model.dart';
import 'package:biblioteca_app/models/usuario_model.dart';
import 'package:flutter/material.dart';

class LivrosFormView extends StatefulWidget {
  final LivroModel? livro;
  const LivrosFormView({super.key, this.livro});

  @override
  State<LivrosFormView> createState() => _LivrosFormViewState();
}

class _LivrosFormViewState extends State<LivrosFormView> {
  final _formKey = GlobalKey<FormState>();
  final _tituloController = TextEditingController();
  final _autorController = TextEditingController();
  bool _disponivel = true;
  final LivroController _controller = LivroController();

  @override
  void initState() {
    super.initState();
    if (widget.livro != null) {
      _tituloController.text = widget.livro!.titulo;
      _autorController.text = widget.livro!.autor;
      _disponivel = widget.livro!.disponivel;
    }
  }

  @override
  void dispose() {
    _tituloController.dispose();
    _autorController.dispose();
    super.dispose();
  }

  Future<void> _salvar() async {
    if (_formKey.currentState!.validate()) {
      final livro = LivroModel(
        id: widget.livro?.id,
        titulo: _tituloController.text,
        autor: _autorController.text,
        disponivel: _disponivel,
      );
      try {
        if (widget.livro == null) {
          await _controller.criar(livro as UsuarioModel);
        } else {
          await _controller.atualizar(livro as UsuarioModel);
        }
        if (mounted) Navigator.of(context).pop(true);
      } catch (e) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Erro ao salvar: $e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.livro == null ? 'Novo Livro' : 'Editar Livro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _tituloController,
                decoration: const InputDecoration(labelText: 'Título'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Informe o título' : null,
              ),
              TextFormField(
                controller: _autorController,
                decoration: const InputDecoration(labelText: 'Autor'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Informe o autor' : null,
              ),
              SwitchListTile(
                title: const Text('Disponível'),
                value: _disponivel,
                onChanged: (value) {
                  setState(() {
                    _disponivel = value;
                  });
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(onPressed: _salvar, child: const Text('Salvar')),
            ],
          ),
        ),
      ),
    );
  }
}
