import 'package:class_13_flutter_d8/navigationrouting/pages/destination_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double heightValue = 1;
  double weightValue = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Text(
              'Height',
            ),
            Slider(
              value: heightValue.round().toDouble(),
              min: 0,
              max: 100,
              label: 'Value: $heightValue',
              divisions: 10,
              onChanged: (value) {
                setState(() {
                  heightValue = value;
                });
              },
            ),
            Text('${heightValue.round()}'),
            SizedBox(
              height: 50,
            ),
            Text(
              'Weight',
            ),
            Slider(
              value: weightValue.round().toDouble(),
              min: 0,
              max: 100,
              label: 'Value: $weightValue',
              divisions: 10,
              onChanged: (value) {
                setState(() {
                  weightValue = value;
                });
              },
            ),
            Text('${weightValue.round()}'),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, DestinationPage.routeName,
                      arguments: weightValue / (heightValue * heightValue));
                },
                child: Text('Calculate'))
          ],
        ),
        // ElevatedButton(
        //   onPressed: () {
        //     Navigator.pushNamed(context, DestinationPage.routeName,
        //         arguments: 'Hello World')
        //         .then((value) => null);
        //   },
        //   child: Text(
        //     'Next',
        //   ),
        // )
      ),
    );
  }
}
