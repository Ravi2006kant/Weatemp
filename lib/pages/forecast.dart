import 'package:flutter/material.dart';
import 'package:weatemp/services/weather_service.dart';

class Forecast extends StatefulWidget {
  const Forecast({super.key});

  @override
  State<Forecast> createState() => _ForecastState();
}

class _ForecastState extends State<Forecast> {
  int? time;
  double? temp;

  List<Map<String, dynamic>> forecast = [];

  @override
  void initState() {
    // TODO: implement initState
    fetchForecast();
  }

  Future<void> fetchForecast() async {
    forecast = await WeatherService().forecast("Delhi");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: const Text(
              "Today's Forecast",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            ),
          ),

          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return ListTile(
                  textColor: Theme.of(context).colorScheme.primary,
                  leading: Image.network(forecast[index]["icon"],width: 40,height: 40,),
                  title:Text(forecast[index]["time"]) ,
                  subtitle:Text(forecast[index]["weather"]) ,
                  trailing: Text("${forecast[index]["temp"]}*C"),
                );
              },
              separatorBuilder: (context, index) => Divider(
                color: Colors.grey.shade800,
                endIndent: 10,
                indent: 10,
              ),
              itemCount: forecast.length,
            ),
          ),
        ],
      ),
    );
  }
}
