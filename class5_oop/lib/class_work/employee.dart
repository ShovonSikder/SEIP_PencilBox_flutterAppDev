abstract class Employee {
  String? name;
  String? designation;

  Employee({
    required this.name,
    required this.designation,
  });

  double getSalary();
}
