class ContactModel {
  String name;
  String mobile;
  bool favourite;

  ContactModel(
      {required this.name, required this.mobile, this.favourite = false});
}

final List<ContactModel> contactList = [
  ContactModel(name: 'Shovon', mobile: '01706961289', favourite: true),
  ContactModel(name: 'Anis', mobile: '01706961289', favourite: false),
  ContactModel(name: 'Shovon', mobile: '01706961289', favourite: true),
  ContactModel(name: 'Shovon1', mobile: '01706961289', favourite: true),
  ContactModel(name: 'Shovon2', mobile: '01706961289'),
  ContactModel(name: 'Shovon3', mobile: '01706961289', favourite: true),
  ContactModel(name: 'Shovon4', mobile: '01706961289', favourite: true),
  ContactModel(name: 'Shovon5', mobile: '01706961289', favourite: true),
  ContactModel(name: 'Shovon6', mobile: '01706961289'),
  ContactModel(name: 'Shovon7', mobile: '01706961289', favourite: true),
];
