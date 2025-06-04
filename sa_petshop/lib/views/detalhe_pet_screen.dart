//contruir a janela de detalhe do pet

import 'package:flutter/material.dart';
import 'package:sa_petshop/constrollers/consulta_controller.dart';
import 'package:sa_petshop/constrollers/pet_controller.dart';
import 'package:sa_petshop/models/consulta_model.dart';
import 'package:sa_petshop/models/pet_model.dart';
import 'package:sa_petshop/views/criar_consulta_screen.dart';

//mudança de State
class DetalhePetScreen extends StatefulWidget {
  final int petId; //receber o id do Pet

  DetalhePetScreen({super.key, required this.petId}); // pega o Id pet

  @override
  State<StatefulWidget> createState() {
    return _DetalhePetScreenState();
  }
}

//build da Tela
class _DetalhePetScreenState extends State<DetalhePetScreen> {
  // das info do Pet // das info da Consulta do Pet
  final _petControl = PetController();
  final _consultaControl = ConsultaController();

  Pet? _pet; //pode ser nulo

  List<Consulta> _consultas = [];

  bool _isLoading = true; // enquanto carrega as info do BD

  @override
  void initState() {
    super.initState();
    _carregarDados();
  }

  void _carregarDados() async {
    setState(() {
      _isLoading = true;
      _consultas = [];
    });
    try {
      _pet = await _petControl.readPetbyId(widget.petId);
      _consultas = await _consultaControl.readConsultaByPet(widget.petId);
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Exception: $e")));
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  //build da Tela
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detalhe do Pet")),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _pet == null
          ? Center(child: Text("Erro ao Carregar o Pet, Verifique o ID "))
          : Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Nome: ${_pet!.nome}"),
                  Text("Raça: ${_pet!.raca}"),
                  Text("Dono: ${_pet!.nomeDono}"),
                  Text("Telefone: ${_pet!.telefone}"),
                  Divider(), // hr do html
                  Text("Consultas:", style: TextStyle(fontSize: 18)),
                  //operador Ternário
                  _consultas.isEmpty
                      ? Center(child: Text("Não Existe Consultas Agendadas"))
                      : Expanded(
                          child: ListView.builder(
                            itemCount: _consultas.length,
                            itemBuilder: (context, index) {
                              final consulta = _consultas[index];
                              return Card(
                                margin: EdgeInsets.symmetric(vertical: 4),
                                child: ListTile(
                                  title: Text(consulta.tipoServico),
                                  subtitle: Text(consulta.dataHoraLocal),
                                  //trailing: //delete da consulta
                                ),
                              );
                            },
                          ),
                        ),
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CriarConsultaScreen(petId: widget.petId),
            ),
          );
          _carregarDados();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
