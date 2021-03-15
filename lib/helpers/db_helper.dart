import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart' as sql;

class DBHelper {
  static Future<sql.Database> db() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(p.join(dbPath, 'places.db'),
        onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE places (id TEXT PRIMARY KEY,title TEXT, image TEXT)');
    }, version: 1);
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    final database = await DBHelper.db();
    database.insert(table, data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }

  static Future<List<Map<String, dynamic>>> fetchDB(String table) async {
    final database = await DBHelper.db();
    return database.query(table);
  }
}
