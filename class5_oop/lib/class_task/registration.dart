import 'package:class5_oop/class_task/paid_student.dart';
import 'package:class5_oop/class_task/stippend_student.dart';
import 'package:class5_oop/class_task/student.dart';

void main() {
  StippendStudent stipStdn = StippendStudent(
    name: 'Shovon Sikder',
    email: 'shovon@gmail.com',
    nid: '554349855',
  );

  PaidStudent paidStdn = PaidStudent(
    name: 'Anisur Rahman',
    email: 'anis@pencilbox.com',
    nid: '3446735655',
  );

  //student list
  final students = [stipStdn, paidStdn];

  int st_no = 1;
  for (var stdn in students) {
    print('Student No: $st_no \n--------------------');
    viewInfo(stdn);
    st_no++;
  }
}

void viewInfo(Student stdn) {
  stdn.getInfo();
}
