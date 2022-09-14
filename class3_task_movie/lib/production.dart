class Production {
  String name;
  double budget;
  double boxOffice;

  Production(
      {required this.name, required this.budget, required this.boxOffice});

  factory Production.fromJson(Map<String, dynamic> map) {
    return Production(
        name: map['name'], budget: map['budget'], boxOffice: map['boxoffice']);
  }
}
