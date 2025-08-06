//Teste de Conversão Json <-> Dart
import 'dart:convert';//nativa -> não precisa baixar para o pubspec

void main() {
  //tenho um texto em formato de json
  String UsuarioJson = '''{
                            "id": "1ab2",
                            "user": "usuario1",
                            "nome": "Pedro",
                            "idade": 25,
                            "cadastrado": true
                      }''';
  // para manipular o texto
  //converter(decode) json em MAP
  Map<String, dynamic> usuario = json.decode(UsuarioJson,); 
  //MANIPULANDO INFORMACOES DE JSON ->Map
  print(usuario["idade"]);
  usuario["idade"] = 47;
  //converter(encode) de map -> Json
  UsuarioJson = json.encode(usuario); //transformando de volta em json
  
  print(UsuarioJson);


}
