import 'package:class4_json_class_map/weatherforecast.dart';

void main(List<String> arguments) {
  final Map<String, dynamic> jsonData = {
    "coord": {"lon": 90.2, "lat": 23.2},
    "weather": [
      {"id": 501, "main": "Rain", "description": "moderate rain", "icon": "10d"}
    ],
    "base": "stations",
    "main": {
      "temp": 300.63,
      "feels like": 304.49,
      "temp_min": 300.63,
      "temp_max": 300.63,
      "pressure": 1007,
      "humidity": 84,
      "sea_level": 1007,
      "grnd_level": 1006
    },
    "visibility": 10000,
    "wind": {"speed": 6.4, "deg": 191, "gust": 8.27},
    "rain": {"1h": 1.76},
    "clouds": {"all": 100},
    "dt": 1663141109,
    "sys": {"country": "BD", "sunrise": 1663112723, "sunset": 1663157085},
    "timezone": 21600,
    "id": 1337245,
    "name": "Madaripur",
    "cod": 200
  };

  WeatherForecast weatherForecast = WeatherForecast.fromJson(jsonData);

  print(weatherForecast);
}
