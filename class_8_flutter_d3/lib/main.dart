import 'package:class_8_flutter_d3/classpractice/pages/image_list_view.dart';
import 'package:class_8_flutter_d3/stack_practice.dart';
import 'package:class_8_flutter_d3/visitingcarddesign/visiting_card.dart';

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
      home: VisitingCard(),
    );
  }
}
