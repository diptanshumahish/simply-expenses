import 'dart:async';
import 'dart:math';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Income {
  int? id;
  int? income;

  Income({required this.id, required this.income});
  Map<String, dynamic> toMap() {
    return {'id': id, 'income': income};
  }
}

class IncomeConnect {
  Database? _database;
  Future<Database> get database async {
    final dbPath = await getDatabasesPath();
    const dbName = 'income.db';
    final path = join(dbPath, dbName);
    _database = await openDatabase(path, version: 1, onCreate: _createDb);
    return _database!;
  }

  Future<void> _createDb(Database db, int version) async {
    await db.execute('''
  CREATE TABLE income(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    income INTEGER
  )
''');
  }

  //ADD INCOME DATA
  Future<void> insertIncome(Income income) async {
    final db = await database;
    await db.insert('income', income.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  //DELETING INCOME DATA
  Future<void> deleteIncome(Income income) async {
    final db = await database;
    await db.delete('income', where: 'id==?', whereArgs: [income.id]);
  }

  //fetching data
  Future<List<Income>> getIncome() async {
    final db = await database;
    List<Map<String, dynamic>> items =
        await db.query('income', orderBy: 'id DESC');

    //convert maps to list of expenses
    return List.generate(items.length,
        (i) => Income(id: items[i]['id'], income: items[i]['income']));
  }

  Future totalIncome() async {
    final db = await database;
    var result = await db.rawQuery("SELECT SUM(income) AS TOTAL FROM income");
    return result.toList();
  }
}