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



/*

person ringing the bell

 is like the school bell it helps
to tell the student and teachers the time is over


read - work 
watch - see 

changnotifierprovider - till the ring sound goes 

as the final we used is is used because the rebuilding haapens so it 
reassigns  and if we cut the text and write again it will not gonna take

*/



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
