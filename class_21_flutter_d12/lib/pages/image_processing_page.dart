import 'package:class_21_flutter_d12/contact_provider.dart';
import 'package:class_21_flutter_d12/customewidget/dragable_list_title_widget.dart';
import 'package:class_21_flutter_d12/customewidget/draged_value_receiver_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ImageProcessingPage extends StatefulWidget {
  static String routeName = '/img_processing';
  ImageProcessingPage({Key? key}) : super(key: key);

  String? name, mobile, email, address, website;

  @override
  State<ImageProcessingPage> createState() => _ImageProcessingPageState();
}

class _ImageProcessingPageState extends State<ImageProcessingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Verify Information',
        ),
        actions: [
          TextButton(
            onPressed: () {
              saveNewContact();
            },
            child: Text(
              'Save'.toUpperCase(),
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Consumer<ContactProvider>(
        builder: (context, provider, child) => Column(
          children: [
            Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    buildUserGuideText(
                        'Drag the correct texts here to create the new contact'),
                    DragedValueReceiver(
                        label: 'Name',
                        updateValue: (value) {
                          widget.name = value;
                        }),
                    DragedValueReceiver(
                        label: 'Mobile',
                        updateValue: (value) {
                          widget.mobile = value;
                        }),
                    DragedValueReceiver(
                        label: 'Email',
                        updateValue: (value) {
                          widget.email = value;
                        }),
                    DragedValueReceiver(
                        label: 'Address',
                        updateValue: (value) {
                          widget.address = value;
                        }),
                    DragedValueReceiver(
                        label: 'Website',
                        updateValue: (value) {
                          widget.website = value;
                        }),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15),
              child: buildUserGuideText(
                  'Text Retrieved from Image. You can drag these info to up'),
            ),
            Expanded(
              child: Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: ListView(
                    children: provider.textLines
                        .map(
                          (line) => DragableListTile(
                            textValue: line!,
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Text buildUserGuideText(String guide) {
    return Text(
      guide,
      style: const TextStyle(
        fontStyle: FontStyle.italic,
        decoration: TextDecoration.underline,
      ),
    );
  }

  void saveNewContact() {
    if (widget.name != null && widget.mobile != null) {
      Provider.of<ContactProvider>(context, listen: false).addNewContact(
          name: widget.name!,
          mobile: widget.mobile!,
          email: widget.email!,
          website: widget.website!,
          address: widget.address!);
      Navigator.popUntil(context, (route) => route.isFirst);
    } else {
      throw ('Data are not valid to create a contact');
    }
  }
}
