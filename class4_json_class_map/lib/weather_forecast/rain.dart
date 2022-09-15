class Rain {
  double h1;

  Rain(this.h1);

  factory Rain.fromJson(Map<String, dynamic> map) {
    return Rain(map['1h']);
  }
}
