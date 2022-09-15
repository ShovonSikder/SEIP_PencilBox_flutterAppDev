import 'package:class5_oop/class_work/class5_oop.dart' as class5_oop;
import 'package:class5_oop/class_work/employee.dart';
import 'package:class5_oop/class_work/hourly_salried_employee.dart';
import 'package:class5_oop/class_work/monthly_salarried_employee.dart';

void main(List<String> arguments) {
  // Employee employee =
  //     Employee(name: 'shovon', designation: 'JrSE', salary: -0.0);

  MonthlySalariedEmployee mse = MonthlySalariedEmployee(
    name: 'shovon',
    designation: 'JrSE',
    salary: 100000,
  );

  // print(monthlySalariedEmployee.salary);

  final hse = HourlySalariedEmployee(
    name: 'shovon',
    designation: 'Mngr',
    totalHour: 40,
    hourlyRate: 500.00,
  );

  Employee emp = mse; //parent can hold child object.

  final employeeList = [mse, hse, emp];

  for (var employee in employeeList) {
    makeSalarySheet(employee);
  }
}

void makeSalarySheet(Employee employee) {
  print(employee.getSalary());
}
