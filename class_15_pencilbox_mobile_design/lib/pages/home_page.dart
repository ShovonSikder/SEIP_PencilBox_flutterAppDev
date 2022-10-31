import 'package:class_15_pencilbox_mobile_design/customewidget/apply_for_course.dart';
import 'package:class_15_pencilbox_mobile_design/customewidget/course_card.dart';
import 'package:class_15_pencilbox_mobile_design/utilities/colors.dart';
import 'package:class_15_pencilbox_mobile_design/utilities/img_src.dart';
import 'package:class_15_pencilbox_mobile_design/utilities/pages_text.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkBlue,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.call,
              color: darkYellow,
            ),
            Text(
              phoneNum,
              style: boldWhite,
            )
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Icon(
                  Icons.login,
                  color: darkYellow,
                ),
                Text(
                  ' Login',
                  style: boldWhite,
                ),
                Text(
                  ' / Register',
                  style: boldWhite,
                ),
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.network(
                  pencilBoxLogo,
                  width: 200,
                  height: 100,
                ),
                Icon(
                  Icons.menu,
                  color: Colors.grey,
                  size: 30,
                ),
                Icon(
                  Icons.search,
                  color: Colors.black,
                  size: 30,
                ),
              ],
            ),
            Image.network(
              bodyImg,
              height: 250,
            ),
            ApplyForCourse(),
            //buttons
            buildButtonContainer(),
            SizedBox(
              height: 8,
            ),
            CourseCard(
              src: courseImg1,
              date: '30/12,2022',
              duration: 40,
              title: course1Title,
              courseFee: 10000,
            ),
            SizedBox(
              height: 20,
            ),
            CourseCard(
              src: courseImg1,
              date: '30/12,2022',
              duration: 40,
              title: course1Title,
              courseFee: 10000,
            ),
            SizedBox(
              height: 20,
            ),
            CourseCard(
              src: courseImg1,
              date: '30/01,2023',
              duration: 60,
              title: 'Android App Dev',
              courseFee: 10000,
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 12)),
                  onPressed: () {},
                  child: Text(
                    'View More',
                    style: boldWhite,
                  )),
            ),

            SizedBox(
              height: 40,
            ),
            buildSubscribeContainer(),

            buildFooterContainer(),
            Image.network(
              footerAdsImg,
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              decoration: BoxDecoration(
                color: darkBlue,
              ),
              child: Text(
                textAlign: TextAlign.center,
                'Copyright 2022 ©  PencilBox Training Institute.  All Rights Reserved.',
                style: boldWhite,
              ),
            )
          ],
        ),
      ),
      // floatingActionButton: Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   children: [
      //     Padding(
      //       padding: EdgeInsets.only(left: 20),
      //       child: ElevatedButton(
      //         onPressed: () {},
      //         child: Text(
      //           'SEIP',
      //         ),
      //       ),
      //     ),
      //     ElevatedButton(
      //       onPressed: () {},
      //       child: Text(
      //         'SEIP',
      //       ),
      //     )
      //   ],
      // ),
    );
  }

  Container buildFooterContainer() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 40),
      child: Column(
        children: [
          Image.network(
            pencilBoxLogo,
            width: 200,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            aboutPencilbox,
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.facebook,
                size: 40,
              ),
              Icon(
                Icons.people,
                size: 40,
              ),
              Icon(
                Icons.grid_view_sharp,
                size: 40,
              ),
              Icon(
                Icons.ac_unit_sharp,
                size: 40,
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            'useful links'.toUpperCase(),
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Text('Home'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Text('Event'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Text('Privacy & Policy'),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Text('Home'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Text('Event'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Text('Privacy & Policy'),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Text('Home'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Text('Event'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Text('Privacy & Policy'),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Image.network(
            footerImg,
            height: 100,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            'get in touch'.toUpperCase(),
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.location_on_sharp),
                    Text(
                      'Address: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Flexible(
                      child: Text(
                        ' EDB Trade Centre (5th Floor),93 Kazi Nazrul Islam Avenue, Dhaka-1215.',
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.phone_android_rounded),
                    Flexible(
                      child: Text(
                        ' +88 01714 121719',
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.call),
                    Flexible(
                      child: Text(
                        ' +88 02 41010090',
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.email),
                    Flexible(
                      child: Text(
                        ' info@pencilbox.edu.bd',
                      ),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Container buildSubscribeContainer() {
    return Container(
      color: Colors.black,
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 50),
      child: Column(
        children: [
          Text(
            'Subscribe to our Newsletter\n'.toUpperCase(),
            style: TextStyle(
                fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Text(
            'Don\'t miss any updates from Pencilbox Training'.toUpperCase(),
            style: boldWhite,
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.horizontal(left: Radius.circular(10))),
                  child: TextField(
                    decoration: InputDecoration(
                      isDense: true,
                      label: Text(
                        'Enter Your E-mail Address',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.grey),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.horizontal(
                              right: Radius.circular(10))),
                      backgroundColor: darkYellow,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 17.5)),
                  child: Text(
                    'SUBSCRIBE',
                    style: boldWhite,
                  )),
            ],
          )
        ],
      ),
    );
  }

  Container buildButtonContainer() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 35, horizontal: 35),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Center(
                      child: Text(
                        'All Courses',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Card(
                elevation: 5,
                color: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'Upcomming Courses',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Center(
                      child: Text(
                        'Ongoing Courses',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Center(
                      child: Text(
                        'Colaborate course',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'Old Course',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
