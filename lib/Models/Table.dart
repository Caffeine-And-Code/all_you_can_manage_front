import 'dart:convert';
import 'package:all_you_can_manage/Models/Model.dart';
import 'package:all_you_can_manage/Models/Order.dart';
import 'package:all_you_can_manage/Models/Room.dart';
import 'package:flutter/material.dart';

enum TableStatus { free, busy, precheckPrinted, unknown }

class Table extends Model {
  late int number;
  late Room room;
  late List<Order> orders;
  late TableStatus status;

  Table({
    required super.id,
    required this.number,
    required this.room,
    required this.orders,
  }) {
    status = getStatus();
  }

  Table.empty() : super.empty() {
    number = 0;
    room = Room.empty();
    orders = List.empty();
    status = TableStatus.unknown;
  }

  //TODO => check if this function is still needed when the server will be implemented
  calculateTotal() {
    Order? currentOrder = getCurrentOrder();
    if (currentOrder == null) {
      return 0;
    }
    double total = 0;
    for (var orderProduct in currentOrder.products) {
      total += orderProduct.getFinalPrize();
    }
    return total.toStringAsFixed(2);
  }

  //TODO => check the logic of this function, and consider how the "Coperti" will be managed server side
  calculatePersonsAtTable() {
    Order? currentOrder = getCurrentOrder();
    if (currentOrder == null) {
      return 0;
    }
    int persons = 0;

    for (var orderProduct in currentOrder.products) {
      if (orderProduct.product.name == "Coperto") {
        persons += orderProduct.quantity;
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
      case TableStatus.precheckPrinted:
        return Colors.yellow;
      default:
        return Colors.grey;
    }
  }

  Order? getCurrentOrder() {
    if (orders.isEmpty) {
      return null;
    }

    // get the order that has the latest createdAt
    DateTime lastOrder = orders[0].createdAt;
    Order currentOrder = orders[0];

    for (var order in orders) {
      if (order.createdAt.isAfter(lastOrder) && !order.isClose) {
        lastOrder = order.createdAt;
        currentOrder = order;
      }
    }
    if (currentOrder.isClose) {
      return null;
    }
    return currentOrder;
  }

  getStatus() {
    Order? currentOrder = getCurrentOrder();
    if (currentOrder == null) {
      return TableStatus.free;
    }
    if (currentOrder.precheckPrinted) {
      return TableStatus.precheckPrinted;
    }
    return TableStatus.busy;
  }

  Table.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    room = Room.fromJson(json['sector']);
    number = json['number'];
    orders = (json['orders'] as List<dynamic>)
        .map((e) => Order.fromJson(e))
        .toList();
    status = getStatus();
  }

  Table.fromJsonString(String jsonString) : super.fromJsonString(jsonString) {
    Table.fromJson(jsonDecode(jsonString));
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'number': number,
      'room': room.toJson(),
      'orders': orders.map((e) => e.toJson()).toList(),
    };
  }
}
