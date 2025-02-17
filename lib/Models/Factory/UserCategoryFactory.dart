import 'package:all_you_can_manage/Models/Factory/Factory.dart';
import 'package:all_you_can_manage/Models/UserCategory.dart';

class UserCategoryFactory extends Factory<UserCategory> {
  UserCategory createCategory() {
    return super.create(ModelTypes.UserCategory);
  }

  static List<UserCategory> getPresetOfCategories() {
    return [
      UserCategory(id: 0, name: "Admin"),
      UserCategory(id: 1, name: "Waiter"),
      UserCategory(id: 2, name: "Commis"),
    ];
  }
}