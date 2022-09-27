import 'package:flutter/material.dart';

class VisitingCard extends StatelessWidget {
  const VisitingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Card(
              margin: EdgeInsets.zero,
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Container(
                width: 400,
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            Positioned(
              right: -90,
              top: -10,
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  color: Color(0xffeeb9b9),
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
            Positioned(
              left: 15,
              top: 30,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Shovon Sikder',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  buildRow(
                      icon: Icons.call,
                      txt: '  +880 1706969289',
                      txtSize: 15,
                      bold: true),
                  SizedBox(
                    height: 15,
                  ),
                  buildRow(icon: Icons.circle, txt: '  Dart', txtSize: 15),
                  buildRow(icon: Icons.circle, txt: '  Java', txtSize: 15),
                  buildRow(icon: Icons.circle, txt: '  Android', txtSize: 15),
                  buildRow(icon: Icons.circle, txt: '  IOS', txtSize: 15),
                ],
              ),
            ),
            Positioned(
              right: 25,
              top: 0,
              bottom: 0,
              child: Image.asset(
                'images/seippendflogo.png',
                width: 150,
                height: 240,
              ),
            )
          ],
        ),
      ),
    );
  }

  Row buildRow(
      {required IconData icon,
      required String txt,
      required double txtSize,
      bool bold = false}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 15,
        ),
        Text(
          txt,
          style: TextStyle(
            fontWeight: bold ? FontWeight.bold : FontWeight.normal,
            color: Colors.white,
            fontSize: txtSize,
          ),
        ),
      ],
    );
  }
}
