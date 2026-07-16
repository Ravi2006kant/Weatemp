import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class Botnavigation extends StatelessWidget {
  final int indexc;
  final void Function(int)? ontap;

  const Botnavigation({super.key, required this.indexc, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      index: indexc,
      onTap: ontap,
      animationCurve: Easing.legacy,
      height: 55,
      color: Theme.of(context).colorScheme.primary,
      backgroundColor: Theme.of(context).colorScheme.surface,

      items: [
        Icon(Icons.home, color: Theme.of(context).colorScheme.secondary),
        Icon(
          Icons.forest_rounded,
          color: Theme.of(context).colorScheme.secondary,
        ),
        Icon(Icons.settings, color: Theme.of(context).colorScheme.secondary),
      ],
    );
  }
}


/*

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

*/