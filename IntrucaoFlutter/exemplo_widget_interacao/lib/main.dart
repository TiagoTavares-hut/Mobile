import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(home: TelaCadastroApp()));
}

//criar uma tela de Cadastro (formulário) - 
class TelaCadastroApp extends StatefulWidget{
  @override
  _TelaCadastroAppState createState() => _TelaCadastroAppState();
}

class _TelaCadastroAppState extends State<TelaCadastroApp>{
  //atribotos
  final _formKey =GlobalKey<FormState>(); //Chave de Selecao dos Componentes do Formulario
  String _nome = ''; // utilizacao do " _ " antes de declaracao da variavel
  String _email = '';
  String _senha = '';
  String _genero = '';
  String _dataNascimento = '';
  double _experiencia = 0;
  bool _aceite = false; //declaracao da boolean (bool)
  bool _senhaOculta = true;

  //metodos
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cadastro de Usuário - Exemplo Widget Interação")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(//o formkey serve para identificar o formulario
          key: _formKey,//e para validação de formulario
          child: Column(
            children: [
              //Campo Nome
              TextFormField(
                decoration: InputDecoration(labelText: "Insira o Nome"),
                //validator e onSaved serve para pegar o que foi digitado
                validator: (value) => value!.trim().isEmpty ? "Digite um Nome" : null,//operador ternário "?" //o operador ternário é um if e else
                onSaved: (value) => _nome = value!.trim(),
              ),
              //Campo Email o @ sera validado
              TextFormField(
                decoration: InputDecoration(labelText: "Insira o Email"),
                validator: (value) => value!.contains('@') ? null: "Digite um Email Válido",
                onSaved: (value) => _email = value!.trim(),
              ), 
              //Campo Senha
              TextFormField(
                decoration: InputDecoration(labelText: "Insira a Senha",
                prefixIcon: IconButton(
                  onPressed: (){
                    setState(() {
                      _senhaOculta = !_senhaOculta;
                    });
                  }, 
                  icon: Icon(Icons.lock))),
                obscureText: _senhaOculta,
                validator: (value) => value!.trim().length>=6 ? null : "Digite uma Senha Válida",
                onSaved: (value)=>_senha = value!.trim(),
              ),
              //Campo Genero
              Text("Genero"),
              DropdownButtonFormField(
                items: ["Feminino", "Masculino", "F-22"].map((String genero)=>DropdownMenuItem(
                value: genero,
                child: Text(genero))).toList(),
                onChanged: (value){},
                validator: (value) => value==null ? "Selecione um Gênero" : null,
                onSaved: (value) => _genero = value!
              ), 
              //Campo Data de Nascimento
              TextFormField(
                decoration: InputDecoration(labelText: "Insira a Data de Nascimento"),
                validator: (value) => value!.trim().isEmpty ? "Digite uma Data de Nascimento" : null,   
                onSaved: (value)=> _dataNascimento = value!.trim(),
                       
              ),
              //slider de Selecao(experiencia)
              Text("Anos de Experiência com Programação"),
              Slider(
                value: _experiencia,
                min: 0,
                max: 20,
                divisions: 20,
                label: _experiencia.round().toString(),
                onChanged: (value)=> setState(() {
                  _experiencia = value;
                  
                })),
                SizedBox(height: 15,),
                // aceite dos termos de uso
                 CheckboxListTile(//CheckboxListTile serve para criar uma caixa de seleção
                  value: _aceite,
                  title: Text("Aceito os Termos de Uso do Aplicativo"),
                  onChanged: (value)=>setState(() {
                    _aceite = value!;
                  })),
                // botão de Envio do Formulário
                ElevatedButton(
                  onPressed: _enviarFormulario,
                  child: Text("Enviar"))
            ],
          )),
        ),
    );
  }

  void _enviarFormulario(){
    if(_formKey.currentState!.validate() && _aceite) {
      _formKey.currentState!.save();
      showDialog(
        context: context,
        builder: (context)=>AlertDialog(
          title: Text("Dados do Usuário"),
          content: Column(
            children: [
              Text("Nome: $_nome"),
              Text("Email: $_email")
              //outras informações
            ],
          ),
        ));
        }
  }

}