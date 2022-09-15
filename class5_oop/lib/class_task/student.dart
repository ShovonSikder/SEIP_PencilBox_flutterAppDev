abstract class Student {
  String? name;
  String? email;
  String? nid;

  Student({
    required this.name,
    required this.email,
    required this.nid,
  });

  void getInfo();

  void commonInfo() {
    print('Name: $name');
    print('Email: $email');
    print('NID: $nid');
  }
}
