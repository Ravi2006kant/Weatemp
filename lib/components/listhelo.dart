import 'package:flutter/material.dart';

class Listhelo extends StatelessWidget {
  Icon? iconData;
  String? txt;
  String? value;

  Listhelo({super.key, this.iconData, this.txt, this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Theme.of(context).colorScheme.primary,
        ),
        child: Row(
          children: [
            SizedBox(width: 15),
            ?iconData,
            SizedBox(width: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(txt ?? "--", style: TextStyle(color: Colors.white)),
            ),
            SizedBox(width: 10),
            Text(value ?? "--", style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// class Listhelo extends StatelessWidget {
//   const Listhelo({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(5),
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(25),
//           color: Theme.of(context).colorScheme.primary,
//         ),
//         child: Row(
//           children: [
//             SizedBox(width: 15),
//             Icon(Icons.water, color: Colors.blueAccent.shade700),
//             SizedBox(width: 10),
//             Text("humidity"),
//             SizedBox(width: 10),
//             Text("25%"),
//           ],
//         ),
//       ),
//     );
//   }
// }
