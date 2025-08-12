# json_shared_preferences

A new Flutter project.


Shared Prefrences (Armazenamento Interno do Aplicativo)

Armazenamento chave -> valor
              "config" -> "Texto" texto em formato Json 

O que é um Texto em Formato Json ->
[
    config:{
        "NomedoUsuario" : "nome do usuário",
        "IdadedoUsuario" : 25;
        "TemaEscuro" : true,
    }
]

dart -> Linguagem de Programação do Flutter não lê JSON 
     -> converter => ( json.decode => condert Text:Json em Map:Dart)
                  => ( json.decode => condert Map:Dart em Text:Json)