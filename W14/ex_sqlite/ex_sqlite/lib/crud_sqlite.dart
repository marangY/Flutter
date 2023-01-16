import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class MemoMoney {
  late int? id;
  late String title;
  late int expenses;

  MemoMoney({
    this.id,
    required this.title,
    required this.expenses,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'expenses': expenses,
    };
  }

  MemoMoney.fromMap(Map<String, dynamic>? map) {
    id = map?['id'];
    title = map?['title'];
    expenses = map?['expenses'];
  }

  @override
  String toString() {
    return 'MemoMoney{id: $id, title: $title, expenses: $expenses}';
  }
}

class MemomonyHelper {
  late Database _database;

  /*
  Future initDB() async {
    _database = await openDatabase('memomoney_database.db');
    _database.execute('''
            CREATE TABLE IF NOT EXISTS memosTbl (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT NOT NULL,
            expenses INTEGER NOT NULL)
        ''');
  }
  */

  Future initDB() async {
    String path = join(await getDatabasesPath(), 'memomoney_database.db');

    var exists = await databaseExists(path);

    if (!exists) {
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}
      ByteData data = await rootBundle.load(join("assets", "my_database.db"));
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes, flush: true);
    }

    _database = await openDatabase(path);

    /*
    _database = await openDatabase(
        path,
        version: 1,
        onCreate: (db, version) async {
          await db.execute('''
            CREATE TABLE IF NOT EXISTS memosTbl (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT NOT NULL,
            expenses INTEGER NOT NULL)
          ''');
        },
        onUpgrade: (db, oldVersion, newVersion){}
    );
    */
  }

  Future<void> insert(MemoMoney memo) async {
    await _database.insert(
      'memosTbl',
      memo.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace, //중복추가되는 경우 처리
    );
  }

  Future<List<MemoMoney>> getAllMemos() async {
    final List<Map<String, dynamic>> maps = await _database.query('memosTbl');
    return List.generate(maps.length, (i) {
      return MemoMoney(
        id:maps[i]['id'],
        title: maps[i]['title'],
        expenses: maps[i]['expenses'],
      );
    });
  }

  Future<MemoMoney?> getMemo(int id) async {
    final List<Map<String, dynamic>> map = await _database.query(
        'memosTbl', columns: ['id', 'title', 'expenses'],
        where: 'id = ?',
        whereArgs: [id]
    );
    if (map.isNotEmpty){
      return MemoMoney.fromMap(map[0]);
    }
  }

  Future<void> update(MemoMoney memo) async {
    await _database.update(
      'memosTbl',
      memo.toMap(),
      where: "id = ?",
      whereArgs: [memo.id],
    );
  }

  Future<void> delete(int id) async {
    await _database.delete(
      'memosTbl',
      where: "id = ?",
      whereArgs: [id],
    );
  }
}