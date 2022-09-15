import 'package:class5_oop/class_work/employee.dart';

class HourlySalariedEmployee extends Employee {
  double totalHour;
  double hourlyRate;

  HourlySalariedEmployee({
    required super.name,
    required super.designation,
    required this.totalHour,
    required this.hourlyRate,
  });

  @override
  double getSalary() {
    // TODO: implement getSalary
    return totalHour * hourlyRate;
  }
}
