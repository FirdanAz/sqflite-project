import 'package:sqflite/sqflite.dart';

class DatabaseModel {
  int? id;
  String? nama;

  DatabaseModel({this.id, this.nama});

  factory DatabaseModel.fromMap(Map<String, dynamic> map){
    return DatabaseModel(
      id: map['id'],
      nama: map['name']
    );
  }
  Map<String, dynamic> toMap(){
    var map = <String, dynamic> {
      'name' : nama,
    };
    if(id != null){
      map['id'] = id;
    }
    return map;
  }
}