import 'package:class_9_flutter_d5/model/bmi_class.dart';
import 'package:class_9_flutter_d5/pages/result_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _weightController = TextEditingController();
  final _heightController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _weightController.dispose();
    _heightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Column(
        children: [
          const Text(
            '\nWelcome',
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              keyboardType: TextInputType.number,
              controller: _weightController,
              decoration: InputDecoration(
                  hintText: 'Enter Your Weight in KG',
                  labelText: 'Enter Your Weight in KG',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              keyboardType: TextInputType.number,
              controller: _heightController,
              decoration: InputDecoration(
                  hintText: 'Enter Your Height in m',
                  labelText: 'Enter Your Height in m',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
            ),
          ),
          ElevatedButton(
            onPressed: _calculateBMI,
            child: const Text(
              'Get Your BMI',
            ),
          )
        ],
      ),
    );
  }

  void _calculateBMI() {
    if (_weightController.text.isEmpty) {
      showMessage(context, 'Weight Can\'t be empty');
      return;
    }
    if (_heightController.text.isEmpty) {
      showMessage(context, 'Height Can\'t be empty');
      return;
    }

    double w, h;

    try {
      if ((w = double.parse(_weightController.text)) <= 0.0) {
        showMessage(context, 'Weight Can\'t be 0 or less');
        return;
      }
    } catch (e) {
      showMessage(context, 'Weight must be number');
      return;
    }

    try {
      if ((h = double.parse(_heightController.text)) <= 0.0) {
        showMessage(context, 'Height Can\'t be 0 or less');
        return;
      }
    } catch (e) {
      showMessage(context, 'Height must be number');
      return;
    }

    //to calculate bmi
    double bmi = w / (h * h);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultPage(
          bmi: Bmi(bmiValue: bmi),
        ),
      ),
    );
  }
}

void showMessage(BuildContext context, String msg) =>
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          msg,
        ),
      ),
    );
