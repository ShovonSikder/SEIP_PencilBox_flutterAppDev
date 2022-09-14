class Course {
  String name;
  double credit;

  Course({required this.name,required this.credit});

  factory Course.fromMap(Map<String, dynamic> map) {
    return Course(name:map['name'], credit:map['credit'] * 1.0);
  }
}
