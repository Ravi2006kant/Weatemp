import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatemp/theme/theme_provider.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(onPressed: (){
        Provider.of<ThemeProvider>(context,listen: false).toggleTheme();
      }, child: Text("switch")),
    );
  }
}