import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weatemp/secrets/apikey.dart';

class WeatherService {
  Future<String> getWeather() async {
    var response = await http.get(
      Uri.parse(
        "http://api.weatherapi.com/v1/current.json?key=ef5b352737664ae795f110723260306&q=Patna",
      ),
    );
    return response.body;
  }
}

