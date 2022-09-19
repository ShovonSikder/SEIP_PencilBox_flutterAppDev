import 'package:class_7_flutter_d2/models/contact_models.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second page"),
      ),
      body: contactList.isEmpty
          ? Center(
              child: Text("No contact Found"),
            )
          : SingleChildScrollView(
              child: Column(
                children: contactList
                    .map((contact) => contactListTile(contact))
                    .toList(),
              ),
            ),
    );
  }

  ListTile contactListTile(ContactModel contact) => ListTile(
        title: Text(contact.name),
        subtitle: Text(contact.mobile),
        trailing: Icon(
          contact.favourite ? Icons.favorite : Icons.favorite_border,
          color: Colors.red,
        ),
      );
}
