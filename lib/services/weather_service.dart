import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatemp/secrets/apikey.dart';

class WeatherService {
  String apik = Apikey.api;

  Future<void> getWeather(String city) async {
    final url = "https://api.weatherapi.com/v1/current.json?key=$apik&q=$city";
    Uri uri = Uri.parse(url);
    var response = await http.get(uri);
    var data = jsonDecode(response.body);
    return data['current']['temp_c'];
    
    // print(data['current']['humidity']);
    // print(data['current']['wind_kph']);
    // print(data['current']['vis_km']);
    // print(data['current']['condition']['text']);
  }
}
