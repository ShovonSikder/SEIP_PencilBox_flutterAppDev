import 'package:class5_oop/class_work/employee.dart';
import 'package:class5_oop/class_work/food_allowance.dart';

// class MonthlySalariedEmployee extends Employee implements FoodAllowance
class MonthlySalariedEmployee extends Employee with FoodAllowance {
  //implements vs with
  double salary;
  MonthlySalariedEmployee({
    required super.name,
    required super.designation,
    required this.salary,
    // required this.amount
  });

  @override
  double getSalary() {
    // TODO: implement getSalary
    return salary;
  }

  // @override
  // double amount;
}
