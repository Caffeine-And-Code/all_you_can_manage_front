// ignore_for_file: constant_identifier_names
import 'package:all_you_can_manage/Models/Modifier.dart';
import 'package:all_you_can_manage/Models/Order.dart';
import 'package:all_you_can_manage/Models/OrderProduct.dart';
import 'package:all_you_can_manage/Models/Product.dart';
import 'package:all_you_can_manage/Models/ProductCategory.dart';
import 'package:all_you_can_manage/Models/Room.dart';
import 'package:all_you_can_manage/Models/User.dart';
import 'package:all_you_can_manage/Models/Table.dart' as t;
import 'package:all_you_can_manage/Models/UserCategory.dart';

// Factory class to create instances of Models [FOR DEMO/DEBUG PURPOSES]
class Factory {
  static List<Room> getPresetOfRooms() {
    return [
      Room(id: 0, name: "Room 1"),
      Room(id: 1, name: "Room 2"),
      Room(id: 2, name: "Room 3"),
    ];
  }

  static List<UserCategory> getPresetOfCategories() {
    return [
      UserCategory(id: 0, name: "Admin"),
      UserCategory(id: 1, name: "Waiter"),
      UserCategory(id: 2, name: "Commis"),
    ];
  }

  static List<User> getPresetOfUsers() {
    return [
      User(id: 0, name: "cassa", role: getPresetOfCategories()[0]),
      User(id: 1, name: "Cameriere 1", role: getPresetOfCategories()[1]),
      User(id: 2, name: "Commis 1", role: getPresetOfCategories()[2]),
      User(id: 1, name: "Cameriere 2", role: getPresetOfCategories()[1]),
      User(id: 2, name: "Commis 2", role: getPresetOfCategories()[2]),
    ];
  }

  static List<Modifier> getPresetOfModifiers() {
    return [
      Modifier(id: 0, name: "Extra cheese", price: 1.0),
      Modifier(id: 1, name: "Extra bacon", price: 1.5),
      Modifier(id: 2, name: "Extra egg", price: 1.0),
    ];
  }

  static List<ProductCategory> getPresetOfProductCategories() {
    return [
      ProductCategory(id: 0, name: "Pizza"),
      ProductCategory(id: 1, name: "Drink"),
      ProductCategory(id: 2, name: "Dessert"),
      ProductCategory(id: 3, name: "Cucina"),
      ProductCategory(id: 4, name: "Varie"),
    ];
  }

  static List<Product> getPresetOfProducts() {
    return [
      Product(
        id: 0,
        name: "Pizza Margherita",
        price: 5.0,
        possibleModifiers: getPresetOfModifiers(),
        inventoryQuantity: 2,
        availableSince: DateTime.now(),
        category: getPresetOfProductCategories()[0]
      ),
      Product(
        id: 1,
        name: "Pizza Capricciosa",
        price: 6.0,
        possibleModifiers: [],
        inventoryQuantity: 2,
        availableSince: DateTime.now(),
        category: getPresetOfProductCategories()[0]
      ),
      Product(
        id: 2,
        name: "Pizza 4 Stagioni",
        price: 7.0,
        possibleModifiers: getPresetOfModifiers(),
        inventoryQuantity: 0,
        availableSince: DateTime.now(),
        category: getPresetOfProductCategories()[0]
      ),
      Product(
        id: 3,
        name: "Coperto",
        price: 2.0,
        possibleModifiers: [],
        inventoryQuantity: 99,
        availableSince: DateTime.now(),
        category: getPresetOfProductCategories()[4]
      ),
    ];
  }

  static List<OrderProduct> getPresetOfOrderProducts() {
    return [
      OrderProduct(
          id: 0,
          product: getPresetOfProducts()[0],
          quantity: 2,
          modifiers: [getPresetOfModifiers()[0]],
          taxAmount: 1,
          discount: 0.5,
          paidAmount: 2),
      OrderProduct(
          id: 1,
          product: getPresetOfProducts()[1],
          quantity: 3,
          modifiers: [],
          taxAmount: 1,
          discount: 0.5,
          paidAmount: 1),
      OrderProduct(
          id: 2,
          product: getPresetOfProducts()[2],
          quantity: 7,
          modifiers: [getPresetOfModifiers()[1]],
          taxAmount: 1,
          discount: 0,
          paidAmount: 2),
      OrderProduct(
          id: 3,
          product: getPresetOfProducts()[3],
          quantity: 2,
          modifiers: [],
          taxAmount: 1,
          discount: 0,
          paidAmount: 0),
    ];
  }

  static List<Order> getPresetOfOrders() {
    DateTime now = DateTime.now();  
    DateTime yesterday = now.subtract(const Duration(days: 1));
    return [
      Order(
          id: 0,
          user: getPresetOfUsers()[1],
          products: getPresetOfOrderProducts(),
          isClose: true,
          precheckPrinted: true,
          covered: 1,
          createdAt: yesterday,
      ),
      Order(
          id: 1,
          user: getPresetOfUsers()[1],
          products: getPresetOfOrderProducts(),
          isClose: false,
          precheckPrinted: true,
          covered: 2,
          createdAt: now,
      ),
      Order(
          id: 2,
          user: getPresetOfUsers()[3],
          products: getPresetOfOrderProducts(),
          isClose: false,
          precheckPrinted: false,
          covered: 3,
          createdAt: now,
      )
        ];
  }

  static List<t.Table> getPresetOfTables() {
    return [
      t.Table(
          id: 0,
          number: 1,
          room: getPresetOfRooms()[0],
          orders: [getPresetOfOrders()[0], getPresetOfOrders()[1]],
      ),
      t.Table(
          id: 1,
          number: 2,
          room: getPresetOfRooms()[0],
          orders: [getPresetOfOrders()[2]],
      ),
      t.Table(
          id: 2,
          number: 3,
          room: getPresetOfRooms()[2],
          orders: [getPresetOfOrders()[0]],
      ),
      t.Table(
          id: 3,
          number: 4,
          room: getPresetOfRooms()[1],
          orders: [getPresetOfOrders()[2], getPresetOfOrders()[1]],
      ),
    ];
  }
}
