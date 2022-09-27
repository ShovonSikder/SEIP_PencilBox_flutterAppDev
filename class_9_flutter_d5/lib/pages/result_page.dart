import 'package:class_9_flutter_d5/model/bmi_class.dart';
import 'package:class_9_flutter_d5/model/bmi_suggestion.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final Bmi bmi;
  const ResultPage({Key? key, required this.bmi}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Container(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Text(
                        'Your BMI is',
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(25),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        '${bmi.bmiValue.toStringAsFixed(1)} Kg/m2',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Text(
                        'You Are',
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            bmi.getComment(),
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Image.asset(
                            bmi.imgPath,
                            height: 100,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.cyanAccent,
                    border: Border.all(color: Colors.black),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 3,
                            child: Text(
                              'Category',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                        Expanded(
                            child: Text(
                          'BMI (KG/m2)',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                      ],
                    ),
                  ),
                ),
                for (var bmiSugg in bmiCommentList)
                  Container(
                    decoration: BoxDecoration(
                      color: bmiSugg.comment == bmi.getComment()
                          ? Colors.yellow
                          : Colors.white,
                      border: Border.all(color: Colors.black),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Expanded(flex: 3, child: Text(bmiSugg.comment)),
                          Expanded(child: Text(bmiSugg.range)),
                        ],
                      ),
                    ),
                  )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
