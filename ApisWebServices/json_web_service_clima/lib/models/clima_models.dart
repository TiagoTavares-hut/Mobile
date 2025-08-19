class ClimaModel {
  //atributos
  final String cidade;
  final double temperatura;
  final String descricao;

  //contrutor
  ClimaModel({
    required this.cidade,
    required this.temperatura,
    required this.descricao,
  });
  //factory
  factory ClimaModel.fromJson(Map<String, dynamic> json) {
    return ClimaModel(
      cidade: json["name"],
      temperatura: json["main"]["temp"].toDouble(),
      descricao: json["weather"][0]["description"],
    );
  }
}
