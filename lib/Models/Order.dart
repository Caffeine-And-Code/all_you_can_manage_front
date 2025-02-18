import 'dart:convert';
import 'package:all_you_can_manage/Models/Model.dart';
import 'package:all_you_can_manage/Models/OrderProduct.dart';
import 'package:all_you_can_manage/Models/User.dart';

class Order extends Model {
  late int covered; // What is this?
  late User user;
  late List<OrderProduct> products;
  late bool precheckPrinted;
  late DateTime createdAt;
  late bool isClose;

  Order({
    required super.id,
    required this.covered,
    required this.user,
    required this.precheckPrinted,
    required this.createdAt,
    required this.isClose,
    required this.products,
  });

  Order.empty() : super.empty() {
    covered = -1;
    user = User.empty();
    precheckPrinted = false;
    createdAt = DateTime.now();
    isClose = false;
  }

  Order.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    covered = json['covered'];
    user = User.fromJson(json['user']);
    precheckPrinted = json['precheckPrinted'];
    createdAt = DateTime.parse(json['createdAt']);
    isClose = json['isClose'];
  }

  Order.fromJsonString(String json) : super.fromJsonString(json) {
    Order.fromJson(jsonDecode(json));
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'covered': covered,
      'user': user.toJson(),
      'precheckPrinted': precheckPrinted,
      'createdAt': createdAt.toIso8601String(),
      'isClose': isClose
    };
  }
}
