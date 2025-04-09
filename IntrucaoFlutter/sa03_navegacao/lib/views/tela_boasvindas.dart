import 'package:flutter/material.dart';

class TelaBoasvindas extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Bem-vindo!"),centerTitle: true,),
      body: Center(
        child: Column(
          children: [
            Text("Bem-vindo aoo nosso App", style: TextStyle(fontSize: 20),),
            ElevatedButton(
              onPressed: ()=> Navigator.pushNamed(context, "/cadastro"), 
              child: Text("Inicar Cadastro"))
          ],
        ),
      ),
    );
  }
}