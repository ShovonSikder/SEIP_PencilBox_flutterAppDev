import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_ml_vision/google_ml_vision.dart';

import 'models/contact_model.dart';

class ContactProvider extends ChangeNotifier {
  List<Contact> contactList = [
    Contact(
      id: 0,
      name: 'Shovon Sikder',
      mobileNumber: '01706961289',
      email: 'shovon@gmail.com',
      website: 'www.arss.com',
      streetAddress: 'AV-5,Mirpur',
      img: 'images/default_person.jpg',
    ),
    Contact(
      id: 1,
      name: 'Anisur Rahman',
      mobileNumber: '01701587932',
      website: 'www.anis.com',
      streetAddress: 'AV-5,Mirpur-11',
      img: 'images/default_person.jpg',
    ),
    Contact(
      id: 2,
      name: 'Zahidul Hasan',
      mobileNumber: '01714789635',
      email: 'zahid@gmail.com',
      website: 'www.zss.com',
      streetAddress: 'Shawrapara, Dhaka',
      img: 'images/default_person.jpg',
    ),
    Contact(
      id: 3,
      name: 'Ali Hasan',
      mobileNumber: '01714789634',
      email: 'ali@gmail.com',
      website: 'www.arss.com',
      streetAddress: 'Bhanaga,Faridpur',
      img: 'images/default_person.jpg',
    ),
    Contact(
      id: 4,
      name: 'Sahabur Sikder',
      mobileNumber: '017257893314',
      email: 'sikder@gmail.com',
      website: 'www.arss.com',
      streetAddress: 'Mirpur, Dhaka',
      img: 'images/default_person.jpg',
    ),
    Contact(
      id: 5,
      name: 'Saimun Sikder',
      mobileNumber: '01722814569',
      email: 'saimun@gmail.com',
      website: 'www.arss.com',
      streetAddress: 'Dhaka, Bangladesh',
      img: 'images/default_person.jpg',
    ),
  ];
  List<String?> textLines = [];

  void addNewContact(
      {required String name,
      required String mobile,
      String? email,
      String? website,
      String? address}) {
    contactList.add(
      Contact(
        id: contactList.length,
        name: name,
        mobileNumber: mobile,
        email: email,
        website: website,
        streetAddress: address,
        img: 'images/default_person.jpg',
      ),
    );
    notifyListeners();
  }

//   List<Contact>? l2;
//
// ContactProvider(){
//   l2=[...contactList];
// }

  toggleFavorite(int id) {
    final contact = contactList.firstWhere((element) => element.id == id);
    final index = contactList.indexOf(contact);
    contactList[index].favorite = !contactList[index].favorite;
    notifyListeners();
  }

  Future<void> processCardImage(String imagePath) async {
    textLines.clear();
    final GoogleVisionImage visionImage =
        GoogleVisionImage.fromFile(File(imagePath));
    final TextRecognizer textRecognizer =
        GoogleVision.instance.textRecognizer();
    final VisionText visionText =
        await textRecognizer.processImage(visionImage);

    for (var block in visionText.blocks) {
      for (var line in block.lines) textLines.add(line.text);
    }
  }
}
