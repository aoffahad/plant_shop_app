import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final _databaseName = "favourites.db";
  static final _databaseVersion = 1;
  static final table = 'favourites';

  static final columnId = '_id';
  static final columnTitle = 'title';
  static final columnImage = 'image';
  static final columnDescription = 'description';
  static final columnPrice = 'price';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $table (
        $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
        $columnTitle TEXT NOT NULL,
        $columnImage TEXT NOT NULL,
        $columnDescription TEXT NOT NULL,
        $columnPrice REAL NOT NULL
      )
    ''');
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;

    return await db.insert(table, row);
  }

  Future<int> delete(String image) async {
    Database db = await instance.database;
    return await db
        .delete(table, where: '$columnImage = ?', whereArgs: [image]);
  }

  Future<List<Map<String, dynamic>>> queryAll() async {
    Database db = await instance.database;
    return await db.query(table);
  }
}
