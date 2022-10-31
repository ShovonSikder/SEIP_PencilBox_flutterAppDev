import 'dart:io';

import 'package:class_23_flutter_database_1_sqflite/models/movie_model.dart';
import 'package:class_23_flutter_database_1_sqflite/models/user_model.dart';
import 'package:class_23_flutter_database_1_sqflite/pages/add_new_movie_page.dart';
import 'package:class_23_flutter_database_1_sqflite/pages/luncher_page.dart';
import 'package:class_23_flutter_database_1_sqflite/pages/movie_details_page.dart';
import 'package:class_23_flutter_database_1_sqflite/providers/movie_provider.dart';
import 'package:class_23_flutter_database_1_sqflite/providers/user_provider.dart';
import 'package:class_23_flutter_database_1_sqflite/utils/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MovieList extends StatefulWidget {
  static const String routeName = '/home';
  const MovieList({Key? key}) : super(key: key);

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  late MovieProvider provider;
  late UserProvider userProvider;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    provider = Provider.of<MovieProvider>(context, listen: false);
    userProvider = Provider.of<UserProvider>(context, listen: false);
    provider.getAllMovies();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Movie List',
        ),
        actions: [
          IconButton(
              onPressed: () {
                setLoginStatus(false);
                Navigator.pushReplacementNamed(context, LauncherPage.routeName);
              },
              icon: Icon(Icons.logout)),
        ],
      ),
      floatingActionButton: userProvider.userModel.isAdmin
          ? FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, AddNewMovie.routeName);
              },
              child: Icon(
                Icons.add,
              ),
            )
          : null,
      body: Consumer<MovieProvider>(
        builder: (context, provider, child) => ListView.builder(
          itemCount: provider.movieList.length,
          itemBuilder: (context, index) {
            final movie = provider.movieList[index];
            return MovieItem(movie: movie);
          },
        ),
      ),
    );
  }
}

class MovieItem extends StatelessWidget {
  const MovieItem({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, MovieDetails.routeName,
          arguments: [movie.id, movie.name]),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.file(
                  File(movie.image),
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              ListTile(
                title: Text(movie.name),
                subtitle: Text(movie.type),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
