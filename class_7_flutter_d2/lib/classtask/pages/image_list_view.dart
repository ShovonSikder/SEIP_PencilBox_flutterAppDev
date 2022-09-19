import 'package:class_7_flutter_d2/classtask/models/image_model.dart';
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
            child: Image.network(
              img.path,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            img.title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
