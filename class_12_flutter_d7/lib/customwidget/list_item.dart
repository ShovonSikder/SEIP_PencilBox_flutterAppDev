import 'package:flutter/material.dart';

import '../db/temp_db.dart';

class ListItem extends StatelessWidget {
  final int index;
  const ListItem({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: index.isEven ? Colors.green : Colors.grey,
      dense: true,
      title: Text('Item ${items[index]}'),
      subtitle: Text('items no $index'),
    );
  }
}
