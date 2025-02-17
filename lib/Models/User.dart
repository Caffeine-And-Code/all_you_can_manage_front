import 'dart:convert';
import 'package:all_you_can_manage/Models/Model.dart';
import 'package:all_you_can_manage/Models/UserCategory.dart';

class User extends Model {
  late String name;
  late UserCategory role;

  User({required super.id, required this.name,required this.role});

  User.empty() : super.empty(){
    name = "";
    role = UserCategory.empty();
  }

  User.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    name = json['name'];
    role = UserCategory.fromJson(json['role']);
  }

  User.fromJsonString(String jsonString) : super.fromJsonString(jsonString) {
    final Map<String, dynamic> json = jsonDecode(jsonString);
    name = json['name'];
    role = UserCategory.fromJson(json['role']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'role': role.toJson(),
    };
  }
}
