import 'package:class_15_pencilbox_mobile_design/customewidget/drop_down.dart';
import 'package:class_15_pencilbox_mobile_design/db/drop_down_items.dart';
import 'package:class_15_pencilbox_mobile_design/utilities/colors.dart';
import 'package:class_15_pencilbox_mobile_design/utilities/pages_text.dart';
import 'package:flutter/material.dart';

class ApplyForCourse extends StatelessWidget {
  const ApplyForCourse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 35, right: 35),
      child: Card(
        elevation: 15,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text(
                regiTitle,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'roboto',
                  fontSize: 25,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                regiiSubtitle,
                style: TextStyle(
                  fontFamily: 'roboto',
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20,
              ),
              DropDown(items: courses),
              buildTextField('Write Your Name'),
              buildTextField('Write Your Email'),
              buildTextField('Write Your Number'),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: darkYellow,
                  padding: EdgeInsets.symmetric(horizontal: 25),
                ),
                onPressed: () {},
                child: Text(
                  'APPLY NOW',
                  style: boldWhite,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding buildTextField(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextField(
        decoration: InputDecoration(
          isDense: true,
          label: Text(
            label,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
