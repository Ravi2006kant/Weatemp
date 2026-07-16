import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatemp/components/tile.dart';
import 'package:weatemp/services/weather_service.dart';
import 'package:weatemp/theme/theme_provider.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 10),

          Tile(
            title: const Text("Dark Mode"),
            value: context.watch<ThemeProvider>().isdark,
            onChange: (value) {
              context.read<ThemeProvider>().toggle();
            },
          ),

          Tile(title: const Text("Change Temperature Unit(C/F)"), value: false),

          
        ],
      ),
    );
  }
}
