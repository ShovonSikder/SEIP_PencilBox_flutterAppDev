import 'dart:async';

import 'package:class_12_flutter_d7/customwidget/question_widget.dart';
import 'package:class_12_flutter_d7/model/quiz.dart';
import 'package:class_12_flutter_d7/pages/result_page.dart';
import 'package:flutter/material.dart';

class QuizeGame extends StatefulWidget {
  const QuizeGame({Key? key}) : super(key: key);

  @override
  State<QuizeGame> createState() => _QuizeGameState();
}

class _QuizeGameState extends State<QuizeGame> {
  bool hasQuizStart = false;
  Timer? timer;
  int count = 30;
  _startTime() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (count > 0) {
        setState(() {
          count--;
        });
      } else {
        _stopTimer();
        navigate(context);
      }
    });
  }

  _stopTimer() {
    if (timer != null) {
      timer?.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Remaining: $count'),
        actions: [
          if (!hasQuizStart)
            TextButton(
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              onPressed: () {
                setState(() {
                  hasQuizStart = true;
                  quizList = generateQuizList;
                });
                _startTime();
              },
              child: Text(
                'START',
              ),
            ),
          if (hasQuizStart)
            TextButton(
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              onPressed: () {
                setState(() {
                  hasQuizStart = false;
                });
                _stopTimer();
                navigate(context);
              },
              child: Text(
                'FINISH',
              ),
            )
        ],
      ),
      body: (hasQuizStart)
          ? ListView.builder(
              padding: EdgeInsets.all(8),
              itemCount: quizList.length,
              itemBuilder: (context, index) {
                return QuestionWidget(
                  quiz: quizList[index],
                  index: index + 1,
                );
              },
            )
          : Center(child: Text('Click the START button to start the quiz')),
    );
  }

  void navigate(BuildContext context) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultPage(),
        ));
  }
}
