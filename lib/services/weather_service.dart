import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatherapp/env/env.dart';
import 'package:weatherapp/models/city_weather.dart';

class WeatherService {
  Future<CityWeather> getWeather(String cityName) async {

    final queryParameters = { 'q' : cityName, 'appid': env['api_key']};

    final uri = Uri.https('api.openweathermap.org', '/data/2.5/weather', queryParameters);
    
    try {
      final response = await http.get(uri);
      final json = jsonDecode(response.body);
      return CityWeather.fromJson(json);
    } catch (e){
      //Ceci est un raccourci pour la gestion d'erreurs
      print(e);
      return CityWeather(cityName: "Error", temperature: 0, icon: "10d");
    }

    
  }
}