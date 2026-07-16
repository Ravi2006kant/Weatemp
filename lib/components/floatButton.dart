import 'dart:developer';
import 'package:weatemp/services/location_service.dart';
import 'package:flutter/material.dart';
import 'package:weatemp/pages/search.dart';

class Floatbutton extends StatelessWidget {
  Function()? tap;
  Floatbutton({super.key, required this.tap});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.white,
      onPressed: tap,
      splashColor: Colors.blue,
      shape: CircleBorder(),
      elevation: 0,
      heroTag: "search",
      tooltip: "current location",
      child: Icon(Icons.location_on, color: Colors.blue, fontWeight: .bold),
    );
  }
}
