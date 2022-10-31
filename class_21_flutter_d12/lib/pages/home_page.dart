import 'package:class_21_flutter_d12/contact_provider.dart';
import 'package:class_21_flutter_d12/customewidget/contact_item.dart';
import 'package:class_21_flutter_d12/pages/scan_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact List'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(
          context,
          ScanPage.routeName,
        ),
        child: Icon(
          Icons.add,
        ),
      ),
      body: Consumer<ContactProvider>(
        builder: (context, provider, child) => ListView.builder(
          padding: EdgeInsets.all(8),
          itemCount: provider.contactList.length,
          itemBuilder: (context, index) {
            final contact = provider.contactList[index];
            return ContactItem(
              contact: contact,
              toggleFavorite: (id) {
                provider.toggleFavorite(id);
              },
            );
          },
        ),
      ),
    );
  }
}
