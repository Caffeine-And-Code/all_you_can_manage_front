import 'dart:convert';
import 'package:all_you_can_manage/Models/Model.dart';
import 'package:all_you_can_manage/Models/Modifier.dart';
import 'package:all_you_can_manage/Models/ProductCategory.dart';

class Product extends Model {
  late String name;
  late double price;
  late int inventoryQuantity;
  late DateTime availableSince;
  late List<Modifier> possibleModifiers;
  late ProductCategory category;

  Product(
      {required super.id,
      required this.name,
      required this.price,
      required this.inventoryQuantity,
      required this.availableSince,
      required this.possibleModifiers,
      required this.category})
      : assert(price >= 0 && inventoryQuantity >= 0);

  Product.empty() : super.empty() {
    name = "";
    price = 0.0;
    inventoryQuantity = 0;
    availableSince = DateTime.now();
    possibleModifiers = [];
    category = ProductCategory.empty();
  }

  Product.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    name = json['name'];
    price = json['price'];
    inventoryQuantity = json['inventoryQuantity'];
    availableSince = DateTime.parse(json['availableSince']);
    possibleModifiers = List<Modifier>.from(
        json['possibleModifiers'].map((x) => Modifier.fromJson(x)));
    category = ProductCategory.fromJson(json['category']);
  }

  Product.fromJsonString(String jsonString) : super.fromJsonString(jsonString) {
    Product.fromJson(jsonDecode(jsonString));
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'inventoryQuantity': inventoryQuantity,
      'availableSince': availableSince.toIso8601String(),
      'possibleModifiers': possibleModifiers.map((e) => e.toJson()).toList(),
      'category': category.toJson()
    };
  }
}
