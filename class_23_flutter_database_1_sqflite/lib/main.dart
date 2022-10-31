import 'package:class_23_flutter_database_1_sqflite/pages/add_new_movie_page.dart';
import 'package:class_23_flutter_database_1_sqflite/pages/login_page.dart';
import 'package:class_23_flutter_database_1_sqflite/pages/luncher_page.dart';
import 'package:class_23_flutter_database_1_sqflite/pages/movie_details_page.dart';
import 'package:class_23_flutter_database_1_sqflite/pages/movie_list_page.dart';
import 'package:class_23_flutter_database_1_sqflite/providers/movie_provider.dart';
import 'package:class_23_flutter_database_1_sqflite/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => MovieProvider()),
    ChangeNotifierProvider(create: (context) => UserProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: LauncherPage.routeName,
      routes: {
        AddNewMovie.routeName: (context) => AddNewMovie(),
        MovieList.routeName: (context) => MovieList(),
        MovieDetails.routeName: (context) => MovieDetails(),
        LoginPage.routeName: (context) => LoginPage(),
        LauncherPage.routeName: (context) => LauncherPage(),
      },
    );
  }
}
