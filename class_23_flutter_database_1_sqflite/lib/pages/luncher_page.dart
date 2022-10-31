import 'package:class_23_flutter_database_1_sqflite/pages/login_page.dart';
import 'package:class_23_flutter_database_1_sqflite/pages/movie_list_page.dart';
import 'package:class_23_flutter_database_1_sqflite/providers/user_provider.dart';
import 'package:class_23_flutter_database_1_sqflite/utils/constants.dart';
import 'package:class_23_flutter_database_1_sqflite/utils/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LauncherPage extends StatefulWidget {
  static const String routeName = '/launcher';
  const LauncherPage({Key? key}) : super(key: key);

  @override
  State<LauncherPage> createState() => _LauncherPageState();
}

class _LauncherPageState extends State<LauncherPage> {
  @override
  void initState() {
    // TODO: implement initState
    redirectUser();
    super.initState();
  }

  Future<void> redirectUser() async {
    if (await getLoginStatus()) {
      await Provider.of<UserProvider>(context, listen: false)
          .getUserById(await getUserId());

      showMsg(context, 'Redirecting to Movie List Page');
      Navigator.pushReplacementNamed(context, MovieList.routeName);
    } else {
      showMsg(context, 'Redirecting to Login Page');
      Navigator.pushReplacementNamed(context, LoginPage.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          '',
        ),
      ),
    );
  }
}
