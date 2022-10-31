import 'package:class_15_pencilbox_mobile_design/utilities/pages_text.dart';
import 'package:flutter/material.dart';

class CourseCard extends StatelessWidget {
  final String src, date, title;
  final int duration, courseFee;

  const CourseCard(
      {Key? key,
      required this.src,
      required this.date,
      required this.duration,
      required this.title,
      required this.courseFee})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 35, right: 35),
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            color: Colors.grey,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Image.network(
                src,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Start Date: $date',
                  style: TextStyle(color: Colors.grey),
                ),
                Text('Duration: $duration hours',
                    style: TextStyle(color: Colors.grey)),
                Icon(
                  Icons.info,
                  color: Colors.grey,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Course Fees: $courseFee/-BDT',
                  style: boldRed,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: EdgeInsets.symmetric(horizontal: 25),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Apply Course',
                    style: boldWhite,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
