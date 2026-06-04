import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hello"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Hero(tag: "search", child: Text("baby")),
    );
  }
}
