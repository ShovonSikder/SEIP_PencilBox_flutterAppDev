class Coord {
  double lon;
  double lat;

  Coord(this.lon, this.lat);

  factory Coord.fromJson(Map<String, dynamic> map) {
    return Coord(map['lon'], map['lat']);
  }
}
