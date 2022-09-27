import 'package:class_12_flutter_d7/customwidget/list_item.dart';
import 'package:class_12_flutter_d7/db/temp_db.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? radioGroupValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'List View',
        ),
      ),

      body: Column(
        children: [
          Row(
            children: [
              Radio<String>(
                value: 'Male',
                groupValue: radioGroupValue,
                onChanged: (value) {
                  setState(() {
                    radioGroupValue = value;
                  });
                },
              ),
              Text('Male'),
            ],
          ),
          Row(
            children: [
              Radio<String>(
                value: 'Female',
                groupValue: radioGroupValue,
                onChanged: (value) {
                  setState(() {
                    radioGroupValue = value;
                  });
                },
              ),
              Text('Female'),
            ],
          ),
        ],
      ),
      //listview
      // ListView(
      //   children: items
      //       .map(
      //         (item) => ListTile(
      //           dense: true,
      //           title: Text(item),
      //         ),
      //       )
      //       .toList(),
      // ),
    );
  }

  ListView buildListView() {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) => ListItem(index: index),
    );
  }
}
