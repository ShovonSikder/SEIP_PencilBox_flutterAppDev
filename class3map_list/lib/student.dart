import 'package:class3map_list/course.dart';

class Student {
  String name;
  int id;
  String dept;
  List<Course> course;

  Student(this.name, this.id, this.dept, this.course);

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(map['name'], map['id'], map['dept'],
        [for (var crsMap in map['course']) Course.fromMap(crsMap)]);
  }
}
