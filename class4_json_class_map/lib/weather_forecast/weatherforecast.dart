import 'package:class4_json_class_map/weather_forecast/cloud.dart';
import 'package:class4_json_class_map/weather_forecast/coord.dart';
import 'package:class4_json_class_map/weather_forecast/maininfo.dart';
import 'package:class4_json_class_map/weather_forecast/rain.dart';
import 'package:class4_json_class_map/weather_forecast/sys.dart';
import 'package:class4_json_class_map/weather_forecast/weather.dart';
import 'package:class4_json_class_map/weather_forecast/wind.dart';

class WeatherForecast {
  Coord coord;
  List<Weather> weather;
  String base;
  MainInfo main;
  int visibility;
  Wind wind;
  Rain rain;
  Cloud clouds;
  int dt;
  Sys sys;
  int timezone;
  int id;
  String name;
  int cod;

  WeatherForecast(
      this.coord,
      this.weather,
      this.base,
      this.main,
      this.visibility,
      this.wind,
      this.rain,
      this.clouds,
      this.dt,
      this.sys,
      this.timezone,
      this.id,
      this.name,
      this.cod);

  factory WeatherForecast.fromJson(Map<String, dynamic> map) {
    return WeatherForecast(
        Coord.fromJson(map['coord']),
        [for (var w in map['weather']) Weather.fromJson(w)],
        map['base'],
        MainInfo.fromJson(map['main']),
        map['visibility'],
        Wind.fromJson(map['wind']),
        Rain.fromJson(map['rain']),
        Cloud.fromJson(map['clouds']),
        map['dt'],
        Sys.fromJson(map['sys']),
        map['timezone'],
        map['id'],
        map['name'],
        map['cod']);
  }
}
