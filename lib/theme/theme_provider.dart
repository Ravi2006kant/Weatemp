import 'package:flutter/material.dart';
import 'package:weatemp/theme/theme.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isdark = false;

  bool get isdark => _isdark;

  ThemeData get themeData {
    return _isdark ? darkMode :lightMode ;
  }

  void toggle() {
    _isdark = !_isdark;
    notifyListeners();
  }
}



/*

get because tp now themedata i am confused and also
 not able to process these thigns
*/



// import 'package:flutter/material.dart';
// import 'package:weatemp/theme/theme.dart';

// class ThemeProvider extends ChangeNotifier {
//   ThemeData _themeData = lightMode;

//   ThemeData get themeData => _themeData;

//   // set ThemeData(ThemeData themeData) {
//   //   _themeData = themeData;
//   //   notifyListeners();
//   // }

//   void toggleTheme() {
//     if (_themeData == lightMode) {
//       _themeData = darkMode;
//     } else {
//       _themeData = lightMode;
//     }
//   }
// }

// // /*



// // provider:--

// // change notifier - class

// // notfiy listener - func

// // change notifier provider  - in the node of which other node you wan to change 

// // consumer 




// // */
