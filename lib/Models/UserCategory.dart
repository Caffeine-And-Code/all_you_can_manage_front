import 'dart:convert';
import 'package:all_you_can_manage/Models/Model.dart';
import 'package:all_you_can_manage/Utilities/colors_manager.dart';
import 'package:flutter/material.dart';



class UserCategory extends Model {
  late String name;
  // late String abilities; ??? wtf is this

  UserCategory({required super.id, required this.name});

  UserCategory.empty() : super.empty(){
    name = "";
  }

  Icon getIcon(){
    switch (name) {
      case 'Admin':
        return Icon(Icons.account_balance_outlined,size: 100,color: ColorsGetter.getColor(ColorsNames.navAndFooterText),);
      case 'Waiter':
        return Icon(Icons.person_4,size: 100,color: ColorsGetter.getColor(ColorsNames.navAndFooterText),);
      case "Commis":
        return Icon(Icons.person_3,size: 100,color: ColorsGetter.getColor(ColorsNames.navAndFooterText),);
      default:
      return Icon(Icons.person,size: 100,color: ColorsGetter.getColor(ColorsNames.navAndFooterText),);  
    }
  }

  UserCategory.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    name = json['name'];
  }

  UserCategory.fromJsonString(String jsonString) : super.fromJsonString(jsonString) {
    final Map<String, dynamic> json = jsonDecode(jsonString);
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
