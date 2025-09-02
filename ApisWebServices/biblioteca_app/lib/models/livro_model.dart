class LivroModel {
  // atributos
  final String? id;
  final String titulo;
  final String autor;
  final bool disponivel;

  // construtor
  LivroModel({
    this.id,
    required this.titulo,
    required this.autor,
    required this.disponivel,
  });

  // toJson
  Map<String, dynamic> toJson() => {
    "id": id,
    "titulo": titulo,
    "autor": autor,
    "disponivel": disponivel,
  };

  // fromJson
  factory LivroModel.fromJson(Map<String, dynamic> json) => LivroModel(
    id: json["id"].toString(),
    titulo: json["titulo"].toString(),
    autor: json["autor"].toString(),// o
    disponivel: json["disponivel"] == true ? true : false, //operador ternario para corrigir a booleana
  );
}