class Contact {
  final int? id;// ? significa que pode ser nulo
  final String nome;
  final String telefone;
  final String email;

  Contact({
    this.id,
    required this.nome,
    required this.telefone,
    required this.email,
  });

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'nome': nome,
      'telefone': telefone,
      'email': email
    };
  }

  factory Contact.fromMap(Map<String, dynamic> map) {
    return Contact(
      id: map["id"] as int?,
      nome: map["nome"] as String,
      telefone: map["telefone"] as String,
      email: map["email"] as String,
    );
  }
}