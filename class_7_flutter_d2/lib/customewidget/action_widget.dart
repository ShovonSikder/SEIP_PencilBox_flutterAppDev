import 'package:flutter/material.dart';

class ActionWidget extends StatelessWidget {
  final String title;
  final IconData iconData;

  const ActionWidget({Key? key, required this.title, required this.iconData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          iconData,
          color: Theme.of(context).primaryColor,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          title.toUpperCase(),
          style: TextStyle(
            color: Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }
}
