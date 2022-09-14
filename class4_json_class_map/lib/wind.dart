class Wind {
//  "speed": 6.4, "deg": 191, "gust": 8.27
  double speed;
  int deg;
  double gust;

  Wind(this.speed, this.deg, this.gust);

  factory Wind.fromJson(Map<String, dynamic> map) {
    return Wind(map['speed'], map['deg'], map['gust']);
  }
}
