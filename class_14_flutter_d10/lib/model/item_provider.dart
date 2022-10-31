import 'package:flutter/cupertino.dart';

class ItemProvider extends ChangeNotifier {
  int index = 1;
  List<String> items = [];
  add() {
    items.add('Items $index');
    index++;
    notifyListeners();
  }

  remove() {
    if (items.length > 0) {
      items.removeLast();
      index--;
      notifyListeners();
    }
  }
}
