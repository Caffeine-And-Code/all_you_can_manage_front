import 'dart:convert';

import 'package:all_you_can_manage/Models/Model.dart';

class Room extends Model {
  late String name;

  Room({required super.id, required this.name});

  Room.empty():super.empty() {
    name = "";
  }

  Room.fromJson(Map<String, dynamic> json):super.fromJson(json) {
    name = json['name'];
  }

  Room.fromJsonString(String jsonString):super.fromJsonString(jsonString) {
    Map<String, dynamic> json = jsonDecode(jsonString);
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
