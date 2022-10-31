import 'package:flutter/material.dart';

class DragedValueReceiver extends StatefulWidget {
  final String label;
  final Function(String) updateValue;
  const DragedValueReceiver(
      {Key? key, required this.label, required this.updateValue})
      : super(key: key);

  @override
  State<DragedValueReceiver> createState() => _DragedValueReceiverState();
}

class _DragedValueReceiverState extends State<DragedValueReceiver> {
  String textValue = '';
  @override
  Widget build(BuildContext context) {
    return DragTarget<String>(
      builder: (context, candidateData, rejectedData) {
        return Container(
          margin: EdgeInsets.only(bottom: 4),
          padding: EdgeInsets.all(8),
          decoration:
              BoxDecoration(border: Border.all(color: Colors.grey, width: 0.1)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${widget.label}: ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Flexible(child: Text(textValue)),
            ],
          ),
        );
      },
      onAccept: (value) {
        _passValueAndUpdateUI(value);
      },
    );
  }

  _passValueAndUpdateUI(String v) {
    textValue == '' ? textValue = v : textValue += (', ' + v);
    widget.updateValue(textValue);
    setState(() {});
  }
}
