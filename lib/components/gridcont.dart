import 'package:flutter/material.dart';

class Gridcont extends StatelessWidget {
  Icon? iconData;
  String? txt;
  String? value;

  Gridcont({super.key, this.iconData, this.txt, this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Theme.of(context).colorScheme.primary,
        ),
        child: Center(
          child: ListTile(
            leading: iconData,
            title: Text(
              txt ?? "--",
              style: TextStyle(color: Colors.white, fontSize: 10),
            ),
            trailing: Text(value ?? "--"),
          ),
        ),
      ),
    );
  }
}
