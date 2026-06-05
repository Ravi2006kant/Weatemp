import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatemp/components/tile.dart';
import 'package:weatemp/theme/theme_provider.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(
        children: [
          SizedBox(height: 10,),
          Tile(title: Text("Dark Mode")),
          Tile(title: Text("Change Temperature Unit(C/F)")),
          Tile(title: Text("Use Current Location")),
        ],
      ),
    );
  }
}
