import 'dart:convert';

import 'package:all_you_can_manage/Models/Model.dart';

class ProductCategory extends Model{
  late String name;

  ProductCategory({required super.id, required this.name});

  ProductCategory.empty() : super.empty(){
    name = "";
  }

  ProductCategory.fromJson(Map<String, dynamic> json) : super.fromJson(json){
    name = json['name'];
  }

  ProductCategory.fromJsonString(String json):super.fromJsonString(json){
    ProductCategory.fromJson(jsonDecode(json));
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
  };
}