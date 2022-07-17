import 'package:expense_tracker/database/database.dart';
import 'package:expense_tracker/utils/expensecards.dart';
import 'package:expense_tracker/utils/theme.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatefulWidget {
  const ExpenseList({Key? key}) : super(key: key);

  @override
  State<ExpenseList> createState() => _ExpenseListState();
}

class _ExpenseListState extends State<ExpenseList> {
  var db = DatabaseConnect();
  void addItem(Expenses expense) async {
    await db.insertExpense(expense);
    setState(() {});
  }

  void deleteItem(Expenses expense) async {
    await db.deleteExpense(expense);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final topColor = Theme.of(context).brightness;

    return FutureBuilder(
        future: db.getExpenses(),
        initialData: [],
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          var data = snapshot.data;
          var dataLength = data!.length;
          return dataLength == 0
              ? Text(
                  "No expenses data recoreded yet",
                  style: TextStyle(
                      fontSize: 15,
                      color: topColor == Brightness.dark
                          ? Colors.white
                          : AppColors.darkBack),
                )
              : ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: dataLength,
                  itemBuilder: (context, i) => AddExpenses(
                      id: data[i].id,
                      amt: data[i].amt,
                      type: data[i].type,
                      creationDate: data[i].creationDate));
        });
  }
}
