class Cast {
  String? name;
  String? role;

  Cast({required this.name, required this.role});

  factory Cast.fromJson(Map<String, String> map) {
    return Cast(name: map['name'], role: map['role']);
  }
}
