import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tile extends StatefulWidget {
  Text title;
  Tile({super.key, required this.title});

  @override
  State<Tile> createState() => _TileState();
}

class _TileState extends State<Tile> {
  bool val = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: widget.title,
          trailing: CupertinoSwitch(
            value: val,
            activeTrackColor: Colors.blue.shade400,
            onChanged: (value) {
              setState(() {
                val = !val;
              });
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text("Clicked")));
            },
          ),
        ),
        Divider(color: Colors.grey, indent: 10, endIndent: 10),
      ],
    );
  }
}
