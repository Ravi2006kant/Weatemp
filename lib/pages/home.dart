import 'package:flutter/material.dart';
import 'package:weatemp/components/Co_appbar.dart';
import 'package:weatemp/components/botnav.dart';

import 'package:weatemp/components/floatButton.dart';
import 'package:weatemp/pages/dashboard.dart';
import 'package:weatemp/pages/forecast.dart';
import 'package:weatemp/pages/setting.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> nav = [Dashboard(), Forecast(), Setting()];
  int ind = 0;
  @override
  void itemTap(int index) {
    setState(() {
      ind = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          "Weatemp",
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontWeight: .bold,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,

      body: nav.elementAt(ind),
      floatingActionButton: Floatbutton(),

      bottomNavigationBar: Botnavigation(index: ind, ontap: itemTap),
    );
  }
}

/*
location 
degree 
weather
feels like 
--------------
humidity 
wind 
visiblity 

bottom navigation home forecase settings


page 3 search city screen 

london tokyo mumbai


page 4 forecast screen

 mon   weather temp

sat weather temp



setting screen 

dark mode 

clucius farhenheigh

use current lovation 
*/
