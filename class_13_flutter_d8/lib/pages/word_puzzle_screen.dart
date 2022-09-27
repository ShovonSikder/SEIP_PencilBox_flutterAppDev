import 'package:class_13_flutter_d8/word_generator.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart' as words;

class WordPuzzleScreen extends StatefulWidget {
  const WordPuzzleScreen({Key? key}) : super(key: key);

  @override
  State<WordPuzzleScreen> createState() => _WordPuzzleScreenState();
}

class _WordPuzzleScreenState extends State<WordPuzzleScreen> {
  bool hasQuizStarted = false;
  int correct = 0;
  int incorrect = 0;
  int level = 0;
  int index = 0;
  int levelLimits = 3;
  int questionLimits = 10;
  String? suffWord;
  double overAllSuccess = 0.0;
  double winingPoints = 40.0;

  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Word Puzzle'),
      ),
      body: hasQuizStarted
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Level ${level + 1}',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    '$suffWord',
                    style: TextStyle(fontSize: 20),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        label: Text('Enter correct word'),
                      ),
                      controller: _controller,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      String inputTxt = _controller.text.toUpperCase();
                      setState(() {
                        if (level < levelLimits &&
                            index < levels[level].length) {
                          if (inputTxt == levels[level][index].toUpperCase()) {
                            correct++;
                            overAllSuccess++;
                          } else {
                            incorrect++;
                          }

                          index++;

                          if (index < questionLimits) {
                            suffWord =
                                shuffleWord(levels[level][index]).toUpperCase();
                            print(levels[level][index]);
                          } else if (level < levelLimits - 1) {
                            showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (context) => AlertDialog(
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      index = 0;
                                      correct = 0;
                                      incorrect = 0;
                                      level++;

                                      levels[level] =
                                          generateList(length: level + 3);

                                      print(levels[level][index]);
                                      suffWord =
                                          shuffleWord(levels[level][index])
                                              .toUpperCase();

                                      Navigator.pop(context);
                                      setState(() {});
                                    },
                                    child: const Text(
                                      'Go Next Level',
                                    ),
                                  ),
                                ],
                                title: Text(
                                  'Going to level: ${level + 2}',
                                ),
                                content: Text(
                                  'This level:\nCorrected: $correct\nIncorrected: $incorrect',
                                ),
                              ),
                            );
                          } else {
                            overAllSuccess = ((overAllSuccess / 30) * 100);
                            showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Column(
                                  children: [
                                    overAllSuccess >= winingPoints
                                        ? Image.asset(
                                            'images/tropy.jpg',
                                            height: 100,
                                            width: 100,
                                          )
                                        : Icon(
                                            Icons.sentiment_very_dissatisfied,
                                            color: Colors.deepOrange,
                                            size: 100,
                                          ),
                                    Text(
                                      'You Finished all the levels with ${overAllSuccess.toStringAsFixed(2)}% success rate',
                                    ),
                                  ],
                                ),
                                content: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      hasQuizStarted = false;
                                      Navigator.pop(context);
                                    });
                                  },
                                  child: const Text(
                                    'Start Over',
                                  ),
                                ),
                              ),
                            );
                          }
                        }
                      });
                      _controller.clear();
                    },
                    child: const Text(
                      'NEXT',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Correct: $correct',
                            ),
                            Text(
                              'Incorrect: $incorrect',
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          : Center(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    hasQuizStarted = true;
                    level = 0;
                    index = 0;
                    correct = 0;
                    incorrect = 0;
                    overAllSuccess = 0.0;
                    levels[level] = generateList(length: 3);
                    print(levels[level][index]);
                    suffWord = shuffleWord(levels[level][index]).toUpperCase();
                  });
                },
                child: Text(
                  'START',
                ),
              ),
            ),
    );
  }
}
