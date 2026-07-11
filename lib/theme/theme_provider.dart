import 'package:flutter/material.dart';
import 'package:weatemp/theme/theme.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isdark = false; // button switch

  bool get isdark => _isdark; //false is dark

  ThemeData get themeData {
    return _isdark ? darkMode : lightMode;
  }

  void toggle() {
    _isdark = !_isdark; //button click change
    print("button clicked true");
    notifyListeners(); // school bell
  }
}
