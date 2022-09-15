class Sys {
  String country;
  int sunRise;
  int sunSet;

  Sys(this.country, this.sunRise, this.sunSet);

  //system factory constructor
  factory Sys.fromJson(Map<String, dynamic> map) {
    return Sys(map['country'], map['sunrise'], map['sunset']);
  }
}
