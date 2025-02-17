import 'dart:convert';
import 'package:all_you_can_manage/Models/Model.dart';

class Product extends Model {
  late String name;
  late double price;
  late int inventoryQuantity;
  late DateTime availableSince;

  Product(
      {required super.id,
      required this.name,
      required this.price,
      required this.inventoryQuantity,
      required this.availableSince}):assert(price >= 0);

  Product.empty() : super.empty() {
    name = "";
    price = 0.0;
    inventoryQuantity = 0;
    availableSince = DateTime.now();
  }

  Product.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    name = json['name'];
    price = json['price'];
  }

  Product.fromJsonString(String jsonString) : super.fromJsonString(jsonString) {
    {
      Product.fromJson(jsonDecode(jsonString));
    }

    Map<String, dynamic> toJson() {
      return {
        'id': id,
        'name': name,
        'price': price,
        'inventoryQuantity': inventoryQuantity,
        'availableSince': availableSince
      };
    }
  }
}
