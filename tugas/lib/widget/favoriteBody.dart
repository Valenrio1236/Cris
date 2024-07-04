import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas/models/favorites.dart';
import 'package:tugas/models/poster.dart';
import 'package:tugas/widget/favoriteCard.dart';

class FavoriteBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<Favorites>(context);
    final List<Poster> favorites = favoritesProvider.favorites;

    return Scaffold(
        backgroundColor: Color.fromARGB(220, 0, 0, 0),
        body: Padding(
          padding: EdgeInsets.all(12),
          child: favorites.isEmpty
              ? Center(
                  child: Text(
                    'Film Favorite Tidak Ditemukan',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                )
              : ListView.builder(
                  itemCount: favorites.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 4.0),
                      child: FavoriteCard(poster: favorites[index]),
                    );
                  },
                ),
        ));
  }
}
