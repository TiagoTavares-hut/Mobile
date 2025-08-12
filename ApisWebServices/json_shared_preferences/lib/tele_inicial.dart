import 'dart:convert'; // Usado para converter objetos Dart em JSON e vice-versa
import 'package:flutter/material.dart'; // Biblioteca principal para criação de interfaces no Flutter
import 'package:json_shared_preferences/main.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Biblioteca para salvar dados localmente no dispositivo

// Tela inicial da aplicação
class TelaInicial extends StatefulWidget {
  final bool temaEscuro; // Define se o tema inicial será escuro ou não
  final String nomeUsuario; // Nome inicial do usuário

  // Construtor da tela inicial, exige os parâmetros 'temaEscuro' e 'nomeUsuario'
  TelaInicial({required this.temaEscuro, required this.nomeUsuario});

  @override
  State<StatefulWidget> createState() {
    // Retorna a instância do estado da tela
    return _TelaInicialState();
  }
}

// Classe que gerencia o estado da TelaInicial
class _TelaInicialState extends State<TelaInicial> {
  late bool _temaEscuro; // Variável interna para armazenar o estado do tema
  late TextEditingController _nomeController; 
  // Controlador para manipular o texto dentro de TextFields

  @override
  void initState() {
    super.initState();
    // Pega o valor inicial do tema a partir do widget pai (TelaInicial)
    _temaEscuro = widget.temaEscuro;
    // Inicializa o controlador de texto com o nome recebido
    _nomeController = TextEditingController(text: widget.nomeUsuario);
  }

  // Método para salvar as configurações no dispositivo
  void _salvarConfiguracoes() async {
    // Obtém a instância de SharedPreferences (armazenamento local)
    final prefs = await SharedPreferences.getInstance();
    
    // Cria um mapa com as configurações
    Map<String, dynamic> config = {
      "temaEscuro": _temaEscuro, // Estado atual do tema
      "nome": _nomeController.text.trim(), // Nome digitado no campo de texto
    };
    
    // Converte o mapa para uma string JSON
    String jsonString = json.encode(config);
    
    // Salva a string JSON no SharedPreferences
    prefs.setString("config", jsonString);
    
    // Exibe uma mensagem de sucesso na parte inferior da tela
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Configurações salvas com sucesso!")),
    );
  }

     @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Preferências do Usuário")),
      body: Padding(
        padding: EdgeInsets.all(16.0), 
        child: Column(
          children: [
            SwitchListTile(
              title: Text("Tema Escuro"),
              value: _temaEscuro, 
              onChanged: (bool value){
                setState(() {
                  _temaEscuro = value;
                });
              }),
            TextField(
              controller: _nomeController,
              decoration: InputDecoration(labelText: "Nome do Usuário"),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: ()async{
                 _salvarConfiguracoes();

               Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => ConfigPage()));

              },
              child: Text("Salvar Preferencias"),),
            SizedBox(height: 20,),
            Divider(),
            Text("Configurações Atuais:", style: TextStyle(fontWeight: FontWeight.bold),),
            SizedBox(height: 16,),
            Text("tela: ${_temaEscuro ? "Escuro" : "Claro"}"),
            Text("Nome do Usuário: ${_nomeController.text}")
          ],
        )),
    );
  }
}
