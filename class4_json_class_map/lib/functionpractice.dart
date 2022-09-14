//one method one responsibility
void main() async {
  // print("hello from function Practice");
  // print(add(4, 5));
  // Function(int, int) f = add;
  // print(f(6, 8));
  //
  // //lambda expression or anynomous
  // Function f1 = () {};
  //
  // final cities = ['dhaka', 'rongpur', 'dinajpur'];
  //
  // cities.forEach((element) {
  //   print(element);
  // });
  //
  // cities.forEach(print);

  print('Initializing...');
  await download((msg) {
    print(msg);
  });
  print('Ta ta');
}

// int add(int x, int y) {
//   return x + y;
// }
// add(int x, int y) {
//   return x + y;
// }

//fat arrow
// add(int x, int y) => x + y;

Future download(Function(String) callback) async {
  print('print downloading...');
  await Future.delayed(Duration(seconds: 5), () {
    callback("Download complete");
  });
  // print('Download Completed 222');
}
