import 'package:flutter/material.dart';
import 'package:weatemp/components/floatButton.dart';
import 'package:weatemp/components/gridcont.dart';
import 'package:weatemp/components/listhelo.dart';
import 'package:weatemp/components/infoRow.dart';
import 'package:weatemp/services/location_service.dart';
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
  double? farh;

  // double celcius = double.parse(tempunit.text)
  //   void unitchage() {
  //     farh = (tempunit.hashCode * 9 / 5) + 32;
  //   }
  Future location() async {
    final position = await LocationService().getCurrentLocation();
    final result = await WeatherService().weatherByLoc(
      position.latitude,
      position.longitude,
    );

    setState(() {
      temp = result['temp'];
      weather = result['weather'];
      feels = result['feels'];
      time = result['time'];
    });
  }

  Future<void> fetchTemp() async {
    final result = await WeatherService().getWeather(city.text);

    setState(() {
      temp = result['temp'];
      weather = result['weather'];
      feels = result['feels'];
      time = result['time'];
    });
  }

  List<Map<String, dynamic>> grid = [
    {
      "icon": Icon(Icons.water, color: Colors.blueAccent.shade700),
      "title": "humidity",
      "value": "25%",
    },
    {
      "icon": Icon(Icons.air, color: Colors.white),
      "title": "Wind Speed",
      "value": "25 km/h",
    },
    {
      "icon": Icon(Icons.visibility_outlined, color: Colors.grey),
      "title": "Visibility",
      "value": "25km",
    },
    {
      "icon": Icon(Icons.speed, color: Colors.orange),
      "title": "Pressure",
      "value": "hPa",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: .end,
          crossAxisAlignment: .end,
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
                    color: Colors.yellow,
                    iconData: Icons.location_city_rounded,
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

                  // Inforow(iconData: , title:"WEather", weatData:)
                ],
              ),
            ),

            // Expanded(
            //   child: Padding(
            //     padding: const EdgeInsets.all(8),
            //     child: GridView.builder(
            //       itemCount: 4,

            //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //         crossAxisCount: 2,
            //         childAspectRatio: 2.9,
            //         mainAxisSpacing: 4,
            //       ),
            //       itemBuilder: (context, index) {
            //         // final item = grid[index];

            //         return Listhelo(
            //           iconData: grid[index]["icon"],
            //           txt: grid[index]["title"],
            //           value: grid[index]["value"],
            //         );
            //         // return Gridcont(
            //         //   iconData: item["icon"],
            //         //   txt: item["title"],
            //         //   value: item["value"],
            //         // );
            //       },
            //     ),
            //   ),
            // ),
            Expanded(
              child: ListView.builder(
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
      floatingActionButton: Floatbutton(tap: () => location()),
    );
  }
}

/*

// Expanded(
                  //   child: GridView.builder(
                  //     gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  //       maxCrossAxisExtent: 2,
                  //     ),
                  //     itemBuilder: (context, index) {
                  //       return ListTile();
                  //     },
                  //   ),
                  // ),

                  // TextField(
                  //   controller: tempunit,
                  //   keyboardType: TextInputType.number,
                  //   decoration: InputDecoration(
                  //     hintText: "Enter city name",
                  //     border: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(20),
                  //     ),
                  //   ),
                  // ),
                  // Text(farh.toString() == "null" ? "null" : farh.toString()),


*/

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
