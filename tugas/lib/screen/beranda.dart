import 'package:flutter/material.dart';
import 'package:tugas/utills/nav.dart';
import 'package:tugas/widget/botNav.dart';
import 'package:tugas/widget/drawer.dart';

class Beranda extends StatefulWidget {
  Beranda({super.key, required this.user});

  Map<String, dynamic> user;

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  int _currentIndex = 0;

  void moveNav(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  List<String> title = ["Home", "Search", "Favorite"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          title[_currentIndex],
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      drawer: Drawers(user: widget.user),
      backgroundColor: Color.fromARGB(220, 0, 0, 0),
      body: bodyContent[_currentIndex],
      bottomNavigationBar: BotNav(moveNav: moveNav),
    );
  }
}
