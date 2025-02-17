import 'package:all_you_can_manage/Models/Model.dart';
import 'package:all_you_can_manage/Models/Product.dart';
import 'package:all_you_can_manage/Models/Room.dart';
import 'package:flutter/material.dart';

enum TableStatus { free, busy, reserved, unknown }

class Table extends Model {
  late int number;
  late Room room;
  late List<Product> products;
  late TableStatus status;

  Table(
      {required super.id,
      required this.number,
      required this.room,
      required this.products,
      this.status = TableStatus.unknown});

  Table.empty() : super.empty() {
    number = 0;
    room = Room.empty();
    products = [];
    status = TableStatus.unknown;
  }

  //TODO => check if this function is still needed when the server will be implemented
  calculateTotal() {
    double total = 0;
    for (var prod in products) {
      total += prod.price;
    }
    return total;
  }

  //TODO => check the logic of this function, and consider how the "Coperti" will be managed server side
  calculatePersonsAtTable() {
    int persons = 0;
    for (var prod in products) {
      if (prod.name == "Coperto") {
        persons++;
      }
    }
    return persons;
  }

  getTableColor() {
    switch (status) {
      case TableStatus.free:
        return Colors.green;
      case TableStatus.busy:
        return Colors.red;
      case TableStatus.reserved:
        return Colors.yellow;
      default:
        return Colors.grey;
    }
  }

  Table.fromJson(Map<String, dynamic> json):super.fromJson(json) {
    room = Room.fromJson(json['sector']);
    products = json['products'];
  }
}
