class MainInfo {
  double temp;
  double feelsLike;
  double temp_min;
  double temp_max;
  int pressure;
  int humidity;
  int sea_level;
  int grnd_level;

  MainInfo(this.temp, this.feelsLike, this.temp_min, this.temp_max,
      this.pressure, this.humidity, this.sea_level, this.grnd_level);

  factory MainInfo.fromJson(Map<String, dynamic> map) {
    return MainInfo(
        map['temp'],
        map['feels like'],
        map['temp_min'],
        map['temp_max'],
        map['pressure'],
        map['humidity'],
        map['sea_level'],
        map['grnd_level']);
  }
}
