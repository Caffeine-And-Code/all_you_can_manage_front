import 'package:all_you_can_manage/Models/Factory/Factory.dart';
import 'package:all_you_can_manage/Models/User.dart';

class UserFactory extends Factory<User> {
  
  User createUser(){
    return super.create(ModelTypes.User);
  }
}
