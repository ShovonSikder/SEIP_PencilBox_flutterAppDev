class Contact {
  int id;
  String name;
  String mobileNumber;
  String? email;
  String? streetAddress;
  String? website;
  String? img;
  bool favorite;

  Contact({
    required this.id,
    required this.name,
    required this.mobileNumber,
    this.email,
    this.streetAddress,
    this.website,
    this.favorite = false,
    this.img,
  });
}
