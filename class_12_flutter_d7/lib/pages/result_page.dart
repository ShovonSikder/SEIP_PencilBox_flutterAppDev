import 'package:class_12_flutter_d7/pages/quizegame.dart';
import 'package:class_12_flutter_d7/pages/show_correct_ans.dart';
import 'package:flutter/material.dart';

import '../model/quiz.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final result = getResult;
    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Correct: ${result.correct}'),
            Text('Incorrect: ${result.incorrect}'),
            TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuizeGame(),
                      ));
                },
                child: Text('START OVER')),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ShowCorrectResult(),
                    ));
              },
              child: Text(
                'See Correct Ans',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
