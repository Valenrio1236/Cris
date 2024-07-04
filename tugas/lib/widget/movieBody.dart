import 'package:flutter/material.dart';
import 'package:tugas/models/posters.dart';
import 'package:tugas/widget/drawer.dart';
import 'package:tugas/widget/posterCard.dart';

class MovieBody extends StatefulWidget {
  MovieBody({super.key, required this.user});

  final Posters _poster = Posters();
  final Map<String, dynamic> user;

  @override
  _MovieBodyState createState() => _MovieBodyState();
}

class _MovieBodyState extends State<MovieBody> {
  final List<String> genres = ["Action", "Adventure", "Comedy", "Horror"];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: genres.length,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Movies",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.black,
          iconTheme: IconThemeData(color: Colors.white),
          bottom: TabBar(
            tabs: genres.map((genre) => Tab(text: genre)).toList(),
            labelColor: Colors.red,
            indicatorColor: Colors.red,
            unselectedLabelColor: Colors.white,
          ),
        ),
        body: TabBarView(
          children: genres.map((genre) {
            final posters = widget._poster.posters.where((poster) => poster.genre == genre).toList();
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 1 / 1.5,
              ),
              itemCount: posters.length,
              itemBuilder: (context, index) {
                final poster = posters[index];
                return PosterCard(poster: poster);
              },
            );
          }).toList(),
        ),
        drawer: Drawers(user: widget.user),
      ),
    );
  }
}
