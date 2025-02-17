import 'dart:convert';

abstract class Model{
  int id = -1;
  Model({required this.id});
  Model.empty(){
    id = -1;
  }
  Model.fromJson(Map<String, dynamic> json){
    id = json['id'];
  }
  Model.fromJsonString(String jsonString){
    Map<String,dynamic> json = jsonDecode(jsonString);
    id = json['id'];
  }

  equals(Model sector) {
    return id == sector.id;
  }
}