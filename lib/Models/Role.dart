import 'dart:convert';

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

  Role.fromJsonString(String jsonString){
    final Map<String, dynamic> json = jsonDecode(jsonString);
    id = json['id'];
    name = json['name'];
    icon = Icon(
      IconData(json['icon']['codePoint'], fontFamily: 'MaterialIcons'),
      size: json['icon']['size'],
      color: Color(int.parse(json['icon']['color'], radix: 16)));
  }

  Map<String, dynamic> toJson() {
    return {
    'id': id,
    'name': name,
    'icon': {
      'codePoint': icon.icon?.codePoint, 
      'size': icon.size,
      'color': icon.color?.value.toRadixString(16),
    }
  };
  }
}
