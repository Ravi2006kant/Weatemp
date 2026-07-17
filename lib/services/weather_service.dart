import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatemp/secrets/apikey.dart';

class WeatherService {
  final String apik = Apikey.api;

  Future<Map<String, dynamic>> getWeather(String city) async {
    final uri = Uri.parse(
      "https://api.weatherapi.com/v1/current.json?key=$apik&q=$city",
    );

    final response = await http.get(uri);
    final data = jsonDecode(response.body);

    return {
      "city": data["location"]["name"],
      "temp": data["current"]["temp_c"],
      "weather": data["current"]["condition"]["text"],
      "feels": data["current"]["feelslike_c"],
      "time": data["location"]["localtime"].split(" ")[1],
      "humidity": data["current"]["humidity"],
      "wind": data["current"]["wind_kph"],
      "visibility": data["current"]["vis_km"],
      "pressure": data["current"]["pressure_mb"],
    };
  }

  Future<Map<String, dynamic>> weatherByLoc(
    double latitude,
    double longitude,
  ) async {
    final uri = Uri.parse(
      "https://api.weatherapi.com/v1/current.json?key=$apik&q=$latitude,$longitude",
    );

    final response = await http.get(uri);
    final data = jsonDecode(response.body);

    return {
      "city": data["location"]["name"],
      "temp": data["current"]["temp_c"],
      "weather": data["current"]["condition"]["text"],
      "feels": data["current"]["feelslike_c"],
      "time": data["location"]["localtime"].split(" ")[1],
      "humidity": data["current"]["humidity"],
      "wind": data["current"]["wind_kph"],
      "visibility": data["current"]["vis_km"],
      "pressure": data["current"]["pressure_mb"],
    };
  }

  Future<List<Map<String, dynamic>>> forecast(String city) async {
    final uri = Uri.parse(
      "https://api.weatherapi.com/v1/forecast.json?key=$apik&q=$city&days=1",
    );

    final response = await http.get(uri);
    final data = jsonDecode(response.body);

    final hours = data["forecast"]["forecastday"][0]["hour"];
    final currentHour = DateTime.parse(
      data["location"]["localtime"],
    ).hour;

    List<Map<String, dynamic>> forecast = [];

    for (int i = currentHour + 1; i < hours.length; i += 2) {
      DateTime date = DateTime.parse(hours[i]["time"]);

      String formattedTime =
          "${date.hour > 12 ? date.hour - 12 : (date.hour == 0 ? 12 : date.hour)}:"
          "${date.minute.toString().padLeft(2, '0')} "
          "${date.hour >= 12 ? "PM" : "AM"}";

      forecast.add({
        "time": formattedTime,
        "temp": hours[i]["temp_c"],
        "weather": hours[i]["condition"]["text"],
        "icon": "https:${hours[i]["condition"]["icon"]}",
      });

      if (forecast.length == 7) break;
    }

    return forecast;
  }
}