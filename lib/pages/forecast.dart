import 'package:flutter/material.dart';

class Forecast extends StatefulWidget {
  const Forecast({super.key});

  @override
  State<Forecast> createState() => _ForecastState();
}

class _ForecastState extends State<Forecast> {
  int? time;

  double? temp;

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
                  leading: Text("Time"),
                  title: Text("weather symbol"),
                  trailing: Text("Temp"),
                );
              },
              separatorBuilder: (context, index) => Divider(
                color: Colors.grey.shade800,
                endIndent: 10,
                indent: 10,
              ),
              itemCount: 7,
            ),
          ),
        ],
      ),
    );
  }
}
