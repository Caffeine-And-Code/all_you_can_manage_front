class Product {
  late int id;
  late String name;
  late double price;

  Product({required this.id, required this.name, required this.price});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
  }
}
