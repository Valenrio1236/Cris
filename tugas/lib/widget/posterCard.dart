import 'package:flutter/material.dart';
import 'package:tugas/models/poster.dart';
import 'package:tugas/screen/filmDetail.dart';

class PosterCard extends StatelessWidget {
  PosterCard({super.key, required this.poster});

  Poster poster;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => FilmDetail(
                    poster: poster,
                  )),
        );
      },
      child: Card(
        color: Color.fromARGB(220, 0, 0, 0),
        margin: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Image.network(
                poster.url,
                fit: BoxFit.fill,
              ),
            ),
            Text(poster.name,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(color: Colors.white)),
            Text(
              poster.year,
              maxLines: 1,
              style: TextStyle(color: Color.fromARGB(255, 154, 154, 154)),
            )
          ],
        ),
      ),
    );
  }
}
