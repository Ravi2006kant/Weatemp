import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatemp/pages/home.dart';
import 'package:weatemp/providers/weather_provider.dart';
import 'package:weatemp/theme/theme_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => Weatherprovider()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
      theme: themeProvider.themeData,
    );
  }
}
