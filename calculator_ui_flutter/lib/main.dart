import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: Colors.white,
      body: calculatorUI(),
    ),
  ));
}

Container calculatorUI() {
  return Container(
    color: Color(0xff2f2828),
    margin: EdgeInsets.only(top: 25),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        displayScreen(),
        buttonsRow(buttonTxtList: ['C', '%', 'M']),
        buttonsRow(buttonTxtList: ['7', '8', '9', '/']),
        buttonsRow(buttonTxtList: ['4', '5', '6', '*']),
        buttonsRow(buttonTxtList: ['1', '2', '3', '-']),
        buttonsRow(buttonTxtList: ['.', '0', '=', '+']),
      ],
    ),
  );
}

Row buttonsRow({required List<String> buttonTxtList}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      for (var txt in buttonTxtList) button(btnTxt: txt),
    ],
  );
}

Expanded button({required String btnTxt}) {
  return Expanded(
    flex: (btnTxt == 'M') ? 2 : 1,
    child: Container(
      height: 70,
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 10),
      color: (btnTxt == 'C')
          ? Colors.redAccent
          : (btnTxt == 'M')
              ? Colors.cyan
              : Colors.white,
      child: Text(
        btnTxt,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    ),
  );
}

Container displayScreen() {
  return Container(
    height: 80,
    color: Color(0xC2E7E7E7),
    alignment: Alignment.centerRight,
    padding: EdgeInsets.only(right: 10),
    child: Text(
      'Display',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),
  );
}
