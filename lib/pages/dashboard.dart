import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatemp/components/floatButton.dart';
import 'package:weatemp/components/infoRow.dart';
import 'package:weatemp/components/listhelo.dart';
import 'package:weatemp/providers/weather_provider.dart';
import 'package:weatemp/services/location_service.dart';
import 'package:weatemp/services/weather_service.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final TextEditingController city = TextEditingController();

  Future<void> fetchTemp() async {
    await context.read<Weatherprovider>().searchCity(city.text);
  }

  Future<void> location() async {
    final position = await LocationService().getCurrentLocation();

    final result = await WeatherService().weatherByLoc(
      position.latitude,
      position.longitude,
    );

    final provider = context.read<Weatherprovider>();

    provider.currentWeather = result;
    provider.forecast = await WeatherService().forecast(
      result["city"],
    );

    provider.notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<Weatherprovider>();

    List<Map<String, dynamic>> grid = [
      {
        "icon": Icon(Icons.water, color: Colors.blueAccent.shade700),
        "title": "Humidity",
        "value": provider.currentWeather.isEmpty
            ? "--"
            : "${provider.currentWeather["humidity"]}%",
      },
      {
        "icon": const Icon(Icons.air, color: Colors.white),
        "title": "Wind Speed",
        "value": provider.currentWeather.isEmpty
            ? "--"
            : "${provider.currentWeather["wind"]} km/h",
      },
      {
        "icon": const Icon(Icons.visibility_outlined, color: Colors.grey),
        "title": "Visibility",
        "value": provider.currentWeather.isEmpty
            ? "--"
            : "${provider.currentWeather["visibility"]} km",
      },
      {
        "icon": const Icon(Icons.speed, color: Colors.orange),
        "title": "Pressure",
        "value": provider.currentWeather.isEmpty
            ? "--"
            : "${provider.currentWeather["pressure"]} hPa",
      },
    ];

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        controller: city,
                        decoration: InputDecoration(
                          hintText: "Enter city name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: fetchTemp,
                    icon: const Icon(Icons.arrow_forward_ios_sharp),
                    color: Colors.blue,
                  ),
                ],
              ),

              Card(
                margin: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Inforow(
                      color: Colors.yellow,
                      iconData: Icons.location_city_rounded,
                      title: "City Name",
                      weatData: provider.currentWeather.isEmpty
                          ? "--"
                          : city.text.toUpperCase(),
                    ),

                    Inforow(
                      color: Colors.red,
                      iconData: Icons.thermostat,
                      title: "Temperature",
                      weatData: provider.currentWeather.isEmpty
                          ? "--"
                          : "${provider.currentWeather["temp"]} °C",
                    ),

                    Inforow(
                      color: Colors.lightBlue,
                      iconData: Icons.cloud,
                      title: "Weather",
                      weatData: provider.currentWeather.isEmpty
                          ? "--"
                          : provider.currentWeather["weather"].toString(),
                    ),

                    Inforow(
                      color: Colors.amber,
                      iconData: Icons.stacked_line_chart_rounded,
                      title: "Feels Like",
                      weatData: provider.currentWeather.isEmpty
                          ? "--"
                          : "${provider.currentWeather["feels"]} °C",
                    ),

                    Inforow(
                      color: Colors.deepPurple,
                      iconData: Icons.access_time,
                      title: "Updated At",
                      weatData: provider.currentWeather.isEmpty
                          ? "--"
                          : provider.currentWeather["time"].toString(),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: grid.length,
                  itemBuilder: (context, index) {
                    return Listhelo(
                      iconData: grid[index]["icon"],
                      txt: grid[index]["title"],
                      value: grid[index]["value"],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Floatbutton(
        tap: location,
      ),
    );
  }
}