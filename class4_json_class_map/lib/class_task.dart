// program to perform math operations

import 'dart:io';

import 'package:class4_json_class_map/calculator.dart';

dynamic stringToNum(String n) {
  try {
    return int.parse(n);
  } catch (e) {
    print(e);
  }
}

dynamic input2AndCall(Function f) {
  stdout.write('Enter first number: ');
  String? x = stdin.readLineSync();
  stdout.write('Enter second number: ');
  String? y = stdin.readLineSync();

  if (x == null || y == null) return "Enter valid input";

  return f(stringToNum(x), stringToNum(y));
}

dynamic input1AndCall(Function f) {
  stdout.write('Enter the number: ');
  String? x = stdin.readLineSync();

  if (x == null) return "Enter valid input";

  return f(stringToNum(x));
}

dynamic displayChoice() {
  stdout.write(
      '1. Add\n2. Subtract\n3. Multiply\n4. Divide\n5. Power\n6. Square Root\n7. Circle Circumstance\n8. Exit\n');

  stdout.write("Choose your option: ");
  String? choice = stdin.readLineSync();
  return choice;
}

void operation(String choice) {
  if (choice != null) {
    switch (choice) {
      case '1':
        print('adding..');
        print('Result= ${input2AndCall(Calculator.add)}');
        break;
      case '2':
        print('Subtracting...');
        print('Result= ${input2AndCall(Calculator.subtract)}');
        break;

      case '3':
        print('Multiplying...');
        print('Result= ${input2AndCall(Calculator.multiply)}');
        break;
      case '4':
        print('Dividing...');
        print('Result= ${input2AndCall(Calculator.divide)}');
        break;
      case '5':
        print('Powering...');
        print('Result= ${input2AndCall(Calculator.power)}');
        break;
      case '6':
        print('Squaring...');
        print('Result= ${input1AndCall(Calculator.sqrRt)}');
        break;
      case '7':
        print('Circling...');
        print('Result= ${input1AndCall(Calculator.circleCircum)}');
        break;
      case '8':
        exit(0);
      case '':
        //clear console
        break;
      default:
        print('Enter valid option');
    }
  }
}

void main() {
  while (true) {
    operation(displayChoice());
  }
}
