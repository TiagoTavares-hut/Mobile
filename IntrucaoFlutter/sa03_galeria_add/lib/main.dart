import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MayApp extends StatelessWidget {
  //lista de imagens
  List<String> imagens = [
    "https://images.unsplash.com/photo-1506748686214-e9df14d4d9d0",
    "https://images.unsplash.com/photo-1521747116042-5a810fda9664",
    "https://images.unsplash.com/photo-1504384308090-c894fdcc538d",
    "https://images.unsplash.com/photo-1518837695005-2083093ee35b",
    "https://images.unsplash.com/photo-1501594907352-04cda38ebc29",
    "https://images.unsplash.com/photo-1519681393784-d120267933ba",
    "https://images.unsplash.com/photo-1531259683007-016a7b628fc3",
    "https://images.unsplash.com/photo-1506619216599-9d16d0903dfd",
    "https://images.unsplash.com/photo-1494172961521-33799ddd43a5",
    "https://images.unsplash.com/photo-1517245386807-bb43f82c33c4",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 300, 
                autoPlay: true
              ),
              items: imagens.map(
                ((url)=> Container(
                  margin: EdgeInsets.all(8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(url,fit: BoxFit.cover,width:1000)),
                ))).toList(),),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8),
              itemCount: imagens.length, 
              itemBuilder: (context,index)=>
                GestureDetector(
                  onTap: () => _mostrarImagem(context,imagens[index]),
                  child: ClipRRect(borderRadius: BorderRadius.circular(10),
                  child: Image.network(imagens[index],fit: BoxFit.cover)),
                )))
          ],
        ),
      ),
    ),
    //adicionar a URL de imgens aqui
    @override
    Widget build(BuildContext context) {
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
                    }),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => setState(() {
                      _tarefas.removeAt(index);
                    }),
                  ),
                ),
              ),
            )
          ],
       ),
      );
    }
    );
  }
  
  void _mostrarImagem(BuildContext context, String imagem) {
    showDialog(
      context: context, 
      builder: (context) => Dialog(
        child: Image.network(imagem),
      ));
  }
}