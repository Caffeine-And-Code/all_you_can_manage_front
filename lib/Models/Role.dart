import 'package:flutter/material.dart';

class Role {
  late int id;
  late String name;
  late Icon icon;

  Role({required this.id, required this.name, required this.icon});

  Role.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['icon'] = icon;
    return data;
  }
}
