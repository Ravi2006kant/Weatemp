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

  String? weather;
  String? feels;
  String? humidity;
  String? wind;

  Future<void> fetchTemp() async {
    final result = await WeatherService().getWeather(
      city.text,
    ); // this will call the getweather function from the weather service and store the result in result variable
    setState(() {
      isLoading = true;
      temp = result['temp'];
      weather = result['weather'];
      feels = result['feels'];
    });
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
                    color: Colors.blue,
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
                    iconData: Icons.cloud_rounded,
                    title: "Weather",
                    weatData: weather == null ? "--" : weather.toString(),
                    //add a weather emoji as well from this one
                  ),

                  Inforow(
                    iconData: Icons.stacked_line_chart_rounded,
                    title: "Feels like",
                    weatData: feels == null ? "--" : feels.toString(),
                  ),

                  Inforow(
                    iconData: Icons.alarm_outlined,
                    title: "Updated at",
                    weatData: DateTime.now().toString(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



  /*      Expanded(
              // height: 200,
              // color: Colors.white,
              // margin: EdgeInsets.all(10),
              // padding: EdgeInsets.only(left: 15, top: 15),
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return Text("hello", style: TextStyle(color: Colors.red));
                },
                separatorBuilder: (context, index) {
                  return Divider(color: Colors.black, endIndent: 15);
                },
                itemCount: 5,
              ),
            ),

            Container(
              width: 100,
              height: 100,
              color: Colors.lightBlue,
              child: GridView.builder(
                itemCount: 4,

                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.red,
                    ),
                  );
                },
              ),
            ),
            
            
            
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
