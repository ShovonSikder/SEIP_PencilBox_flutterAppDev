import 'dart:math';

class Calculator {
  static double pi = 3.1416;
  static num add(num x, num y) => x + y;
  static num subtract(num x, num y) => x - y;
  static num multiply(num x, num y) => x * y;
  static num circleCircum(num r) => 2 * pi * r;
  static num power(num x, num y) => pow(x, y);
  static num sqrRt(num x) => sqrt(x);
  static dynamic divide(num x, num y) {
    if (y == 0) return "Infinity";
    return x / y;
  }
}
