import 'package:flutter/material.dart';

class BotNav extends StatefulWidget {
  BotNav({super.key, required this.moveNav});

  Function(int index) moveNav;

  @override
  State<BotNav> createState() => _BotNavState();
}

class _BotNavState extends State<BotNav> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: const Color.fromARGB(255, 175, 175, 175),
        currentIndex: currentIndex,
        showUnselectedLabels: false,
        onTap: (int index) {
          widget.moveNav(index);
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorite")
        ]);
  }
}
