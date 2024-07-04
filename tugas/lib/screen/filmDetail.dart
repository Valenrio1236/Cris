import 'package:flutter/material.dart';
import 'package:tugas/models/favorites.dart';
import 'package:tugas/models/poster.dart';
import 'dart:math';

class FilmDetail extends StatefulWidget {
  FilmDetail({Key? key, required this.poster}) : super(key: key);

  final Poster poster;

  @override
  State<FilmDetail> createState() => _FilmDetailState();
}

class _FilmDetailState extends State<FilmDetail> {
  int likeCount = Random().nextInt(100);
  bool like = false;
  int dislikeCount = Random().nextInt(100);
  bool dislike = false;

  void incrementLike() {
    setState(() {
      if (!like) {
        likeCount += 1;
        like = true;
      } else {
        likeCount -= 1;
        like = false;
      }
    });
  }

  void incrementDislike() {
    setState(() {
      if (!dislike) {
        dislikeCount += 1;
        dislike = true;
      } else {
        dislikeCount -= 1;
        dislike = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Favorites.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Film Detail',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              provider.checkFavorite(widget.poster);
            },
            icon: provider.isExist(widget.poster)
                ? const Icon(Icons.favorite, color: Colors.red)
                : const Icon(Icons.favorite_border, color: Colors.red),
          )
        ],
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      backgroundColor: Color.fromARGB(220, 0, 0, 0),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Image.network(
                    widget.poster.url,
                    fit: BoxFit.fill,
                    height: 260,
                  ),
                ),
                SizedBox(width: 24),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.poster.name,
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        "(${widget.poster.year})",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 194, 194, 194),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        widget.poster.genre,
                        style: TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 32),
                      Row(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {
                              incrementLike();
                            },
                            child: Row(
                              children: [
                                Icon(
                                  like
                                      ? Icons.thumb_up_alt_rounded
                                      : Icons.thumb_up_alt_outlined,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  "($likeCount)",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(width: 12),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {
                              incrementDislike();
                            },
                            child: Row(
                              children: [
                                Icon(
                                  dislike
                                      ? Icons.thumb_down_alt_rounded
                                      : Icons.thumb_down_alt_outlined,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  "($dislikeCount)",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Text(
              'Sinopsis:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              widget.poster.sinopsis,
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.play_arrow),
        backgroundColor: Colors.white,
      ),
    );
  }
}
