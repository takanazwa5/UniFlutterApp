import 'package:dsw55388/database/db.dart';
import 'package:dsw55388/database/models/dog.dart';
import 'package:sqflite/sqflite.dart';

class DogsDB {
  Future<void> createTable(Database database) async {
    await database.execute(
      """
      CREATE TABLE Dogs (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, age INTEGER)
      """
    );
  }

  Future<int> create(Dog dog) async {
    final Database database = await DB().database;
    return await database.insert(
      "dogs",
      {
        "name" : dog.name,
        "age" : dog.age,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Dog>> read() async {
    final Database database = await DB().database;
    final List<Map<String, Object?>> dogs = await database.query("dogs");
    return dogs.map(
      (dog) => Dog(
        id: dog["id"] as int,
        name: dog["name"] as String,
        age: dog["age"] as int,
      )
    ).toList();
  }

  Future<int> update(int id, String name, int age) async {
    final Database database = await DB().database;
    return await database.update(
      "dogs",
      {
        "name" : name,
        "age" : age,
      },
      where: "id = ?",
      whereArgs: [id],
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
  }

  Future<int> delete(int id) async {
    final Database database = await DB().database;
    return await database.delete(
      "dogs",
      where: "id = ?",
      whereArgs: [id],
    );
  }
}