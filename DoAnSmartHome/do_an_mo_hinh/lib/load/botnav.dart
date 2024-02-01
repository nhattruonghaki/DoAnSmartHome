import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key, required this.idx});
  final idx;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Color.fromARGB(9, 255, 255, 255),
      fixedColor: Colors.blue,
      unselectedItemColor: Colors.black,
      items: const [
        BottomNavigationBarItem(
          label: "Display",
          icon: Icon(Icons.maps_home_work_outlined),
        ),
        BottomNavigationBarItem(
          label: "Home",
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: "Profile",
          icon: Icon(Icons.account_circle),
        ),
        BottomNavigationBarItem(
          label: "Setting",
          icon: Icon(Icons.settings),
        ),
      ],
      currentIndex: idx,
      onTap: (int indexOfItem) {
        if (indexOfItem == 0 &&
            ModalRoute.of(context)?.settings.name != '/homepage') {
          Navigator.popUntil(context, (route) => route.isFirst);
          Navigator.pushReplacementNamed(context, '/homepage');
        } else if (indexOfItem == 1 &&
            ModalRoute.of(context)?.settings.name != '/home') {
          Navigator.popUntil(context, (route) => route.isFirst);
          Navigator.pushNamed(context, '/home');
        } else if (indexOfItem == 2 &&
          ModalRoute.of(context)?.settings.name != '/profile') {
          Navigator.popUntil(context, (route) => route.isFirst);
          Navigator.pushNamed(context, '/profile');
        } else if (indexOfItem == 3 &&
            ModalRoute.of(context)?.settings.name != '/setting') {
          Navigator.popUntil(context, (route) => route.isFirst);
          Navigator.pushNamed(context, '/setting');
        } 
      },
    );
  }
}
