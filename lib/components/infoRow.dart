import 'package:flutter/material.dart';

class Inforow extends StatelessWidget {
  IconData iconData;
  String title;
  String weatData;
  Color? color;
  Inforow({
    super.key,
    required this.iconData,
    required this.title,
    this.color,
    required this.weatData,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(iconData, color: color),
      title: Text(title),
      textColor: Colors.white,
      trailing: Text(weatData, style: TextStyle(fontSize: 15)),
    );
  }
}
