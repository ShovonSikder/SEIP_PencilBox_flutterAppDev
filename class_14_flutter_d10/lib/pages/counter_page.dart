import 'package:class_14_flutter_d10/model/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/item_provider.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ValueNotifier<int> counter = ValueNotifier(0);
    return Scaffold(
      body: Consumer<ItemProvider>(
        builder: (context, provider, _) => ListView(
          children: provider.items
              .map(
                (item) => ListTile(
                  title: Text(item),
                ),
              )
              .toList(),
        ),
      ),
      floatingActionButton: Row(
        children: [
          FloatingActionButton(
            onPressed: () {
              //add button
              Provider.of<ItemProvider>(context, listen: false).add();
            },
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              Provider.of<ItemProvider>(context, listen: false).remove();
            },
            child: Icon(
              Icons.remove,
            ),
          )
        ],
      ),
    );
  }
}
