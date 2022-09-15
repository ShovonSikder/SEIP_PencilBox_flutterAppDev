import 'package:class5_oop/class_task/student.dart';
import 'package:class5_oop/class_task/tiffin.dart';

class PaidStudent extends Student with Tiffin {
  PaidStudent({
    required super.name,
    required super.email,
    required super.nid,
  });

  @override
  void getInfo() {
    // TODO: implement getInfo
    commonInfo();
    print('Type: Paid');
    print("Tiffin: $hasTiffin");
  }
}
