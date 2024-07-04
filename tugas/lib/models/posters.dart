import 'package:tugas/data/list.dart';
import 'package:tugas/models/poster.dart';

class Posters{
  late List<Poster> _posters;

  List<Poster> get posters => _posters;

  Posters(){
    _posters = [
      ...list.map((poster) => Poster(
        url: poster["url"],
        name: poster["name"],
        genre: poster["genre"],
        year: poster["year"],
        sinopsis: poster["sinopsis"],
      ))
    ];
  }
}
