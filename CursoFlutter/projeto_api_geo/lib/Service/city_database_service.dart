import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../Model/city_model.dart';

class CityDbService {
  static const String DB_NAME = 'db.db';
  static const String TABLE_NAME = 'cities';
  static const String CREATE_TABLE_SCRIPT = """CREATE TABLE cities(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          cityname TEXT,
          favoritescities INTEGER)""";

  Future<Database> _openDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), DB_NAME),
      onCreate: (db, version) {
        return db.execute(CREATE_TABLE_SCRIPT);
      },
      version: 1,
    );
  }

  Future<void> insertCity(City city) async {
    try {
      Database db = await _openDatabase();
      await db.insert(TABLE_NAME, city.toMap());
      db.close();
    } catch (e) {
      print(e);
    }
  }

  Future<List<Map<String, dynamic>>> listCity() async {
    try {
      Database db = await _openDatabase();
      List<Map<String, dynamic>> maps = await db.query(TABLE_NAME);
      db.close();
      return maps;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<void> deleteCity(String city) async {
    try {
      Database db = await _openDatabase();
      await db.delete(TABLE_NAME, where: 'cityname =?', whereArgs: [city]);
      db.close();
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateCity(City city) async {
    try {
      Database db = await _openDatabase();
      await db.update(TABLE_NAME, city.toMap(),
          where: 'cityname = ?', whereArgs: [city.cityName]);
      db.close();
    } catch (e) {
      print(e);
    }
  }
}
