import 'dart:convert';

import 'package:all_you_can_manage/Models/Model.dart';
import 'package:all_you_can_manage/Models/Modifier.dart';
import 'package:all_you_can_manage/Models/Product.dart';

class OrderProduct extends Model {
  late int quantity;
  late int taxAmount;
  late int paidAmount;
  late double discount;
  late Product product;
  late List<Modifier> modifiers;

  OrderProduct({
    required super.id,
    required this.quantity,
    required this.taxAmount,
    required this.paidAmount,
    required this.discount,
    required this.product,
    required this.modifiers,
  }):assert(quantity >= 0 && taxAmount >= 0 && paidAmount >= 0 && paidAmount <= quantity && discount >= 0 && modifiers.where((element) => !product.possibleModifiers.contains(element)).isEmpty);

  OrderProduct.empty() : super.empty() {
    quantity = -1;
    taxAmount = -1;
    paidAmount = -1;
    discount = -1;
    product = Product.empty();
    modifiers = [];
  }

  OrderProduct.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    quantity = json['quantity'];
    taxAmount = json['taxAmount'];
    paidAmount = json['paidAmount'];
    discount = json['discount'];
    product = Product.fromJson(json['product']);
    modifiers =
        List<Modifier>.from(json['modifiers'].map((x) => Modifier.fromJson(x)));
  }

  OrderProduct.fromJsonString(String jsonString)
      : super.fromJsonString(jsonString) {
    OrderProduct.fromJson(jsonDecode(jsonString));
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'quantity': quantity,
      'taxAmount': taxAmount,
      'paidAmount': paidAmount,
      'discount': discount,
      'product': product.toJson(),
      'modifiers': modifiers.map((e) => e.toJson()).toList()
    };
  }

  // get the final prize of the product with all the modifiers, discount, tax and paid amount
  getFinalPrize() {
    double total = product.price;
    // prize with additional modifiers
    for (var modifier in modifiers) {
      total += modifier.price;
    }
    // to the prize we add the tax amount
    total += taxAmount;
    // to the prize we subtract the discount
    total -= discount;
    // multiply this prize for the quantity
    total *= quantity;
    // at the end we need to subtract the paid amount
    //(which is the number of this product the customer has already paid)
    total -= paidAmount * quantity; 
    return total;
  }
}
