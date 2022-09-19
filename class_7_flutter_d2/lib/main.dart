import 'package:class_7_flutter_d2/classtask/pages/image_list_view.dart';
import 'package:class_7_flutter_d2/pages/home_page.dart';
import 'package:class_7_flutter_d2/pages/second_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: ImgListView(),
    );
  }
}
