class Cloud {
  int all;

  Cloud(this.all);

  factory Cloud.fromJson(Map<String, dynamic> map) {
    return Cloud(map['all']);
  }
}
