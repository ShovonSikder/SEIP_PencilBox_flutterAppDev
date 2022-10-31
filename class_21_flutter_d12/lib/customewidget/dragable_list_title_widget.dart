import 'package:flutter/material.dart';

class DragableListTile extends StatelessWidget {
  final String textValue;
  const DragableListTile({Key? key, required this.textValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LongPressDraggable<String>(
      data: textValue,
      feedback: Text(textValue),
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey,
            ),
          ),
        ),
        child: ListTile(
          title: Text(textValue),
        ),
      ),
    );
  }
}
