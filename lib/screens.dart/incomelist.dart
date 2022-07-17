import 'package:expense_tracker/database/incomedatabase.dart';
import 'package:expense_tracker/utils/incomecards.dart';
import 'package:expense_tracker/utils/theme.dart';
import 'package:flutter/material.dart';

class IncomeList extends StatefulWidget {
  const IncomeList({Key? key}) : super(key: key);

  @override
  State<IncomeList> createState() => _IncomeListState();
}

class _IncomeListState extends State<IncomeList> {
  var inDb = IncomeConnect();

  @override
  Widget build(BuildContext context) {
    final topColor = Theme.of(context).brightness;
    return FutureBuilder(
        future: inDb.getIncome(),
        initialData: [],
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          var data = snapshot.data;
          var datalength = data!.length;
          return datalength == 0
              ? Text("No expenses data recoreded yet",
                  style: TextStyle(
                      fontSize: 15,
                      color: topColor == Brightness.dark
                          ? Colors.white
                          : AppColors.darkBack))
              : ListView.builder(
                  itemCount: datalength,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: ((context, i) => AddIncome(
                      id: data[i].id,
                      source: data[i].source,
                      creationDate: data[i].creationDate)));
        });
  }
}
