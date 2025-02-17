import 'package:all_you_can_manage/Models/Factory/ProductFactory.dart';
import 'package:all_you_can_manage/Models/Factory/RoomFactory.dart';
import 'package:all_you_can_manage/Models/Factory/UserCategoryFactory.dart';
import 'package:all_you_can_manage/Models/Model.dart';
import 'package:all_you_can_manage/Models/Product.dart';
import 'package:all_you_can_manage/Models/User.dart';
import 'dart:math';
import 'package:all_you_can_manage/Models/Table.dart' as t;

enum PrimitiveTypes { String, int, double, DateTime }

enum ModelTypes { Product, UserCategory, User, Room, Table }

// Factory class to create instances of Models [FOR DEMO/DEBUG PURPOSES]
abstract class Factory<T extends Model> {
  /// Creates an instance of a [Model] class with random values
  T create(ModelTypes classType) {
    T toReturn;
    switch (classType) {
      case ModelTypes.Product:
        toReturn = Product(
          id: randomValue(PrimitiveTypes.int),
          name: randomValue(PrimitiveTypes.String),
          price: randomValue(PrimitiveTypes.double),
          inventoryQuantity: randomValue(PrimitiveTypes.int),
          availableSince: randomValue(PrimitiveTypes.DateTime),
        ) as T;
      case ModelTypes.UserCategory:
        toReturn = UserCategoryFactory.getPresetOfCategories()[Random()
            .nextInt(UserCategoryFactory.getPresetOfCategories().length)] as T;
      case ModelTypes.User:
        toReturn = User(
          id: randomValue(PrimitiveTypes.int),
          name: randomValue(PrimitiveTypes.String),
          role: UserCategoryFactory().createCategory(),
        ) as T;
      case ModelTypes.Room:
        toReturn = RoomFactory.getPresetOfRooms()[Random()
            .nextInt(RoomFactory.getPresetOfRooms().length)] as T;
      case ModelTypes.Table:
        toReturn = t.Table(
          id: randomValue(PrimitiveTypes.int),
          number: randomValue(PrimitiveTypes.int),
          room: RoomFactory().createRoom(),
          products: List.generate(Random().nextInt(10),
              (index) => ProductFactory().createProduct()),
        ) as T;
      default:
        throw Exception("Invalid type");
    }
    return toReturn;
  }

  /// randomizer that given a primitive type, returns a random value of that type.
  dynamic randomValue(PrimitiveTypes type) {
    final Random random = Random();
    switch (type) {
      case PrimitiveTypes.String:
        return _randomString(
            randomValue(PrimitiveTypes.int), random);
      case PrimitiveTypes.int:
        return random.nextInt(20) + 1;
      case PrimitiveTypes.double:
        return random.nextDouble() * 50;
      case PrimitiveTypes.DateTime:
        return DateTime.now().subtract(Duration(days: random.nextInt(365)));
      default:
        throw Exception("Invalid type");
    }
  }

  /// Generates a random string of the given length
  String _randomString(int length, Random random) {
    const chars =
        "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    return List.generate(length, (index) => chars[random.nextInt(chars.length)])
        .join();
  }
}
