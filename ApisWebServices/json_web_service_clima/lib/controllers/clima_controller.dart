import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:json_web_service_clima/models/clima_models.dart';

class ClimaController {
  final String _apiKey = "394b0a776af32be081979afb65b3e328";

  //medoto para pegar a informacoes do clima da cidade
  // metodo get
  Future<ClimaModel?> buscarClima(String cidade) async {
    final url = Uri.parse(
      "https://api.openweathermap.org/data/2.5/weather?q=$cidade&appid=$_apiKey&unit=metric&lang=pt_br",
    );
    final response = await http.get(url);
    if(response.statusCode == 200) {
      final dados = json.decode(response.body);
      return ClimaModel.fromJson(dados);
    } else {
      return null;
    }
  }
}
