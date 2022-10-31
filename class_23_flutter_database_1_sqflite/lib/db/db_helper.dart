import 'package:class_23_flutter_database_1_sqflite/models/movie_favorite.dart';
import 'package:class_23_flutter_database_1_sqflite/models/movie_model.dart';
import 'package:class_23_flutter_database_1_sqflite/models/movie_rating.dart';
import 'package:class_23_flutter_database_1_sqflite/models/user_model.dart';
import 'package:class_23_flutter_database_1_sqflite/utils/constants.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as Path;

class DbHelper {
  static const String createTableMovie = '''create table $tableMovie(
  $tblColId integer primary key autoincrement,
  $tblColName text,
  $tblColDescription text,
  $tblColType text,
  $tblColImage text,
  $tblColReleaseDate text,
  $tblColBudget real)''';

  static const String createTableUser = '''create table $tableUser(
  $tblUserColId integer primary key autoincrement,
  $tblUserColEmail text,
  $tblUserColPassword text,
  $tblUserColAdmin integer
  )''';

  static const String createTableRating = '''create table $tableRating(
  $tblRatingColMovieId integer,
  $tblRatingColUserId integer,
  $tblRatingColDate text,
  $tblRatingColUserReviews text,
  $tblColRating real)''';

  static const String createTableFavorite = '''create table $tableFavorite(
  $tblFavColMovieId integer,
  $tblFavColUserId integer,
  $tblFavColFavorite integer)''';

  static Future<Database> open() async {
    final rootPath = await getDatabasesPath();
    final dbPath = Path.join(rootPath, 'movie_db');

    return openDatabase(dbPath, version: 3, onCreate: (db, version) async {
      await db.execute(createTableMovie);
      await db.execute(createTableUser);
      await db.execute(createTableRating);
      await db.execute(createTableFavorite);
    }, onUpgrade: (db, oldVersion, newVersion) {
      if (newVersion == 3) {
        db.execute(
            'alter table $tableUser add column $tblUserColAdmin integer');
      }
    });
  }

  static Future<int> insertMovie(MovieModel movieModel) async {
    final db = await open();
    return db.insert(tableMovie, movieModel.toMap());
  }

  static Future<int> insertRating(MovieRating movieRating) async {
    final db = await open();
    return db.insert(tableRating, movieRating.toMap());
  }

  static Future<int> updateRating(MovieRating movieRating) async {
    final db = await open();
    return db.update(tableRating, movieRating.toMap(),
        where: '$tblRatingColMovieId = ? and $tblRatingColUserId = ?',
        whereArgs: [movieRating.movie_id, movieRating.user_id]);
  }

  static Future<List<MovieRating>> getCommentsByMovieId(int id) async {
    final db = await open();
    final mapList = await db.query(tableRating,
        where: '$tblRatingColUserReviews = ?', whereArgs: [id]);
    return List.generate(
        mapList.length, (row) => MovieRating.fromMap(mapList[row]));
  }

  static Future<Map<String, dynamic>> getAvgRatingByMovieId(int id) async {
    final db = await open();
    final mapList = await db.rawQuery(
        'SELECT AVG($tblColRating) as $avgRating FROM $tableRating WHERE $tblRatingColMovieId = $id');
    return mapList.first;
  }

  static Future<int> updateMovie(MovieModel movieModel) async {
    final db = await open();
    return db.update(tableMovie, movieModel.toMap(),
        where: '$tblColId = ?', whereArgs: [movieModel.id]);
  }

  static Future<List<MovieModel>> getAllMovies() async {
    final db = await open();
    final mapList = await db.query(tableMovie); //return list of maps
    return List.generate(
        mapList.length, (row) => MovieModel.fromMap(mapList[row]));
  }

  static Future<MovieModel> getMovieById(int id) async {
    final db = await open();
    final mapList = await db.query(tableMovie,
        where: '$tblColId = ? ', whereArgs: [id]); //return list of maps
    return MovieModel.fromMap(mapList.first);
  }

  static Future<bool> didUserRate(int movieId, int userId) async {
    final db = await open();
    final mapList = await db.query(tableRating,
        where: '$tblRatingColMovieId = ? and $tblRatingColUserId = ?',
        whereArgs: [movieId, userId]);
    return mapList.isNotEmpty;
  }

  static Future<int> deleteMovie(int id) async {
    final db = await open();
    return await db.delete(tableMovie,
        where: '$tblColId = ? ', whereArgs: [id]); //return list of maps
  }

  static Future<UserModel?> getUserByEmail(String email) async {
    final db = await open();
    final mapList = await db.query(tableUser,
        where: '$tblUserColEmail = ? ',
        whereArgs: [email]); //return list of maps
    if (mapList.isEmpty) return null;
    return UserModel.fromMap(mapList.first);
  }

  static Future<UserModel> getUserById(int id) async {
    final db = await open();
    final mapList = await db.query(tableUser,
        where: '$tblUserColId = ? ', whereArgs: [id]); //return list of maps
    return UserModel.fromMap(mapList.first);
  }

  static Future<int> insertUser(UserModel userModel) async {
    final db = await open();
    return db.insert(tableUser, userModel.toMap());
  }
}
