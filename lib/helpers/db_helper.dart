import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../data/models/history_model.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;

  static late Database _database;

  DatabaseHelper._internal() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._internal();

  Future<Database> get database async {
    _database = await _initializeDb();
    return _database;
  }

  static const String _tablename = 'history';

  Future<Database> _initializeDb() async {
    var path = await getDatabasesPath();
    var db = openDatabase(
      join(path, 'healco.db'),
      onCreate: (db, version) async {
        await db.execute('''CREATE TABLE $_tablename (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT,
          image TEXT,
          accuracy TEXT
        )
        ''');
      },
      version: 1,
    );
    return db;
  }

  // NOTE : CREATE
  Future<void> insertHistory(HistoryModel historyModel) async {
    final Database db = await database;
    await db.insert(_tablename, historyModel.toMap());
  }

  // NOTE : SHOW ALL HISTORY
  Future<List<HistoryModel>> getHistory() async {
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.query(_tablename);
    return results.map((e) => HistoryModel.fromMap(e)).toList();
  }

  // NOTE : DELETE
  Future<void> deleteHistory(int id) async {
    final Database db = await database;
    await db.delete(_tablename, where: "id=?", whereArgs: [id]);
  }
}
