import 'dart:async';
import 'dart:io';
import 'module.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

// Sqflite 데이터베이스 연동, sql 주입
class DatabaseHelper {
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'groceries.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE groceries(
      id INTEGER PRIMARY KEY,
      name TEXT
    )
    ''');
  }

  Future<int> remove(int id) async {
    Database db = await instance.database;
    return await db.delete('groceries', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> update(Menu grocery) async {
    Database db = await instance.database;
    return await db.update('groceries', grocery.toMap(),
        where: 'id = ?', whereArgs: [grocery.id]);
  }

  Future<List<Menu>> getGroceries() async {
    Database db = await instance.database;
    var groceries = await db.query('groceries', orderBy: 'name');
    List<Menu> groceryList = groceries.isNotEmpty
        ? groceries.map((c) => Menu.fromMap(c)).toList()
        : [];
    return groceryList;
  }

  Future<int> add(Menu grocery) async {
    Database db = await instance.database;
    return await db.insert('groceries', grocery.toMap());
  }
}