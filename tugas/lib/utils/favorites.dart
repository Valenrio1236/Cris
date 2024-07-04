import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas/models/poster.dart';

class Favorites with ChangeNotifier {
  List<Poster> _favorites = [];
  List<Poster> get favorites => _favorites;

  void checkFavorite(Poster favorite) {
    final isExist = _favorites.contains(favorite);
    if (isExist) {
      _favorites.remove(favorite);
    } else {
      _favorites.add(favorite);
    }
    notifyListeners();
  }

  bool isExist(Poster favorite) {
    final isExist = _favorites.contains(favorite);
    return isExist;
  }

  static Favorites of(
    BuildContext context, {
    bool listen = true,
  }) {
    return Provider.of<Favorites>(
      context,
      listen: listen,
    );
  }
}
