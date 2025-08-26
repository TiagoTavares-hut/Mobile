class EmprestimoModel {
  // atributos
  final String? id;
  final String usuarioId;
  final String livroId;
  final String dataEmprestimo;
  final String dataDevolucao;
  final bool devolvido;

  // construtor
  EmprestimoModel({
    this.id,
    required this.usuarioId,
    required this.livroId,
    required this.dataEmprestimo,
    required this.dataDevolucao,
    required this.devolvido,
  });

  // toJson
  Map<String, dynamic> toJson() => {
    "id": id,
    "usuarioId": usuarioId,
    "livroId": livroId,
    "dataEmprestismo": dataEmprestimo,
    "dataDevolucao": dataDevolucao,
    "devolvido": devolvido,
  };

  // fromJson
  factory EmprestimoModel.fromJson(Map<String, dynamic> json) => EmprestimoModel(
    id: json["id"].toString(),
    usuarioId: json["usuarioId"].toString(),
    livroId: json["livroId"].toString(),
    dataEmprestimo: json["dataEmprestismo"].toString(),
    dataDevolucao: json["dataDevolucao"].toString(),
    devolvido: json["devolvido"]  == true ? true : false,
  );
}