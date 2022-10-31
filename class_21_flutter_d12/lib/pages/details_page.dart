import 'dart:io';

import 'package:class_21_flutter_d12/models/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Details extends StatelessWidget {
  static const String routeName = '/details';

  const Details({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final contact = ModalRoute.of(context)!.settings.arguments as Contact;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          contact.name,
        ),
        actions: [
          IconButton(
            onPressed: () {
              //to do for editing contact
            },
            icon: const Icon(
              Icons.edit,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Image.asset(
                contact.img!,
                width: double.infinity,
                height: 200,
                fit: BoxFit.contain,
              ),
              Positioned(
                right: 5,
                bottom: 5,
                child: IconButton(
                  onPressed: () {
                    //to do for image from gallery
                  },
                  icon: const Icon(
                    Icons.camera_alt,
                    color: Colors.black,
                  ),
                ),
              ),
              contact.favorite
                  ? Positioned(
                      right: 5,
                      top: 5,
                      child: Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                    )
                  : Text(""),
            ],
          ),
          ListTile(
            title: Text(contact.mobileNumber),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                    callContact(contact.mobileNumber);
                  },
                  icon: Icon(
                    Icons.call,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    smsContact(contact.mobileNumber);
                  },
                  icon: Icon(
                    Icons.sms,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: Text(contact.email ?? 'Email not set yet'),
            trailing: IconButton(
              onPressed: () {
                if (contact.email != null) emailContact(contact.email!);
              },
              icon: Icon(
                contact.email != null ? Icons.email : Icons.edit,
              ),
            ),
          ),
          ListTile(
            title: Text(contact.streetAddress ?? 'Location not set yet'),
            trailing: IconButton(
              onPressed: () {
                contact.streetAddress != null
                    ? showLocation(contact.streetAddress!)
                    : print('no data of addrss');
              },
              icon: Icon(
                contact.streetAddress != null
                    ? Icons.location_on_sharp
                    : Icons.edit,
              ),
            ),
          ),
          ListTile(
            title: Text(contact.website ?? 'Website not set yet'),
            trailing: IconButton(
              onPressed: () {
                contact.website != null
                    ? visitWebsite(contact.website!)
                    : print('no web');
              },
              icon: Icon(
                contact.website != null ? Icons.web_sharp : Icons.edit,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void callContact(String mobileNumber) async {
    final urlString = 'tel:$mobileNumber';

    if (await canLaunchUrlString(urlString)) {
      await launchUrlString(urlString);
    } else {
      throw 'Cannot perform this operation';
    }
  }

  void emailContact(String email) async {
    final urlString = 'mailto:${email}?subject=Greeting&body=HelloKemonAco';

    if (await canLaunchUrlString(urlString)) {
      await launchUrlString(urlString);
    } else {
      throw 'Cannot perform this operation';
    }
  }

  void smsContact(String mobileNumber) async {
    final urlString = 'sms:$mobileNumber';

    if (await canLaunchUrlString(urlString)) {
      await launchUrlString(urlString);
    } else {
      throw 'Cannot perform this operation';
    }
  }

  visitWebsite(String website) async {
    final urlString = 'https:$website';

    if (await canLaunchUrlString(urlString)) {
      await launchUrlString(urlString);
    } else {
      throw 'Cannot perform this operation';
    }
  }

  showLocation(String streetAddress) async {
    String urlString = "";
    if (Platform.isAndroid)
      urlString = 'geo:0,0?q=$streetAddress';
    else if (Platform.isIOS)
      urlString = 'http://maps.apple.com/?q=Mexican+Restaurant';

    if (await canLaunchUrlString(urlString)) {
      await launchUrlString(urlString);
    } else {
      throw 'Cannot perform this operation';
    }
  }
}
