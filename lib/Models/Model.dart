import 'dart:convert';

abstract class Model implements Comparable<Model> {
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

  equals(Model other) {
    return id == other.id && runtimeType == other.runtimeType;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Model && other.runtimeType == runtimeType && other.id == id;
  }

  @override
  int compareTo(Model other) {
    return id.compareTo(other.id);
  }
}