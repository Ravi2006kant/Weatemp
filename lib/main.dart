import 'package:flutter/material.dart';

import 'package:weatemp/firebase_options.dart';
import 'package:weatemp/pages/home.dart';
import 'package:weatemp/pages/login.dart';
import 'package:weatemp/theme/theme_provider.dart';

void main() async {
  // WidgetsFlutterBinding();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // runApp(
  //   ChangeNotifierProvider(
  //     create: (context) => ThemeProvider(),
  //     child: MainApp(),
  //   ),
  // );
  const MainApp();
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Login(),
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
