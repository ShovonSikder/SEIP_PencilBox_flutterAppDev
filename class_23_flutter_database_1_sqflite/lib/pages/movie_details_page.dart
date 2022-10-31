import 'dart:io';

import 'package:class_23_flutter_database_1_sqflite/customewidgets/all_comment_widget.dart';
import 'package:class_23_flutter_database_1_sqflite/customewidgets/rating_comment_widget.dart';
import 'package:class_23_flutter_database_1_sqflite/models/movie_model.dart';
import 'package:class_23_flutter_database_1_sqflite/pages/add_new_movie_page.dart';
import 'package:class_23_flutter_database_1_sqflite/providers/movie_provider.dart';
import 'package:class_23_flutter_database_1_sqflite/providers/user_provider.dart';
import 'package:class_23_flutter_database_1_sqflite/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MovieDetails extends StatefulWidget {
  static const String routeName = '/movieDetails';
  const MovieDetails({Key? key}) : super(key: key);

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  int? id;
  late String name;
  late MovieProvider provider;
  late UserProvider userProvider;

  @override
  void didChangeDependencies() {
    final argList = ModalRoute.of(context)!.settings.arguments as List;
    id = argList[0];
    name = argList[1];
    provider = Provider.of<MovieProvider>(context, listen: false);
    userProvider = Provider.of<UserProvider>(context, listen: false);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          name,
        ),
        actions: userProvider.userModel.isAdmin
            ? [
                IconButton(
                  onPressed: () => Navigator.pushNamed(
                          context, AddNewMovie.routeName,
                          arguments: id)
                      .then((value) => setState(() {
                            name = value as String;
                          })),
                  icon: Icon(
                    Icons.edit,
                  ),
                ),
                IconButton(
                  onPressed: _deleteMovie,
                  icon: Icon(
                    Icons.delete,
                  ),
                ),
              ]
            : null,
      ),
      body: Center(
        child: FutureBuilder<MovieModel>(
          future: provider.getMovieById(id!),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final movie = snapshot.data!;
              return ListView(
                children: [
                  Image.file(
                    File(
                      movie.image,
                    ),
                    width: double.infinity,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                  ListTile(
                    leading: IconButton(
                      icon: Icon(
                        Icons.play_arrow,
                        size: 40,
                        color: Colors.blue,
                      ),
                      onPressed: () {},
                    ),
                    title: Text(movie.name),
                    subtitle: Text(movie.type),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        FutureBuilder<Map<String, dynamic>>(
                          future: userProvider.getAvgRatingByMovieId(id!),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              final map = snapshot.data!;
                              return Text('${map[avgRating] ?? 0.0}');
                            }
                            if (snapshot.hasError) return Text('Error loading');

                            return Text('Loading');
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.monetization_on_outlined,
                          color: Colors.green,
                          size: 20,
                        ),
                        Text(
                          '${movie.budget}',
                          textAlign: TextAlign.right,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'ABOUT'.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        '${movie.description}',
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                  if (!userProvider.userModel.isAdmin)
                    Padding(
                        padding: EdgeInsets.all(8),
                        child: RatingCommentWidget(
                          movieId: id!,
                          onComplete: () {
                            setState(() {});
                          },
                        )),

                  const Text('All Comments'),

                ],

              );
            }
            if (snapshot.hasError) {
              return Text('Failed to load data');
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }

  void _deleteMovie() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete $name'),
        content: Text(
          'Are you sure to delete "$name"?',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'No',
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              provider.deleteMovie(id!);
              Navigator.pop(context);
            },
            child: const Text(
              'Yes',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
