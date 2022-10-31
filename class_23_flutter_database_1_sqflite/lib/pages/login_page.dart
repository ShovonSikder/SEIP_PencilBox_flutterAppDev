import 'package:class_23_flutter_database_1_sqflite/db/db_helper.dart';
import 'package:class_23_flutter_database_1_sqflite/models/user_model.dart';
import 'package:class_23_flutter_database_1_sqflite/pages/luncher_page.dart';
import 'package:class_23_flutter_database_1_sqflite/providers/user_provider.dart';
import 'package:class_23_flutter_database_1_sqflite/utils/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = '/login';
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool obsecureText = true;
  String errMsg = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(
      //     'Login',
      //   ),
      // ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              'User Login',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: _emailController,
                    decoration: buildInputDecoration('Email'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email is required';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            obsecureText = !obsecureText;
                          });
                        },
                        icon: Icon(
                          obsecureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                    obscureText: obsecureText,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password is required';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          _authenticate(true);
                        },
                        child: Text(
                          'Login',
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          _authenticate(false);
                        },
                        child: Text(
                          'Register',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    errMsg,
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _authenticate(bool buttonLogin) async {
    final provider = Provider.of<UserProvider>(context, listen: false);

    if (_formKey.currentState!.validate()) {
      final email = _emailController.text;
      final pass = _passwordController.text;
      final user = await provider.getUserByEmail(email);

      if (buttonLogin) {
        if (user == null) {
          setErrorMsg('User Doesn\'t Exist');
        } else {
          if (pass == user.password) {
            await setLoginStatus(true);
            await setUserId(user.userId!);
            // provider.getUserById(user.userId!);
            showMsg(context, 'Logged in as ${user.isAdmin ? 'admin' : 'user'}');
            Navigator.pushReplacementNamed(context, LauncherPage.routeName);
          } else {
            setErrorMsg('Wrong Password');
          }
        }
      } else {
        //register button
        if (user != null) {
          setErrorMsg('User Already Exists');
        } else {
          final user = UserModel(email: email, password: pass, isAdmin: false);
          final rowId = await provider.insertUser(user);
          await setLoginStatus(true);
          await setUserId(rowId);
          showMsg(
            context,
            'Registration Successful',
          );
          Navigator.pushReplacementNamed(context, LauncherPage.routeName);
        }
      }
    }
  }

  void setErrorMsg(String err) {
    setState(() {
      errMsg = err;
    });
  }

  InputDecoration buildInputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(Icons.email),
      border: OutlineInputBorder(),
    );
  }
}
