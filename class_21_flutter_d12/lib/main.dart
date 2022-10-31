import 'package:class_21_flutter_d12/contact_provider.dart';
import 'package:class_21_flutter_d12/pages/details_page.dart';
import 'package:class_21_flutter_d12/pages/home_page.dart';
import 'package:class_21_flutter_d12/pages/image_processing_page.dart';
import 'package:class_21_flutter_d12/pages/scan_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ContactProvider(),
      child: const MyApp(),
    ),
  );
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
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => HomePage(),
        Details.routeName: (context) => Details(),
        ScanPage.routeName: (context) => ScanPage(),
        ImageProcessingPage.routeName: (context) => ImageProcessingPage(),
      },
      builder: EasyLoading.init(),
    );
  }
}
