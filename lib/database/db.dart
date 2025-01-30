import 'package:dsw55388/database/dogs_db.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initialize();
    return _database!;
  }

  Future<Database> _initialize() async {
    Database database = await openDatabase(
      join(await getDatabasesPath(), "dogs.db"),
      version: 1,
      onCreate: create,
      singleInstance: true,
    );
    return database;
  }

  Future<void> create(Database database, int version) async =>
      await DogsDB().createTable(database);
}