import 'package:flutter/material.dart';

void main(){//funcao principal
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: ToDoListApp(),));
}

//janela do aplicativo
//statefulwidget
class ToDoListApp extends StatefulWidget{ // 1 classe realiza a mundarça de estado(setState) //extends é uma herança
  @override
  _ToDoListAppState createState() => _ToDoListAppState();
}
// "_" significa privado
class _ToDoListAppState extends State<ToDoListApp>{// 2 classe realiza o build // build é uma construção
// atributos
  final TextEditingController _tarefaController = TextEditingController();
  List<Map<String, dynamic>> _tarefas = [];
  // criar uma lista map é a mesma coisa que um json // Map e um dicionario
  // dynamic significa que pode ser qualquer coisa 

  @override
    Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Lista da Tarefas"),centerTitle: true,),
      body: Padding( //padding cria um espacamento
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _tarefaController,
              decoration: InputDecoration(labelText: "Digite uma Tarefa"),
            ),
            SizedBox(height: 10,),
            ElevatedButton(
              onPressed: _adicionarTarefa,
              child: Text("Adicionar Tarefa")
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _tarefas.length,
                itemBuilder: (context,index)=> ListTile(
                  title: Text(_tarefas[index]["titulo"], style: TextStyle(
                    // operador ternario // se verdadeiro entao // se falso entao
                    decoration: _tarefas[index]["concluida"] ? TextDecoration.lineThrough : null // é um if e else
                  ),),
                  leading: Checkbox(
                    value: _tarefas[index]["concluida"],
                    onChanged: (bool? valor)=> setState(() {
                      _tarefas[index]["concluida"] = valor!;//! significa que nao pode ser nulo
                    })),
                  ))
              )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _removerTarefasConcluidas,
        backgroundColor: Colors.red,
        child: Text("Remover"),
      ),
    );//widget que cria a estrutura da tela   
  }

  void _adicionarTarefa() {
    if(_tarefaController.text.trim().isNotEmpty){
      setState(() {
        _tarefas.add({"titulo":_tarefaController.text,"concluida":false});
        _tarefaController.clear();
      });
    }
  }

  void _removerTarefasConcluidas() {
    setState(() {
      _tarefas.removeWhere((tarefa)=>tarefa["concluida"]);
    });
  }
}
