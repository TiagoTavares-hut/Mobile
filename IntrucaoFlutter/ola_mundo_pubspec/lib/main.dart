import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main(){
  runApp(MyApp());//classe principal da aplicação
}

//extends é uma herança
//criar a classe princinpal
class MyApp extends StatelessWidget{
  //O @override serve para sobreescrever um metodo
@override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Exemplo de Uso do PubSpec"),
        ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            Fluttertoast.showToast(msg: "Olá, Mundo!!!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM);
            // o bottom é abaixo
          }, 
          child: Text("Clique Aqui!!!")),
      )
      )
    );
  }
}