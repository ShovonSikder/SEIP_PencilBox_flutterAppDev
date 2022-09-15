import 'package:class5_oop/class_task/student.dart';

class StippendStudent extends Student {
  StippendStudent({
    required super.name,
    required super.email,
    required super.nid,
  });

  @override
  void getInfo() {
    // TODO: implement getInfo
    commonInfo();
    print('Type: Stippend');
  }
}
