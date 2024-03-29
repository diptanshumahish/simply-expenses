import 'dart:ui';

import 'package:expense_tracker/database/database.dart';
import 'package:expense_tracker/screens.dart/expensescreen.dart';
import 'package:expense_tracker/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

// ignore: prefer_typing_uninitialized_variables
var newExpense;

class AddExpenseData extends StatefulWidget {
  const AddExpenseData({Key? key}) : super(key: key);

  @override
  State<AddExpenseData> createState() => _AddExpenseDataState();
}

class _AddExpenseDataState extends State<AddExpenseData> {
  var db = DatabaseConnect();
  void addData(Expenses expense) async {
    await db.insertExpense(expense);
    setState(() {});
  }

  final expenseController = TextEditingController();

  // ignore: prefer_typing_uninitialized_variables
  var type;
  bool value1 = false;
  bool value2 = false;
  bool value3 = false;
  bool value4 = false;
  String typeData = "";
  @override
  Widget build(BuildContext context) {
    final topColor = Theme.of(context).brightness;
    var height = MediaQuery.of(context).size.height;
    return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: Container(
                  decoration: BoxDecoration(
                      color: topColor == Brightness.dark
                          ? AppColors.darkBack
                          : const Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(8)),
                  height: height < 820
                      ? height * 0.66
                      : MediaQuery.of(context).size.height * 0.54,
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Row(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: const Icon(CupertinoIcons.back)),
                                Text(
                                  "Add Expense data",
                                  style: TextStyle(
                                      color: topColor == Brightness.dark
                                          ? AppColors.lighttext
                                          : AppColors.darkBack,
                                      fontSize: 20),
                                ),
                              ],
                            ),
                            const Spacer(),
                          ],
                        ),
                        Container(
                          height: 1,
                          width: MediaQuery.of(context).size.width,
                          color: topColor == Brightness.dark
                              ? AppColors.lighttext
                              : AppColors.darkBack,
                        ),
                        const SizedBox(height: 20),
                        Text("Enter spent Amount",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: topColor == Brightness.dark
                                    ? AppColors.lighttext
                                    : AppColors.darkBack,
                                fontSize: 18)),
                        const SizedBox(height: 10),
                        CupertinoTextField(
                          controller: expenseController,
                          keyboardType: TextInputType.number,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 233, 229, 229),
                              borderRadius: BorderRadius.circular(6)),
                          cursorColor: AppColors.themeColor,
                          autofocus: true,
                          style: const TextStyle(color: AppColors.darkBack),
                        ),
                        const SizedBox(height: 25),
                        Text("Type of expenditure:",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: topColor == Brightness.dark
                                    ? AppColors.lighttext
                                    : AppColors.darkBack,
                                fontSize: 18)),
                        GFCheckboxListTile(
                            title: Text("Food",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: topColor == Brightness.dark
                                        ? AppColors.lighttext
                                        : AppColors.darkBack,
                                    fontSize: 16)),
                            type: GFCheckboxType.circle,
                            activeIcon: const Icon(
                              Icons.check,
                              size: 16,
                              color: Colors.white,
                            ),
                            size: 20,
                            inactiveBgColor: const Color(0xFFDFDDDD),
                            activeBorderColor: Colors.transparent,
                            inactiveBorderColor: Colors.transparent,
                            activeBgColor: AppColors.secondary,
                            value: value1,
                            onChanged: (value) => setState(() {
                                  value1 = value;
                                  typeData = "Food";
                                  value2 = false;
                                  value3 = false;
                                  value4 = false;
                                })),
                        GFCheckboxListTile(
                            type: GFCheckboxType.circle,
                            activeIcon: const Icon(
                              Icons.check,
                              size: 16,
                              color: Colors.white,
                            ),
                            size: 20,
                            inactiveBgColor: const Color(0xFFDFDDDD),
                            activeBorderColor: Colors.transparent,
                            inactiveBorderColor: Colors.transparent,
                            activeBgColor: AppColors.secondary,
                            title: Text("Leisure",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: topColor == Brightness.dark
                                        ? AppColors.lighttext
                                        : AppColors.darkBack,
                                    fontSize: 16)),
                            value: value2,
                            onChanged: (value) => setState(() {
                                  value2 = value;
                                  typeData = "Leisure";
                                  value1 = false;
                                  value3 = false;
                                  value4 = false;
                                })),
                        GFCheckboxListTile(
                            type: GFCheckboxType.circle,
                            activeIcon: const Icon(
                              Icons.check,
                              size: 16,
                              color: Colors.white,
                            ),
                            size: 20,
                            activeBorderColor: Colors.transparent,
                            inactiveBorderColor: Colors.transparent,
                            activeBgColor: AppColors.secondary,
                            inactiveBgColor: const Color(0xFFDFDDDD),
                            title: Text("Rents",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: topColor == Brightness.dark
                                        ? AppColors.lighttext
                                        : AppColors.darkBack,
                                    fontSize: 16)),
                            value: value3,
                            onChanged: (value) => setState(() {
                                  value3 = value;
                                  typeData = "Rents";
                                  value1 = false;
                                  value2 = false;
                                  value4 = false;
                                })),
                        GFCheckboxListTile(
                            type: GFCheckboxType.circle,
                            activeIcon: const Icon(
                              Icons.check,
                              size: 16,
                              color: Colors.white,
                            ),
                            inactiveBgColor: const Color(0xFFDFDDDD),
                            size: 20,
                            activeBorderColor: Colors.transparent,
                            inactiveBorderColor: Colors.transparent,
                            activeBgColor: AppColors.secondary,
                            title: Text("Others",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: topColor == Brightness.dark
                                        ? AppColors.lighttext
                                        : AppColors.darkBack,
                                    fontSize: 16)),
                            value: value4,
                            onChanged: (value) => setState(() {
                                  value4 = value;
                                  typeData = "Others";
                                  value1 = false;
                                  value3 = false;
                                  value2 = false;
                                })),
                        const SizedBox(height: 10),
                        ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  AppColors.secondary),
                            ),
                            onPressed: () {
                              // ignore: unrelated_type_equality_checks
                              (expenseController == 0 || typeData == "")
                                  ? showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          CupertinoAlertDialog(
                                            title:
                                                const Text("Incorrect Input"),
                                            content: const Text(
                                                "Data can't be null"),
                                            actions: <Widget>[
                                              CupertinoDialogAction(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text("retry",
                                                      style: TextStyle(
                                                          color: AppColors
                                                              .themeColor)))
                                            ],
                                          ))
                                  : {
                                      newExpense = Expenses(
                                          amt: double.parse(
                                              expenseController.text),
                                          type: typeData,
                                          creationDate: DateTime.now()),
                                      addData(newExpense),
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const ExpensesPage())),
                                    };
                            },
                            child: const Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 70, vertical: 5),
                                child: Text("Update",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18)),
                              ),
                            )),
                      ],
                    ),
                  )),
            )));
  }
}
