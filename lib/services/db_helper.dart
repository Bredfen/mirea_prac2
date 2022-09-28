import 'package:mirea_db_2/model/pos_model.dart';
import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

class DBHelper {
  static const int _version = 2;
  static const String _dbName = 'Drugs.db';
  static Future<Database> _getDB() async {
    return openDatabase(
      join(await getDatabasesPath(), _dbName),
      onCreate: (db, version) async => await db.execute(
          'CREATE TABLE Pos (id INTEGER PRIMARY KEY, title TEXT NOT NULL, description TEXT NOT NULL, picture BLOB);'),
      version: _version,
    );
  }

  static Future<int> addPos(Pos pos) async {
    final db = await _getDB();
    return await db.insert('Pos', pos.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> updatePos(Pos pos) async {
    final db = await _getDB();
    return await db.update('Pos', pos.toJson(),
        where: 'id = ?',
        whereArgs: [pos.id],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> deletePos(Pos pos) async {
    final db = await _getDB();
    return await db.delete(
      'Pos',
      where: 'id = ?', //? задается whereArgs
      whereArgs: [pos.id],
    );
  }

  static Future<List<Pos>?> getAllPos() async {
    final db = await _getDB();
    final List<Map<String, dynamic>> maps = await db.query('Pos');
    return maps.isEmpty
        ? null
        : List.generate(
            maps.length,
            (index) => Pos.fromJson(maps[index]),
          );
  }
}
