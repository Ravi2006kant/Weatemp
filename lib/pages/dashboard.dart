import 'package:flutter/material.dart';
import 'package:weatemp/components/infoRow.dart';
import 'package:weatemp/services/weather_service.dart';
import 'package:weatemp/theme/theme.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  TextEditingController city = TextEditingController();

  bool isLoading = false;
  double? temp;
  String? time;
  String? weather;
  double? feels;
  String? humidity;
  String? wind;

  Future<void> fetchTemp() async {
    print("Button Pressed");

    final result = await WeatherService().getWeather(city.text);

    print(result);

    setState(() {
      temp = result['temp'];
      weather = result['weather'];
      feels = result['feels'];
      time = result['time'];

      print("setState called");
    });

    print("fetchTemp finished");
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SafeArea(
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
                  color: Colors.blue,
                  icon: const Icon(Icons.arrow_forward_ios_sharp),
                ),
              ],
            ),

            Card(
              color: Theme.of(context).colorScheme.primary,
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  Inforow(
                    color: Colors.white,
                    iconData: Icons.location_pin,
                    title: "City Name",
                    
                    weatData: city.text == "" ? "--" : city.text.toUpperCase(),
                  ),

                  Inforow(
                    color: Colors.red,
                    iconData: Icons.thermostat_rounded,
                    title: "Temperature",
                    weatData: temp == null ? "--" : temp.toString(),
                  ),

                  Inforow(
                    color: Colors.lightBlue,
                    iconData: Icons.cloud_rounded,
                    title: "Weather",
                    weatData: weather == null ? "--" : weather.toString(),
                    //add a weather emoji as well from this one
                  ),

                  Inforow(
                    color: Colors.amber,
                    iconData: Icons.stacked_line_chart_rounded,
                    title: "Feels like",
                    weatData: feels == null ? "--" : feels.toString(),
                  ),

                  Inforow(
                    color: Colors.deepPurple.shade400,
                    iconData: Icons.alarm_outlined,
                    title: "Updated at",
                    weatData: time == null ? "--" : time.toString(),
                  ),
                ],
              ),
            ),
            // Expanded(
            //   child: GridView.builder(
            //     itemCount: 4,
            //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //       crossAxisCount: 2,
            //     ),
            //     itemBuilder: (context, index) {
            //       return Container(color: Colors.red);
            //     },
            //   ),
            // ),
          ],
        ),
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

mon weather temp

sat weather temp

*/
