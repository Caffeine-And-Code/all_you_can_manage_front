import 'package:all_you_can_manage/Models/Factory/Factory.dart';
import 'package:all_you_can_manage/Models/Room.dart';

class RoomFactory extends Factory<Room> {
  Room createRoom() {
    return super.create(ModelTypes.Room);
  }

  static List<Room> getPresetOfRooms() {
    return [
      Room(id: 0, name: "Room 1"),
      Room(id: 1, name: "Room 2"),
      Room(id: 2, name: "Room 3"),
    ];
  }
}