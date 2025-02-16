import 'package:all_you_can_manage/Models/Product.dart';
import 'package:all_you_can_manage/Models/RestaurantSector.dart';
import 'package:flutter/material.dart';

enum TableStatus { free, busy, reserved }

class Table {
  late int id;
  late RestaurantSector sector;
  late List<Product> products;
  late TableStatus status;

  Table({required this.id, required this.sector, required this.products,required this.status});

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

  getTableColor(){
    switch (status) {
      case TableStatus.free:
        return Colors.green;
      case TableStatus.busy:
        return Colors.red;
      case TableStatus.reserved:
        return Colors.yellow;
    }
  }

  Table.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sector = RestaurantSector.fromJson(json['sector']);
    products = json['products'];
  }
}
