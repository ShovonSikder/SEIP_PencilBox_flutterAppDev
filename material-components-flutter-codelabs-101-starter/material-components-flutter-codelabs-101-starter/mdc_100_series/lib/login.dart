// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // TODO: Add text editing controllers (101)
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            const SizedBox(height: 80.0),
            Column(
              children: <Widget>[
                Image.asset('assets/diamond.png'),
                const SizedBox(height: 16.0),
                Text(
                  'SHRINE',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ],
            ),
            const SizedBox(height: 120.0),
            // TODO: Remove filled: true values (103)
            // TODO: Add TextField widgets (101)
            // [Name]
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                //removed filled: true,
                labelText: 'Username',
              ),
            ),
            // spacer
            const SizedBox(height: 12.0),
            // [Password]
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                //removed filled: true,
                labelText: 'Password',
              ),
              obscureText: true,
            ),

            // TODO: Add button bar (101)
            OverflowBar(
              alignment: MainAxisAlignment.end,
              // TODO: Add a beveled rectangular border to CANCEL (103)
              children: <Widget>[
                // TODO: Add buttons (101)
                TextButton(
                  child: const Text('CANCEL'),
                  onPressed: () {
                    // TODO: Clear the text fields (101)
                    _usernameController.clear();
                    _passwordController.clear();
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Theme.of(context).colorScheme.secondary,
                    shape: const BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(7.0)),
                    ),
                  ),
                ),
                // TODO: Add an elevation to NEXT (103)
                // TODO: Add a beveled rectangular border to NEXT (103)
                ElevatedButton(
                  child: const Text('NEXT'),
                  onPressed: () {
                    // TODO: Show the next page (101)
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 8.0,
                    shape: const BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(7.0)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
