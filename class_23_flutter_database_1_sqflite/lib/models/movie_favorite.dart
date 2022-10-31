const String tableFavorite = 'tbl_favorite';
const String tblFavColMovieId = 'movie_id';
const String tblFavColUserId = 'user_id';
const String tblFavColFavorite = 'favorite';

class MovieFavorite {
  int movieId;
  int userId;
  bool favorite;

  MovieFavorite({
    required this.movieId,
    required this.userId,
    this.favorite = false,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      tblFavColMovieId: movieId,
      tblFavColUserId: userId,
      tblFavColFavorite: favorite ? 1 : 0,
    };
  }

  factory MovieFavorite.fromMap(Map<String, dynamic> map) {
    return MovieFavorite(
      movieId: map[tblFavColMovieId],
      userId: map[tblFavColUserId],
      favorite: map[tblFavColFavorite] == 1 ? true : false,
    );
  }
}
