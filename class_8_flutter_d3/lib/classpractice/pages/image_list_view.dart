import 'package:class_8_flutter_d3/classpractice/models/image_model.dart';
import 'package:flutter/material.dart';

class ImgListView extends StatelessWidget {
  const ImgListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gallary"),
      ),
      body: imagList.isEmpty
          ? Center(
              child: Text("No Image Found"),
            )
          : SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                //dynamically loading widget
                children: imagList.map((img) => ImageCard(img: img)).toList(),
              ),
            ),
    );
  }
}

class ImageCard extends StatelessWidget {
  final MyImage img;
  const ImageCard({Key? key, required this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 400,
            child: Card(
              elevation: 10,
              surfaceTintColor: Colors.red,
              shadowColor: Colors.amber,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Image.asset(
                  img.path,
                  fit: BoxFit.cover,
                  color: Colors.amber,
                  colorBlendMode: BlendMode.hue,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Text(
              img.title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
