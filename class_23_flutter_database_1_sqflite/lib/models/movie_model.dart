const String tableMovie = 'tbl_movie';
const String tblColId = 'id';
const String tblColName = 'name';
const String tblColImage = 'image';
const String tblColDescription = 'description';
const String tblColBudget = 'budget';
const String tblColType = 'type';
const String tblColReleaseDate = 'releaseDate';

class MovieModel {
  int? id;
  String name;
  String image;
  String description;
  double budget;
  String type;
  String releaseDate;

  MovieModel({
    this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.budget,
    required this.type,
    required this.releaseDate,
  });

  factory MovieModel.fromMap(Map<String, dynamic> movieMap) => MovieModel(
        id: movieMap[tblColId],
        name: movieMap[tblColName],
        image: movieMap[tblColImage],
        description: movieMap[tblColDescription],
        budget: movieMap[tblColBudget],
        type: movieMap[tblColType],
        releaseDate: movieMap[tblColReleaseDate],
      );

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      tblColName: name,
      tblColDescription: description,
      tblColImage: image,
      tblColBudget: budget,
      tblColType: type,
      tblColReleaseDate: releaseDate,
    };

    if (id != null) {
      map[tblColId] = id;
    }

    return map;
  }
}
