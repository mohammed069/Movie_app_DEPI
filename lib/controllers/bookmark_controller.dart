import 'package:depi_film_app/models/movie_model.dart';
import 'package:flutter/material.dart';

class BookmarkController extends ChangeNotifier {
  final List<MovieModel> _bookmarkedMovies = [];

  List<MovieModel> get bookmarkedMovies => _bookmarkedMovies;

  void addBookmark(MovieModel movie) {
    _bookmarkedMovies.add(movie);
    notifyListeners();
  }

  void removeBookmark(MovieModel movie) {
    _bookmarkedMovies.remove(movie);
    notifyListeners();
  }
}
