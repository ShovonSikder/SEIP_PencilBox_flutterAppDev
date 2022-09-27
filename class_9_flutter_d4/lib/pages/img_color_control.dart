import 'package:class_9_flutter_d4/models/my_blend_mode.dart';
import 'package:class_9_flutter_d4/models/my_color.dart';
import 'package:flutter/material.dart';

class ImageColorControl extends StatefulWidget {
  const ImageColorControl({Key? key}) : super(key: key);

  @override
  State<ImageColorControl> createState() => _ImageColorControlState();
}

class _ImageColorControlState extends State<ImageColorControl> {
  final colorList = <MyColor>[
    MyColor(title: 'red', color: Colors.red),
    MyColor(title: 'green', color: Colors.green),
    MyColor(title: 'blue', color: Colors.blue),
    MyColor(title: 'yellow', color: Colors.yellow),
    MyColor(title: 'grey', color: Colors.grey),
  ];

  final blendList = <MyBlender>[
    MyBlender(title: 'Difference', blendMode: BlendMode.difference),
    MyBlender(title: 'Hue', blendMode: BlendMode.hue),
    MyBlender(title: 'Color', blendMode: BlendMode.color),
    MyBlender(title: 'Color Burn', blendMode: BlendMode.colorBurn),
    MyBlender(title: 'Color Doge', blendMode: BlendMode.colorDodge),
  ];

  Color _color = Colors.transparent;
  BlendMode? _blendMode = BlendMode.color;
  MyColor? _selected = null;
  MyBlender? _belenderSelected = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Filter Control'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Image.asset(
              'images/flower.jpg',
              height: 300,
              color: _color,
              colorBlendMode: _blendMode,
              fit: BoxFit.cover,
            ),
          ),

          Container(
            padding: EdgeInsets.all(10),
            color: Colors.grey.shade300,
            child: Column(
              children: [
                const Text('Color: '),
                Wrap(
                  children: colorList
                      .map((myColor) => colorButtons(myColor))
                      .toList(),
                ),
                const Text('Blend Mode: '),
                Wrap(
                  children: blendList
                      .map((myBlender) => blendButtons(myBlender))
                      .toList(),
                ),
              ],
            ),
          ),
          // ListTile(
          //   title: Text('Color: '),
          //   subtitle: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceAround,
          //     children: [
          //       colorButtons('red', Colors.red),
          //       colorButtons('green', Colors.green),
          //       colorButtons('blue', Colors.blue),
          //       colorButtons('purple', Colors.purple),
          //       colorButtons('cyan', Colors.cyan),
          //     ],
          //   ),
          // ),
          // ListTile(
          //   title: Text('Blend Mode: '),
          //   subtitle: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceAround,
          //     children: [
          //       blendButtons('Diff', BlendMode.difference),
          //       blendButtons('plus', BlendMode.plus),
          //       blendButtons('hue', BlendMode.hue),
          //       blendButtons('color', BlendMode.color),
          //       blendButtons('burn', BlendMode.colorBurn),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }

  Padding colorButtons(MyColor myColor) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor:
              _selected?.title == myColor.title ? Colors.brown : Colors.blue,
        ),
        onPressed: () {
          setState(() {
            _color = myColor.color;
            _selected = myColor;
          });
        },
        child: Text(
          myColor.title.toUpperCase(),
        ),
      ),
    );
  }

  Padding blendButtons(MyBlender myBlender) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: _belenderSelected?.title == myBlender.title
              ? Colors.brown
              : Colors.blue,
        ),
        onPressed: () {
          setState(() {
            _blendMode = myBlender.blendMode;
            _belenderSelected = myBlender;
          });
        },
        child: Text(
          myBlender.title.toUpperCase(),
        ),
      ),
    );
  }
}
