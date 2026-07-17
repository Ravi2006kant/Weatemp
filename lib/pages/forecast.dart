import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatemp/providers/weather_provider.dart';

class Forecast extends StatelessWidget {
  const Forecast({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<Weatherprovider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Today's Forecast"),
        centerTitle: true,
      ),
      body: provider.forecast.isEmpty
          ? const Center(
              child: Text(
                "Search a city first",
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.separated(
              itemCount: provider.forecast.length,
              separatorBuilder: (context, index) => Divider(
                color: Colors.grey.shade700,
                indent: 15,
                endIndent: 15,
              ),
              itemBuilder: (context, index) {
                final item = provider.forecast[index];

                return ListTile(
                  leading: Image.network(
                    item["icon"],
                    width: 40,
                    height: 40,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.cloud);
                    },
                  ),
                  title: Text(
                    item["time"],
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Text(item["weather"]),
                  trailing: Text(
                    "${item["temp"]}°C",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              },
            ),
    );
  }
}