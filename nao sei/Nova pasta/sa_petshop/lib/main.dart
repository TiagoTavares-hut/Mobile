import 'package:flutter/material.dart';
import 'package:sa_petshop/views/listagem_screen.dart';

void main () {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
      home: ListagemScreen(
        contatos: [], // Forneça sua lista de contatos aqui
        onAdd: (contato) {}, // Forneça sua função de adicionar contato aqui
      ),
    ));
}
