import 'package:ecom_admin/pages/add_product_page.dart';
import 'package:ecom_admin/pages/category_page.dart';
import 'package:ecom_admin/pages/dashboard_page.dart';
import 'package:ecom_admin/pages/launcher_page.dart';
import 'package:ecom_admin/pages/login_page.dart';
import 'package:ecom_admin/pages/order_list_page.dart';
import 'package:ecom_admin/pages/product_details_page.dart';
import 'package:ecom_admin/pages/product_repurcharse_page.dart';
import 'package:ecom_admin/pages/report_page.dart';
import 'package:ecom_admin/pages/settings_page.dart';
import 'package:ecom_admin/pages/user_list_page.dart';
import 'package:ecom_admin/pages/view_product_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      initialRoute: LauncherPage.routeName,
      routes: {
        LauncherPage.routeName: (context) => LauncherPage(),
        AddProductPage.routeName: (context) => AddProductPage(),
        CategoryPage.routeName: (context) => CategoryPage(),
        DashBoardPage.routeName: (context) => DashBoardPage(),
        LoginPage.routeName: (context) => LoginPage(),
        OrderListPage.routeName: (context) => OrderListPage(),
        ProductDetailsPage.routeName: (context) => ProductDetailsPage(),
        ProductRepurchasePage.routeName: (context) => ProductRepurchasePage(),
        ReportPage.routeName: (context) => ReportPage(),
        SettingsPage.routeName: (context) => SettingsPage(),
        UserListPage.routeName: (context) => UserListPage(),
        ViewProductPage.routeName: (context) => ViewProductPage(),
      },
    );
  }
}
