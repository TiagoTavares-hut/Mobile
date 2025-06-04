// Classe Model: Pet
// Um model representa a estrutura de dados de um objeto do domínio do app.
// Neste caso, o model Pet representa um animal de estimação cadastrado no sistema.
//
// Atributos:
// - id: identificador único do pet (pode ser nulo, pois é gerado pelo banco de dados)
// - nome: nome do pet
// - raca: raça do pet
// - nomeDono: nome do dono do pet
// - telefone: telefone do dono do pet
//
// Métodos:
// - Construtor: permite criar um objeto Pet com os dados necessários
// - toMap(): converte o objeto Pet para um Map (útil para salvar no banco de dados)
// - fromMap(): cria um objeto Pet a partir de um Map (útil para ler do banco de dados)


class Pet {
  //atributos -> 
  final int? id; //pode ser nulo 
  final String nome; 
  final String raca;
  final String nomeDono;
  final String telefone;

  //métodos -> Construtor
  Pet({
    this.id,
    required this.nome,
    required this.raca,
    required this.nomeDono,
    required this.telefone
  });

  //Métodos de Conversão de OBJ <=> BD
  //toMap: obj => BD
  Map<String,dynamic> toMap() {
    return{
      "id":id,
      "nome": nome,
      "raca": raca,
      "nome_dono": nomeDono,
      "telefone":telefone
    };
  }

  //fromMap: BD => Obj
  factory Pet.fromMap(Map<String,dynamic> map){
    return Pet(
      id: map["id"] as int, //cast
      nome: map["nome"] as String, 
      raca: map["raca"] as String, 
      nomeDono: map["nome_dono"] as String, 
      telefone: map["telefone"] as String);
  }
}