import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatemp/theme/theme_provider.dart';

class Tile extends StatelessWidget {
  final Text title;
  final bool value;
  final Function(bool)? onChange;

  const Tile({
    super.key,
    required this.title,
    required this.value,
    this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: title,
          trailing: CupertinoSwitch(
            value: value,
            activeTrackColor: Colors.blue.shade400,
            onChanged: onChange,
          ),
        ),
        const Divider(
          color: Colors.grey,
          indent: 10,
          endIndent: 10,
        ),
      ],
    );
  }
}