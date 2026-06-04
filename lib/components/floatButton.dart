import 'package:flutter/material.dart';
import 'package:weatemp/pages/search.dart';

class Floatbutton extends StatelessWidget {
  const Floatbutton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Search()),
        );
      },
      splashColor: Colors.white,
      shape: CircleBorder(),
      elevation: 0,
      heroTag: "search",
      child: Icon(Icons.search, color: Colors.white, fontWeight: .bold),
    );
  }
}
