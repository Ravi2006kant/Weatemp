import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatemp/secrets/apikey.dart';

class WeatherService {
  String apik = Apikey.api; //api is stored here

  Future<Map<String, dynamic>> getWeather(String city) async {
    final url =
        "https://api.weatherapi.com/v1/current.json?key=$apik&q=$city"; // server address stored
    Uri uri = Uri.parse(url); // this will convert into the http format then
    var response = await http.get(
      uri,
    ); // http calls the server go to the endpoint through thte help of api then repsonse stored in repsonse
    var data = jsonDecode(
      response.body,
    ); //jsondecode will now decode the data into flutter / dart object
    print(data);

    return {
      "temp": data['current']['temp_c'], // can show data now from here
      "weather": data['current']['condition']['text'],
      "feels": data['current']['feelslike_c'],
      "time": data["location"]["localtime"].split(" ")[1],
      // "condition":data[]
    };
    // print(data['current']['humidity']);
    // print(data['current']['wind_kph']);
    // print(data['current']['vis_km']);
    // print(data['current']['condition']['text']);
  }

  Future<Map<String, dynamic>> weatherByLoc(
    double latitude,
    double longitute,
  ) async {
    final url =
        "https://api.weatherapi.com/v1/current.json?key=$apik&q=$latitude,$longitute"; // server address stored
    Uri uri = Uri.parse(url); // this will convert into the http format then
    var response = await http.get(
      uri,
    ); // http calls the server go to the endpoint through thte help of api then repsonse stored in repsonse
    var data = jsonDecode(
      response.body,
    ); //jsondecode will now decode the data into flutter / dart object
    print(data);

    return {
      "city": data['location']['name'],
      "temp": data['current']['temp_c'], // can show data now from here
      "weather": data['current']['condition']['text'],
      "feels": data['current']['feelslike_c'],
      "time": data["location"]["localtime"].split(" ")[1],
      // "condition":data[]
    };
  }
}
