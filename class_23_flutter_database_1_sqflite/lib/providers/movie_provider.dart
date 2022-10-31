import 'package:class_23_flutter_database_1_sqflite/db/db_helper.dart';
import 'package:flutter/widgets.dart';

import '../models/movie_model.dart';

class MovieProvider extends ChangeNotifier {
  List<MovieModel> movieList = [];

  Future<int> insertMovie(MovieModel movieModel) =>
      DbHelper.insertMovie(movieModel);
  Future<void> updateMovie(MovieModel movieModel) async {
    await DbHelper.updateMovie(movieModel);
    getAllMovies();
  }

  void getAllMovies() async {
    movieList = await DbHelper.getAllMovies();
    notifyListeners();
  }

  Future<MovieModel> getMovieById(int id) {
    return DbHelper.getMovieById(id);
  }

  MovieModel getMovieFromList(int id) =>
      movieList.firstWhere((movie) => movie.id == id);

  void deleteMovie(int id) async {
    await DbHelper.deleteMovie(id);
    getAllMovies();
  }
}
