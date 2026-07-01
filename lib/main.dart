import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatemp/pages/home.dart';

import 'package:weatemp/theme/theme_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MainApp(),
    ),
  );

  // WidgetsFlutterBinding();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // runApp(
  //   ChangeNotifierProvider(
  //     create: (context) => ThemeProvider(),
  //     child: MainApp(),
  //   ),
  // );
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
    //   home: ChangeNotifierProvider(
    //     create: (context) => ThemeProvider(),
    //     child: Home(),
    //   ),
    //   debugShowCheckedModeBanner: false,
    //   theme: Provider.of<ThemeProvider>(context).themeData,
    // );
  }
}
