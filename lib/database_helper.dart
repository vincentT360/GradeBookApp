
import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'models/user_classes.dart';

class DatabaseHelper {
  static final _databaseName = "userClasses_database.db";
  static final _databaseVersion = 1;
  
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();


  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion,
        onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute("CREATECREATE TABLE userClasses ("
          "class_name TEXT PRIMARY KEY,"
          "grade REAL,"
          "weight1 REAL,"
          "weight1_value REAL,"
          "weight2 REAL,"
          "weight2_value REAL,"
          "weight3 REAL,"
          "weight3_value REAL,"
          "weight4 REAL,"
          "weight4_value REAL,"
          "weight5 REAL,"
          "weight5_value REAL,"
          "weight6 REAL,"
          "weight6_value REAL,"
          "weight7 REAL,"
          "weight7_value REAL"
          ")");
  }

//------------------ Helper methods -----------

  //Add a row
  Future<void> insertClass(UserClasses classToAdd) async {
  final Database db = await database;

  await db.insert(
    'userClasses',
    classToAdd.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
  }

  //Retrieve all rows
  Future<List<UserClasses>> getClasses() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('userClasses');
    return List.generate(maps.length, (i) {
      return UserClasses(
        className: maps[i]['class_name'],
        grade: maps[i]['grade'],
        weight1: maps[i]['weight1'],
        weight1Value: maps[i]['weight1_value'],
        weight2: maps[i]['weight2'],
        weight2Value: maps[i]['weight2_value'],
        weight3: maps[i]['weight3'],
        weight3Value: maps[i]['weight3_value'],
        weight4: maps[i]['weight4'],
        weight4Value: maps[i]['weight4_value'],
        weight5: maps[i]['weight5'],
        weight5Value: maps[i]['weight5_value'],
        weight6: maps[i]['weight6'],
        weight6Value: maps[i]['weight6_value'],
        weight7: maps[i]['weight7'],
        weight7Value: maps[i]['weight7_value'],
      );
    });
  }

  //Delete a row
  Future<void> deleteClass(String id) async {
    final db = await database;

    await db.delete('userClasses', where: "class_name = ?", whereArgs: [id]);
  }

}
