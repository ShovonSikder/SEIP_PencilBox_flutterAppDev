import 'package:class_14_flutter_d10/model/counter_provider.dart';
import 'package:class_14_flutter_d10/model/item_provider.dart';
import 'package:class_14_flutter_d10/pages/counter_page.dart';
import 'package:class_14_flutter_d10/pages/date_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ItemProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CounterPage(),
      // DatePicker(),
    );
  }
}
