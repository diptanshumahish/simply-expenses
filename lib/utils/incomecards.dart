import 'package:expense_tracker/database/incomedatabase.dart';
import 'package:expense_tracker/screens.dart/incomescreen.dart';
import 'package:expense_tracker/shared/sharedpreferenecs.dart';
import 'package:expense_tracker/utils/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddIncome extends StatefulWidget {
  final int id;
  final String source;
  final int income;
  final DateTime creationDate;

  const AddIncome(
      {Key? key,
      required this.id,
      required this.source,
      required this.income,
      required this.creationDate})
      : super(key: key);

  @override
  State<AddIncome> createState() => _AddIncomeState();
}

class _AddIncomeState extends State<AddIncome> {
  void loadPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      currency = (prefs.getString("currency") ?? 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    final topColor = Theme.of(context).brightness;
    var toDeleteIncome = Income(
        id: widget.id,
        creationDate: widget.creationDate,
        inc: widget.income,
        source: widget.source);
    var inDb = IncomeConnect();
    void deleteIncome(Income income) async {
      await inDb.deleteIncome(income);
    }

    return Slidable(
      endActionPane: ActionPane(motion: DrawerMotion(), children: [
        SlidableAction(
          onPressed: (context) {
            deleteIncome(toDeleteIncome);
            setState(() {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: ((context) => IncomeScreen())));
            });
          },
          icon: CupertinoIcons.delete,
          backgroundColor: AppColors.secondary,
        ),
      ]),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: MediaQuery.of(context).size.height / 10,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: topColor == Brightness.dark
                ? AppColors.lighttext.withAlpha(30)
                : AppColors.darkBack.withAlpha(30),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.source,
                        style: TextStyle(
                            color: topColor == Brightness.dark
                                ? AppColors.lighttext
                                : AppColors.darkBack,
                            fontSize: 18)),
                    Text(
                      DateFormat('jm').format(
                        widget.creationDate,
                      ),
                      style: TextStyle(
                          color: topColor == Brightness.dark
                              ? AppColors.lighttext
                              : AppColors.darkBack,
                          fontSize: 14),
                    )
                  ],
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      currency,
                      style: TextStyle(color: AppColors.positive, fontSize: 15),
                    ),
                    SizedBox(width: 3),
                    Text(
                      widget.income.toString(),
                      style: TextStyle(color: AppColors.positive, fontSize: 20),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
