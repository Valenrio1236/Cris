import 'package:flutter/material.dart';
import 'package:tugas/models/posters.dart';
import 'package:tugas/widget/posterCard.dart';

class Eksplorasi extends StatefulWidget {
  const Eksplorasi({super.key});

  @override
  State<Eksplorasi> createState() => _EksplorasiState();
}

class _EksplorasiState extends State<Eksplorasi> {
  int? _value = 1;

  final Posters _poster = Posters();

  final List<String> _year = ["2021", "2022", "2023", "2024"];

  final Set<String> _filterYear = {};

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
      ),
      backgroundColor: Color.fromARGB(220, 0, 0, 0),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            SizedBox(height: 8),
            Row(
              children: [
                Text("Year : ", style: TextStyle(color: Colors.white)),
                ..._year.map((i) {
                  return FilterChip(
                    label: Text(i),
                    selected: _filterYear.contains(i),
                    onSelected: (selected) {
                      setState(() {
                        if (selected) {
                          _filterYear.add(i);
                        } else {
                          _filterYear.remove(i);
                        }
                      });
                    },
                  );
                })
              ],
            ),
            SizedBox(height: 20),
            Text("Result",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                    fontWeight: FontWeight.w900)),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 1 / 1.5,
                ),
                itemCount: _poster.posters
                    .where((poster) => _filterYear.contains(poster.year))
                    .length,
                itemBuilder: (context, index) {
                  final posters = _poster.posters
                      .where((poster) => _filterYear.contains(poster.year))
                      .toList();
                  final poster = posters[index];
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
