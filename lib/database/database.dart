import 'dart:async';
import 'dart:math';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Expenses {
  int? id;
  final num amt;
  final String type;
  DateTime creationDate;
  int? income;

  Expenses({
    this.id,
    required this.amt,
    required this.type,
    required this.creationDate,
    this.income,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'amt': amt,
      'type': type,
      'creationDate': creationDate.toString(),
      'income': income
    };
  }
}

class DatabaseConnect {
  Database? _database;
  Future<Database> get database async {
    final dbpath = await getDatabasesPath();
    const dbname = 'expense.db';
    final path = join(dbpath, dbname);

    _database = await openDatabase(path, version: 1, onCreate: _createDb);

    return _database!;
  }

  Future<void> _createDb(Database db, int version) async {
    await db.execute('''
CREATE TABLE expense(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  amt REAL,
  type TEXT,
  creationDate TEXT,
  income INTEGER
)

''');
  }

  //FUNCTION TO ADD DATA
  Future<void> insertExpense(Expenses expense) async {
    final db = await database;
    await db.insert('expense', expense.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  //FUNCTION TO DELETE A expense
  Future<void> deleteExpense(Expenses expense) async {
    final db = await database;
    await db.delete(
      'expense',
      where: 'id==?', //will check for id
      whereArgs: [expense.id],
    );
  }

  //fetch data
  Future<List<Expenses>> getExpenses() async {
    final db = await database;
    List<Map<String, dynamic>> items =
        await db.query('expense', orderBy: 'id DESC');
    //convert maps to list of expense
    return List.generate(
        items.length,
        (i) => Expenses(
            id: items[i]['id'],
            amt: items[i]['amt'],
            type: items[i]['type'],
            creationDate: DateTime.parse(items[i]['creationDate']),
            income: items[i]['income']));
  }

  Future totalExpense() async {
    final db = await database;
    var result = await db.rawQuery("SELECT SUM(amt) as Total FROM expense");

    return result.toList();
  }
}
