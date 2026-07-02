import 'package:flutter/material.dart';

class Tempunitprovider extends ChangeNotifier{
  bool _isCelsius = true;

  bool get isCelsius => _isCelsius;

String fahr = "(C * 9 / 5) + 32";

  void unitToggle(){

    notifyListeners();
  }
}