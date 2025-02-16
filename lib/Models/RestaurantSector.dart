class RestaurantSector {
  late int id;
  late String name;

  RestaurantSector({required this.id, required this.name});

  RestaurantSector.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  equals(RestaurantSector sector) {
    return this.id == sector.id;
  }
}
