import 'package:flutter/material.dart';

class Botnavigation extends StatelessWidget {
  final int index;
  final void Function(int)? ontap;

  const Botnavigation({required this.index, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: index,
      onTap: ontap,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Theme.of(context).colorScheme.primary,
      showSelectedLabels: true,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white,
      selectedLabelStyle: TextStyle(color: Colors.white, fontWeight: .bold),
      unselectedLabelStyle: TextStyle(color: Colors.white),
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: Theme.of(context).colorScheme.secondary,
          ),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.forest_rounded,
            color: Theme.of(context).colorScheme.secondary,
          ),
          label: "Forecast",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.settings,
            color: Theme.of(context).colorScheme.secondary,
          ),
          label: "Settings",
        ),
      ],
    );
  }
}
