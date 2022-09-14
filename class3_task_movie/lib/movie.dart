import 'package:class3_task_movie/production.dart';

import 'cast.dart';

class Movie {
  String name;
  String category;
  double rating;
  Production production;
  List<Cast> cast;

  Movie(
      {required this.name,
      required this.category,
      required this.rating,
      required this.production,
      required this.cast});

  factory Movie.formJson(Map<String, dynamic> map) {
    return Movie(
        name: map['name'],
        category: map['category'],
        rating: map['rating'],
        production: Production.fromJson(map['production']),
        cast: [for (var c in map['cast']) Cast.fromJson(c)]);
  }
}
