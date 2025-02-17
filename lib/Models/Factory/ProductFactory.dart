import 'package:all_you_can_manage/Models/Factory/Factory.dart';
import 'package:all_you_can_manage/Models/Product.dart';

class ProductFactory extends Factory<Product> {
  Product createProduct() {
    return super.create(ModelTypes.Product);
  }
}