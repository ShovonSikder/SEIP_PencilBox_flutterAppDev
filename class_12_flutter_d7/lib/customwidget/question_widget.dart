import 'package:class_12_flutter_d7/model/quiz.dart';
import 'package:flutter/material.dart';

class QuestionWidget extends StatefulWidget {
  final Quiz quiz;
  final int index;
  final bool showAns;
  // final Function(String) onAnswer;
  const QuestionWidget(
      {Key? key, required this.quiz, required this.index, this.showAns = false})
      : super(key: key);

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  String? groupValue;
  @override
  void initState() {
    // TODO: implement initState
    groupValue = widget.quiz.givenAnswer;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${widget.index}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              width: 10,
            ),
            Flexible(
              child: Text(
                widget.quiz.question,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: widget.quiz.answers
                .map((answer) => Row(
                      children: [
                        Radio<String>(
                            value: answer,
                            groupValue: groupValue,
                            onChanged: !widget.showAns
                                ? (value) {
                                    setState(() {
                                      groupValue = value;
                                    });
                                    widget.quiz.givenAnswer = value;
                                  }
                                : (value) {}),
                        Text(
                          answer,
                          style: TextStyle(
                              color: widget.quiz.correctAnswer == answer &&
                                      widget.showAns
                                  ? Colors.green
                                  : widget.quiz.givenAnswer == answer &&
                                          widget.showAns
                                      ? Colors.red
                                      : Colors.black,
                              fontWeight: widget.quiz.correctAnswer == answer &&
                                      widget.showAns
                                  ? FontWeight.bold
                                  : FontWeight.normal),
                        ),
                      ],
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}
