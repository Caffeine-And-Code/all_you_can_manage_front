import 'package:all_you_can_manage/Models/Factory/Factory.dart';
import 'package:all_you_can_manage/Models/Table.dart' as Model;

class TableFactory extends Factory<Model.Table> {
  
  Model.Table createTable(){
    return super.create(ModelTypes.Table);
  }
}