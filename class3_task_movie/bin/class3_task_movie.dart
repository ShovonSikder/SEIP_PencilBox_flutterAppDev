import 'package:class3_task_movie/movie.dart';

void printMovieList(List<Movie> movies) {
  int movieSerial = 1;
  for (var movie in movies) {
    print('Movie No: $movieSerial');
    print('Name: ${movie.name}');
    print('Category: ${movie.category}');
    print('Rating: ${movie.rating}');

    print('Production: \n\tName: ${movie.production.name}');
    print('\tBudget: ${movie.production.budget}');
    print('\tBox Office: ${movie.production.boxOffice}');

    var serial = 1;

    for (var c in movie.cast) {
      print('Cast: $serial: ');
      print('\tName: ${c.name}');
      print('\tRole: ${c.role}');
      serial++;
    }
    print('---------------------------------------');
    movieSerial++;
  }
}

void main(List<String> arguments) {
  final json = [
    {
      'name': 'Terminator',
      'category': 'action',
      'rating': 9.9,
      'production': {
        'name': 'Marvel',
        'budget': 100000.0,
        'boxoffice': 5000000.0
      },
      'cast': [
        {
          'name': 'Arnold',
          'role': 'Lead actor',
        },
        {
          'name': 'ABC',
          'role': 'second actor',
        }
      ]
    },
    {
      'name': 'Jurrasic Park',
      'category': 'action',
      'rating': 8.9,
      'production': {
        'name': 'Marvel',
        'budget': 100000.0,
        'boxoffice': 5000000.0
      },
      'cast': [
        {
          'name': 'Arnold',
          'role': 'Lead actor',
        },
        {
          'name': 'ABC',
          'role': 'second actor',
        }
      ]
    }
  ];
  List<Movie> movies = [for (var jsonTxt in json) Movie.formJson(jsonTxt)];

  printMovieList(movies);
}
