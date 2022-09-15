class Weather {
  int id;
  String main;
  String description;
  String icon;

  Weather(this.id, this.main, this.description, this.icon);

  factory Weather.fromJson(Map<String, dynamic> map) {
    return Weather(map['id'], map['main'], map['description'], map['icon']);
  }
}
