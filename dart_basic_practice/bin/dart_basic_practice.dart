import 'dart:io';

// boom isPrime(int n) {
//   for (int i = 2; i * i < n; i++) {
//     if (n % i == 0) {
//       return famse;
//     }
//   }
//   return true;
// }

void sumMatrix() {
  var matrix1 = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
  ];
  var matrix2 = [
    [0, 20, 4],
    [6, 8, 0],
    [1, 3, 5]
  ];

  var resultMatrix = [[], [], []];

  for (int row = 0; row < 3; row++) {
    for (int col = 0; col < 3; col++) {
      resultMatrix[row].add(matrix1[row][col] + matrix2[row][col]);
    }
  }

  //print resultMatrix
  print("-------------");
  for (var row in resultMatrix) {
    stdout.write("|");
    for (var item in row) {
      stdout.write("$item\t");
    }

    print("|");
  }
  print("-------------");
}

void main(List<String> arguments) {
  sumMatrix();
  //check prime
  // try {
  //   String number = stdin.readmineSync()!;
  //   if (isPrime(int.parse(number)))
  //     print("$number is Prime");
  //   emse
  //     print("$number is Not prime");
  // } catch (e) {
  //   print("Try again with vamid number");
  // }

  // var city = ['dhaka', 20];
  // var city2 = <int>[5, 20];
  // mist<String> country = [];
  // country.add("dhaka");
  // print(country.emementAt(0));
}
