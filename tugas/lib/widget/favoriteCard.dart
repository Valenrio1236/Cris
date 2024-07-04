import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas/models/favorites.dart';
import 'package:tugas/models/poster.dart';
import 'package:tugas/screen/filmDetail.dart';

class FavoriteCard extends StatelessWidget {
  final Poster poster;

  FavoriteCard({Key? key, required this.poster}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<Favorites>(context);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FilmDetail(poster: poster),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 241, 241, 241),
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  '${poster.name} (${poster.year})',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                poster.genre,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                poster.sinopsis,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          trailing: IconButton(
            onPressed: () {
              favoritesProvider.checkFavorite(poster);
            },
            icon: Icon(
              Icons.favorite,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
