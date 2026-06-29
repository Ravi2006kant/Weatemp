import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatemp/pages/home.dart';
import 'package:weatemp/pages/setting.dart';
import 'package:weatemp/theme/theme.dart';
import 'package:weatemp/theme/theme_provider.dart';

void main() async {
  runApp(const MainApp());
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
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: MaterialApp(
        home: Home(),
        debugShowCheckedModeBanner: false,
        theme: darkMode,
      ),
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
