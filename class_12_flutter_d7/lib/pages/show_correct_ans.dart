import 'package:flutter/material.dart';

import '../customwidget/question_widget.dart';
import '../model/quiz.dart';

class ShowCorrectResult extends StatelessWidget {
  const ShowCorrectResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Correct Result',
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(8),
        itemCount: quizList.length,
        itemBuilder: (context, index) {
          return QuestionWidget(
            quiz: quizList[index],
            index: index + 1,
            showAns: true,
          );
        },
      ),
    );
  }
}
