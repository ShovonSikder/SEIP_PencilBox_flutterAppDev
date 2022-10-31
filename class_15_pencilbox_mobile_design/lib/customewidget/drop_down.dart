import 'package:flutter/material.dart';

class DropDown extends StatelessWidget {
  final List<DropdownMenuItem> items;
  final Icon icon;
  const DropDown(
      {Key? key,
      required this.items,
      this.icon = const Icon(Icons.arrow_drop_down_sharp)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(10)),
      child: DropdownButton(
        value: items[0].value,
        isExpanded: true,
        items: items,
        onChanged: (_) {},
        iconSize: 35,
        icon: icon,
      ),
    );
  }
}
