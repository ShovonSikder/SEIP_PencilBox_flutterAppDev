import 'package:flutter/material.dart';

class DestinationPage extends StatefulWidget {
  static const String routeName = '/destination';
  const DestinationPage({Key? key}) : super(key: key);

  @override
  State<DestinationPage> createState() => _DestinationPageState();
}

class _DestinationPageState extends State<DestinationPage> {
  var msg;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    msg = ModalRoute.of(context)!.settings.arguments as double;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI'),
      ),
      body: Center(
        child: Text('Your BMI is: ${msg.toStringAsFixed(2)}'),
      ),
    );
  }
}
