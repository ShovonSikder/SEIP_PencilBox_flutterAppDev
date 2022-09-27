class MyImage {
  String title;
  String path;

  MyImage({required this.title, required this.path});
}

final List<MyImage> imagList = [
  MyImage(title: 'CoxBazar', path: 'images/coxbazar.jpg'),
  MyImage(title: 'Sajek Vally', path: 'images/sajek.jpg'),
  MyImage(title: 'Padma Bridge', path: 'images/pdbridge.jpg'),
  MyImage(title: 'Bike', path: 'images/bike.jpg'),
];
