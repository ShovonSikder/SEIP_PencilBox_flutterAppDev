import 'package:class_23_flutter_database_1_sqflite/db/db_helper.dart';
import 'package:flutter/material.dart';

import '../models/movie_rating.dart';
import '../models/user_model.dart';

class UserProvider extends ChangeNotifier {
  late UserModel userModel;
  Future<UserModel?> getUserByEmail(String email) async {
    return DbHelper.getUserByEmail(email);
  }

  Future<void> getUserById(int id) async {
    userModel = await DbHelper.getUserById(id);
    // notifyListeners();
  }

  Future<int> insertUser(UserModel userModel) => DbHelper.insertUser(userModel);

  Future<bool> didUserRate(
    int movieId,
  ) =>
      DbHelper.didUserRate(movieId, userModel.userId!);

  Future<int> updateRating(MovieRating movieRating) =>
      DbHelper.updateRating(movieRating);

  Future<int> insertRating(MovieRating movieRating) =>
      DbHelper.insertRating(movieRating);

  Future<Map<String, dynamic>> getAvgRatingByMovieId(int id) =>
      DbHelper.getAvgRatingByMovieId(id);

  Future<List<MovieRating>> getCommentsByMovieId(int id) =>
      DbHelper.getCommentsByMovieId(id);
}
