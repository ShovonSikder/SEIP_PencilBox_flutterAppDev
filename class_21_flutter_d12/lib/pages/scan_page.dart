import 'dart:io';

import 'package:class_21_flutter_d12/contact_provider.dart';
import 'package:class_21_flutter_d12/pages/image_processing_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ScanPage extends StatefulWidget {
  static String routeName = '/scan';
  const ScanPage({Key? key}) : super(key: key);

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  String? imagePath;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan Visiting Card'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Card(
              elevation: 5,
              child: imagePath == null
                  ? Image.asset(
                      'images/default_person.jpg',
                      width: 300,
                      height: 200,
                      fit: BoxFit.cover,
                    )
                  : Image.file(
                      File(imagePath!),
                      width: 300,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                TextButton.icon(
                  onPressed: () {
                    getImage(ImageSource.camera);
                  },
                  icon: const Icon(Icons.camera_alt),
                  label: const Text(
                    'Capture',
                  ),
                ),
                TextButton.icon(
                  onPressed: () {
                    getImage(ImageSource.gallery);
                  },
                  icon: const Icon(Icons.file_copy),
                  label: const Text(
                    'Gallery',
                  ),
                ),
              ],
            ),
            if (imagePath != null)
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, ImageProcessingPage.routeName);
                  },
                  child: Icon(
                    Icons.done,
                    size: 30,
                  ))
          ],
        ),
      ),
    );
  }

  void getImage(ImageSource source) async {
    final file = await ImagePicker()
        .pickImage(source: source, preferredCameraDevice: CameraDevice.rear);
    if (file != null) {
      imagePath = file.path;
      EasyLoading.show(
          status: 'Processing your image.\nPlease wait...',
          dismissOnTap: false);

      Provider.of<ContactProvider>(context, listen: false)
          .processCardImage(imagePath!)
          .then((value) {
        setState(() {
          EasyLoading.dismiss();
        });
      }).catchError((onError) {
        EasyLoading.dismiss();
      });
    }
  }
}
