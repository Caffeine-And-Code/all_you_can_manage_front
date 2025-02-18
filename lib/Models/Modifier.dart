import 'dart:convert';

import 'package:all_you_can_manage/Models/Model.dart';

class Modifier  extends Model{
  late String name;
  late double price;

  Modifier({
    required super.id,
    required this.name,
    required this.price,
  });

  Modifier.empty() : super.empty() {
    name = "";
    price = 0.0;
  }

  Modifier.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    name = json['name'];
    price = json['price'];
  }

  Modifier.fromJsonString(String jsonString) : super.fromJsonString(jsonString) {
    Modifier.fromJson(jsonDecode(jsonString));
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
    };
  }
}