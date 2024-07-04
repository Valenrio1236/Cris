import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tugas/models/posters.dart';
import 'package:tugas/screen/eksplorasi.dart';
import 'package:tugas/widget/posterCard.dart';

class Beranda extends StatelessWidget {
  Beranda({super.key});

  final Posters _poster = Posters();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image(
                image: AssetImage('assets/logo.png'),
                height: 40,
                fit: BoxFit.cover),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pouki',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                Text(
                  'Stream',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ],
            ),
          ],
        ),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
            IconButton(
              icon: Icon(Icons.search),
              color: Colors.white,
              onPressed: () {
                Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Eksplorasi()),
                        );
              },
            ),
          ],
      ),
      backgroundColor: Color.fromARGB(220, 0, 0, 0),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Image.network(
              'https://i.ebayimg.com/images/g/GtEAAOSw1W9eN1cY/s-l1600.jpg',
              fit: BoxFit.cover,
              height: 300,
            ),
            SizedBox(height: 20),
            Text("Trending", style: TextStyle(color: Colors.grey, fontSize: 20, fontWeight: FontWeight.w900)),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 1 / 1.5,
                ),
                itemCount: _poster.posters.length,
                itemBuilder: (context, index) {
                  final poster = _poster.posters[index];
                  return PosterCard(poster: poster);
                },
              ),
            ),
          ],
        ),
      ),
    );          
  }
}
