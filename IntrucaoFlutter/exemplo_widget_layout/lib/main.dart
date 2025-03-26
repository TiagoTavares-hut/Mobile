import 'dart:math';

import 'package:flutter/material.dart';

void main() { 
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}


//class de janela
class MyApp extends StatelessWidget {
//construtor de widget
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text("Título da Barra"), // Adicione um título aqui
      backgroundColor: const Color.fromARGB(255, 0, 0, 0), // Define a cor da barra como preta
    ),
    body: Center(
      child: Column(
        children: [
          Text(
            "",
            style: TextStyle(fontSize: 20, color: Colors.blue),
          ),
          Text(
            "",
            style: TextStyle(
              fontSize: 24,
              color: const Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
              wordSpacing: 2,
              decoration: TextDecoration.underline,
            ),
          ),
          //imagens
          ClipOval(
            child: Image.network(
              "https://images.pexels.com/photos/13246954/pexels-photo-13246954.jpeg",
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          //texto
          Text(
            "São Paulo - SP",
            style: TextStyle(fontSize: 20, color: const Color.fromARGB(255, 20, 216, 118)),
          ),
          Text(
            "Tiago Tavares",
            style: TextStyle(
              fontSize: 24,
              color: const Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
              wordSpacing: 2,
              decoration: TextDecoration.underline,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.star, size: 30, color: Colors.amber),
              Icon(Icons.star, size: 30, color: Colors.amber),
              Icon(Icons.star, size: 30, color: Colors.amber),
              Icon(Icons.star, size: 30, color: Colors.amber),
              Icon(Icons.star, size: 30, color: Colors.amber),
            ],
          ),
        ],
      ),
    ),
    bottomNavigationBar: BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Início',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Buscar',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Configurações',
        ),
      ],
      currentIndex: 0, // Índice do item selecionado
      selectedItemColor: Colors.blue,
      onTap: (index) {
        // Lógica de navegação pode ser implementada aqui
      },
    ),
  );
}
}