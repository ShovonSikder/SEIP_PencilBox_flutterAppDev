import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: Colors.green.shade400,
      appBar: AppBar(
        elevation: 5,
        backgroundColor: Colors.red,
        title: Text("My first app"),
      ),
      body: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text(
          //   'Hello World',
          //   style: TextStyle(
          //     fontSize: 22,
          //     color: Colors.red,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
          // Text(
          //   'Hello flutter',
          //   style: TextStyle(
          //     fontSize: 22,
          //     color: Colors.red,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
          Expanded(flex: 2, child: firstColumn()),

          Expanded(child: secondColumn()),
          // Expanded(
          //   child: Container(
          //     width: 100,
          //     height: 100,
          //     color: Colors.white,
          //   ),
          // ),
          // Expanded(
          //   child: Container(
          //     width: 100,
          //     height: 100,
          //     color: Colors.yellow,
          //   ),
          // ),
          // Expanded(
          //   child: Container(
          //     width: 100,
          //     height: 100,
          //     color: Colors.pink,
          //   ),
          // ),
          // Expanded(
          //   child: Container(
          //     width: 100,
          //     height: 100,
          //     color: Colors.white,
          //   ),
          // ),
          // Expanded(
          //   child: Container(
          //     width: 100,
          //     height: 100,
          //     color: Colors.yellow,
          //   ),
          // ),
          // Expanded(
          //   child: Container(
          //     width: 100,
          //     height: 100,
          //     color: Colors.pink,
          //   ),
          // ),
          // Expanded(
          //   child: Container(
          //     width: 100,
          //     height: 100,
          //     color: Colors.white,
          //   ),
          // ),
          // Expanded(
          //   child: Container(
          //     width: 100,
          //     height: 100,
          //     color: Colors.yellow,
          //   ),
          // ),
          // Expanded(
          //   child: Container(
          //     width: 100,
          //     height: 100,
          //     color: Colors.pink,
          //   ),
          // ),
          // Expanded(
          //   child: Container(
          //     width: 100,
          //     height: 100,
          //     color: Colors.white,
          //   ),
          // ),
          // Expanded(
          //   child: Container(
          //     width: 100,
          //     height: 100,
          //     color: Colors.yellow,
          //   ),
          // ),
          // Expanded(
          //   child: Container(
          //     width: 100,
          //     height: 100,
          //     color: Colors.pink,
          //   ),
          // ),
          // Expanded(
          //   child: Container(
          //     width: 100,
          //     height: 100,
          //     color: Colors.white,
          //   ),
          // ),
          // Expanded(
          //   child: Container(
          //     width: 100,
          //     height: 100,
          //     color: Colors.yellow,
          //   ),
          // ),
          // Expanded(
          //   child: Container(
          //     width: 100,
          //     height: 100,
          //     color: Colors.pink,
          //   ),
          // ),
          // Expanded(
          //   child: Container(
          //     width: 100,
          //     height: 100,
          //     color: Colors.white,
          //   ),
          // ),
          // Expanded(
          //   child: Container(
          //     width: 100,
          //     height: 100,
          //     color: Colors.yellow,
          //   ),
          // ),
          // Expanded(
          //   child: Container(
          //     width: 100,
          //     height: 100,
          //     color: Colors.pink,
          //   ),
          // ),
          // Expanded(
          //   child: Container(
          //     width: 100,
          //     height: 100,
          //     color: Colors.white,
          //   ),
          // ),
          // Expanded(
          //   child: Container(
          //     width: 100,
          //     height: 100,
          //     color: Colors.yellow,
          //   ),
          // ),
          // Expanded(
          //   child: Container(
          //     width: 100,
          //     height: 100,
          //     color: Colors.pink,
          //   ),
          // ),
          // Expanded(
          //   child: Container(
          //     width: 100,
          //     height: 100,
          //     color: Colors.white,
          //   ),
          // ),
          // Expanded(
          //   child: Container(
          //     width: 100,
          //     height: 100,
          //     color: Colors.yellow,
          //   ),
          // ),
          // Expanded(
          //   child: Container(
          //     width: 100,
          //     height: 100,
          //     color: Colors.pink,
          //   ),
          // ),
          // Expanded(
          //   child: Container(
          //     width: 100,
          //     height: 100,
          //     color: Colors.white,
          //   ),
          // ),
          // Expanded(
          //   child: Container(
          //     width: 100,
          //     height: 100,
          //     color: Colors.yellow,
          //   ),
          // ),
          // Expanded(
          //   child: Container(
          //     width: 100,
          //     height: 100,
          //     color: Colors.pink,
          //   ),
          // ),
          // Expanded(
          //   child: Container(
          //     width: 100,
          //     height: 100,
          //     color: Colors.white,
          //   ),
          // ),
          // Expanded(
          //   child: Container(
          //     width: 100,
          //     height: 100,
          //     color: Colors.yellow,
          //   ),
          // ),
          // Expanded(
          //   child: Container(
          //     width: 100,
          //     height: 100,
          //     color: Colors.pink,
          //   ),
          // ),
          // Expanded(
          //   child: Container(
          //     width: 100,
          //     height: 100,
          //     color: Colors.white,
          //   ),
          // ),
          // Expanded(
          //   child: Container(
          //     width: 100,
          //     height: 100,
          //     color: Colors.yellow,
          //   ),
          // ),
          // Expanded(
          //   child: Container(
          //     width: 100,
          //     height: 100,
          //     color: Colors.pink,
          //   ),
          // ),
          // Expanded(
          //   child: Container(
          //     width: 100,
          //     height: 100,
          //     color: Colors.white,
          //   ),
          // ),
          // Expanded(
          //   child: Container(
          //     width: 100,
          //     height: 100,
          //     color: Colors.yellow,
          //   ),
          // ),
          // Expanded(
          //   child: Container(
          //     width: 100,
          //     height: 100,
          //     color: Colors.pink,
          //   ),
          // ),
          // Expanded(
          //   child: Container(
          //     width: 100,
          //     height: 100,
          //     color: Colors.white,
          //   ),
          // ),
          // Expanded(
          //   child: Container(
          //     width: 100,
          //     height: 100,
          //     color: Colors.yellow,
          //   ),
          // ),
          // Expanded(
          //   child: Container(
          //     width: 100,
          //     height: 100,
          //     color: Colors.pink,
          //   ),
          // ),
          // Expanded(
          //   child: Container(
          //     width: 100,
          //     height: 100,
          //     color: Colors.white,
          //   ),
          // ),
          // Expanded(
          //   child: Container(
          //     width: 100,
          //     height: 100,
          //     color: Colors.yellow,
          //   ),
          // ),
          // Expanded(
          //   child: Container(
          //     width: 100,
          //     height: 100,
          //     color: Colors.pink,
          //   ),
          // ),
          // Expanded(
          //   child: Container(
          //     width: 100,
          //     height: 100,
          //     color: Colors.white,
          //   ),
          // ),
          // Expanded(
          //   child: Container(
          //     width: 100,
          //     height: 100,
          //     color: Colors.yellow,
          //   ),
          // ),
          // Expanded(
          //   child: Container(
          //     width: 100,
          //     height: 100,
          //     color: Colors.pink,
          //   ),
          // ),
          // Expanded(
          //   child: Container(
          //     width: 100,
          //     height: 100,
          //     color: Colors.white,
          //   ),
          // ),
          // Expanded(
          //   child: Container(
          //     width: 100,
          //     height: 100,
          //     color: Colors.yellow,
          //   ),
          // ),
          // Expanded(
          //   child: Container(
          //     width: 100,
          //     height: 100,
          //     color: Colors.pink,
          //   ),
          // ),
          // Expanded(
          //   child: Container(
          //     width: 100,
          //     height: 100,
          //     color: Colors.white,
          //   ),
          // ),
          // Expanded(
          //   child: Container(
          //     width: 100,
          //     height: 100,
          //     color: Colors.yellow,
          //   ),
          // ),
          // Expanded(
          //   child: Container(
          //     width: 100,
          //     height: 100,
          //     color: Colors.pink,
          //   ),
          // ),
          // Expanded(
          //   child: Container(
          //     width: 100,
          //     height: 100,
          //     color: Colors.white,
          //   ),
          // ),
          // Expanded(
          //   child: Container(
          //     width: 100,
          //     height: 100,
          //     color: Colors.yellow,
          //   ),
          // ),
          // Expanded(
          //   child: Container(
          //     width: 100,
          //     height: 100,
          //     color: Colors.pink,
          //   ),
          // ),
          // Expanded(
          //   child: Container(
          //     width: 100,
          //     height: 100,
          //     color: Colors.white,
          //   ),
          // ),
          // Expanded(
          //   child: Container(
          //     width: 100,
          //     height: 100,
          //     color: Colors.yellow,
          //   ),
          // ),
          // Expanded(
          //   child: Container(
          //     width: 100,
          //     height: 100,
          //     color: Colors.pink,
          //   ),
          // ),
          // Expanded(
          //   child: Container(
          //     width: 100,
          //     height: 100,
          //     color: Colors.white,
          //   ),
          // ),
          // Expanded(
          //   child: Container(
          //     width: 100,
          //     height: 100,
          //     color: Colors.yellow,
          //   ),
          // ),
          // Expanded(
          //   child: Container(
          //     width: 100,
          //     height: 100,
          //     color: Colors.pink,
          //   ),
          // ),
          // Expanded(
          //   child: Container(
          //     width: 100,
          //     height: 100,
          //     color: Colors.white,
          //   ),
          // ),
          // Expanded(
          //   child: Container(
          //     width: 100,
          //     height: 100,
          //     color: Colors.yellow,
          //   ),
          // ),
          // Expanded(
          //   child: Container(
          //     width: 100,
          //     height: 100,
          //     color: Colors.pink,
          //   ),
          // ),
          // Expanded(
          //   child: Container(
          //     width: 100,
          //     height: 100,
          //     color: Colors.white,
          //   ),
          // ),
          // Expanded(
          //   child: Container(
          //     width: 100,
          //     height: 100,
          //     color: Colors.yellow,
          //   ),
          // ),
          // Expanded(
          //   child: Container(
          //     width: 100,
          //     height: 100,
          //     color: Colors.pink,
          //   ),
          // ),
        ],
      ),
    ),
  ));
}

Column firstColumn() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Expanded(
        child: Container(
          width: 100,
          height: 100,
          color: Colors.white,
          child: Image.network(
            'https://s.abcnews.com/images/International/tiger-india-file-03-ap-jef-220728_1659051950062_hpEmbed_3x2_992.jpg',
            fit: BoxFit.cover,
          ),
        ),
      ),
      Expanded(
        child: Container(
          width: 100,
          height: 100,
          color: Colors.yellow,
        ),
      ),
      Expanded(
        child: Container(
          margin: EdgeInsets.all(20),
          alignment: Alignment.center,
          width: 100,
          height: 100,
          color: Colors.pink,
          child: Text('abcd'),
        ),
      ),
    ],
  );
}

Column secondColumn() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Expanded(
        child: Container(
          width: 100,
          height: 100,
          color: Colors.pink,
        ),
      ),
      Expanded(
        child: Container(
          width: 100,
          height: 100,
          color: Colors.black,
        ),
      ),
      Expanded(
        child: Container(
          width: 100,
          height: 100,
          color: Colors.cyan,
        ),
      ),
    ],
  );
}
