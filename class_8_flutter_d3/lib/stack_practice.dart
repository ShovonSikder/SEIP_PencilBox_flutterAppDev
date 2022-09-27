import 'package:flutter/material.dart';

class StackPractice extends StatelessWidget {
  const StackPractice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stack'),
      ),
      body: Center(
        child: Stack(
          children: [
            Card(
              // elevation: 10,
              // surfaceTintColor: Colors.red,
              // shadowColor: Colors.amber,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                  child: Image.asset(
                    'images/coxbazar.jpg',
                    fit: BoxFit.cover,
                    color: Colors.amber,
                    colorBlendMode: BlendMode.hue,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              child: Text(
                'ABCD',
                style: TextStyle(fontSize: 100),
              ),
            ),
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: Center(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "View",
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
