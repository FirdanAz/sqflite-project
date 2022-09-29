import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqflite_projects/database_model.dart';

class DatabaseHelper{

  static final _DbName = "myDatabase.db";
  static final _DbVersion = 1;
  static final _tableName = "myTable";

  static final columnId = "_id";
  static final columnName = "name";

  DatabaseHelper._privatConstructor();
  static DatabaseHelper instance = DatabaseHelper._privatConstructor();

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    else _database = await _initiateDatabase();
    return _database!;
  }

  Future _initiateDatabase() async{
    Directory directory =  await getApplicationDocumentsDirectory();
    String path = join(directory.path,_DbName);
    return await openDatabase(path,version: _DbVersion,onCreate: _onCreate);
  }
  Future _onCreate(Database db, int version) async {
    db.execute(
        '''
          CREATE TABLE $_tableName ( 
          $columnId INTEGER PRIMARY KEY,
          $columnName TEXT NOT NULL)
        '''
    );
  }

  Future<int> insert(DatabaseModel databaseModel) async {
    Database db = await instance.database;
    final qr = await db.insert(_tableName, databaseModel.toMap());
    return qr;
  }

  Future<List<Map<String, Object?>>> queryAll() async {
    Database db = await instance.database;
    return await db.query(_tableName);
  }

  Future<int> update(int id, DatabaseModel databaseModel) async {
    Database db = await instance.database;
    final query = await db.update(_tableName, databaseModel.toMap(),
        where: '$columnId = ?', whereArgs: [id]);

    return query;
  }
  Future<List<Map<String, Object?>>> listname() async {
    Database db = await instance.database;
    final query = await db.query(_tableName, where: '$columnId = ?', whereArgs: [columnId]);

    return query;
  }

  Future<int> delete(int id) async {
    Database db = await instance.database;

    return await db.delete(_tableName, where: '$columnId = ?', whereArgs: [id]);
  }
}