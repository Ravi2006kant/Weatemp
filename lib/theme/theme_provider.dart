import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{
  
  bool isdark = false;
  void toggle(){
    isdark = !isdark;
    notifyListeners();
  }
}






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
