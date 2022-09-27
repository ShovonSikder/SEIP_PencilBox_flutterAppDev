import 'dart:math';

import 'package:flutter/material.dart';

class StateManage extends StatefulWidget {
  const StateManage({Key? key}) : super(key: key);

  @override
  State<StateManage> createState() => _StateManageState();
}

class _StateManageState extends State<StateManage> {
  double _width = 100, _height = 100;
  int a = 255, r = 255, g = 255, b = 255;
  final random = Random.secure();

  double tr = 0.0, tl = 0.0, br = 0.0, bl = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _changeContainer,
        child: const Text('Change'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          width: _width,
          height: _height,
          decoration: BoxDecoration(
              color: Color.fromARGB(a, r, g, b),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(tr),
                topLeft: Radius.circular(tl),
                bottomLeft: Radius.circular(bl),
                bottomRight: Radius.circular(br),
              )),
        ),
      ),
    );
  }

  void _changeContainer() {
    setState(() {
      _width = random.nextInt(251) + 50;
      _height = random.nextInt(251) + 50;
      r = random.nextInt(256);
      g = random.nextInt(256);
      b = random.nextInt(256);
      tr = random.nextInt(100).toDouble();
      tl = random.nextInt(100).toDouble();
      br = random.nextInt(100).toDouble();
      bl = random.nextInt(100).toDouble();
    });
  }
}
