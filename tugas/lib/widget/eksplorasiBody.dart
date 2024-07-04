import 'package:flutter/material.dart';
import 'package:tugas/models/posters.dart';
import 'package:tugas/widget/posterCard.dart';

class EksplorasiBody extends StatefulWidget {
  const EksplorasiBody({super.key});

  @override
  State<EksplorasiBody> createState() => _EksplorasiBodyState();
}

class _EksplorasiBodyState extends State<EksplorasiBody> {
  final Posters _poster = Posters();

  final List<String> _year = ["2021", "2022", "2023", "2024"];

  final Set<String> _filterYear = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
