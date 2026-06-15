import 'package:flutter/material.dart';
import 'package:weatemp/services/weather_service.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  TextEditingController city = TextEditingController();
  String temp = "";
  String weather = "";
  String feels = "";
  String humidity = "";
  String wind = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: .center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
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
          Text(temp, style: TextStyle(fontSize: 30)),

          ElevatedButton(
            onPressed: () {
              setState(() {
                temp = WeatherService().getWeather(city.text).toString();
              });
            },
            child: Text("click"),
          ),
        ],
      ),
    );
  }
}

/*


 Text("weather" + "$weather"),
          Text("Feels like" + "$feels"),
          Divider(),
          Text("humidity" + "$humidity"),
          Text("wind" + "$wind"),
          Text("Visibility"),





page 3 search city screen 

london tokyo mumbai


page 4 forecast screen

 mon   weather temp

sat weather temp



*/
