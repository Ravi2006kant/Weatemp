import 'package:flutter/material.dart';
import 'package:weatemp/services/location_service.dart';
import 'package:weatemp/services/weather_service.dart';

class Weatherprovider extends ChangeNotifier {
  final WeatherService service = WeatherService();

  Map<String, dynamic> currentWeather = {};

  List<Map<String, dynamic>> forecast = [];

  bool isLoading = false;

  Future<void> searchCity(String city) async {
    isLoading = true;
    notifyListeners();

    currentWeather = await service.getWeather(city);
    forecast = await service.forecast(city);

    isLoading = false;
    notifyListeners();
  }

  Future<void> searchCurrentLocation() async {
    isLoading = true;
    notifyListeners();

    final position = await LocationService().getCurrentLocation();

    currentWeather = await service.weatherByLoc(
      position.latitude,
      position.longitude,
    );

    forecast = await service.forecast(
      currentWeather["city"],
    );

    isLoading = false;
    notifyListeners();
  }
}