import 'dart:ui';

import 'package:expense_tracker/database/database.dart';
import 'package:expense_tracker/screens.dart/expensescreen.dart';
import 'package:expense_tracker/screens.dart/homepage.dart';
import 'package:expense_tracker/utils/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

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

  var type = null;
  bool value1 = false;
  bool value2 = false;
  bool value3 = false;
  bool value4 = false;
  String typeData = "";
  @override
  Widget build(BuildContext context) {
    final topColor = Theme.of(context).brightness;
    return SafeArea(
      child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
          child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Center(
                child: Container(
                    decoration: BoxDecoration(
                        color: topColor == Brightness.dark
                            ? AppColors.darkBack
                            : AppColors.lighttext,
                        borderRadius: BorderRadius.circular(8)),
                    height: MediaQuery.of(context).size.height * 0.60,
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
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ExpensesPage()));
                                      },
                                      icon: Icon(CupertinoIcons.back)),
                                  Text(
                                    "Add Expense data",
                                    style: TextStyle(
                                        color: AppColors.lighttext,
                                        fontSize: 20),
                                  ),
                                ],
                              ),
                              Spacer(),
                            ],
                          ),
                          Container(
                            height: 1,
                            width: MediaQuery.of(context).size.width,
                            color: AppColors.lighttext,
                          ),
                          SizedBox(height: 20),
                          Text("Enter spent Amount",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.lighttext,
                                  fontSize: 15)),
                          SizedBox(height: 10),
                          CupertinoTextField(
                            controller: expenseController,
                            keyboardType: TextInputType.number,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6)),
                            cursorColor: AppColors.themeColor,
                            autofocus: true,
                            style: const TextStyle(color: AppColors.darkBack),
                          ),
                          SizedBox(height: 20),
                          Text("Type of expenditure:",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.lighttext,
                                  fontSize: 15)),
                          GFCheckboxListTile(
                              title: Text("Food",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.lighttext,
                                      fontSize: 13)),
                              type: GFCheckboxType.circle,
                              activeIcon: Icon(
                                Icons.check,
                                size: 16,
                                color: Colors.white,
                              ),
                              size: 20,
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
                                    print(typeData);
                                  })),
                          GFCheckboxListTile(
                              type: GFCheckboxType.circle,
                              activeIcon: Icon(
                                Icons.check,
                                size: 16,
                                color: Colors.white,
                              ),
                              size: 20,
                              activeBorderColor: Colors.transparent,
                              inactiveBorderColor: Colors.transparent,
                              activeBgColor: AppColors.secondary,
                              title: Text("Leisure",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.lighttext,
                                      fontSize: 13)),
                              value: value2,
                              onChanged: (value) => setState(() {
                                    value2 = value;
                                    typeData = "Leisure";
                                    value1 = false;
                                    value3 = false;
                                    value4 = false;
                                    print(typeData);
                                  })),
                          GFCheckboxListTile(
                              type: GFCheckboxType.circle,
                              activeIcon: Icon(
                                Icons.check,
                                size: 16,
                                color: Colors.white,
                              ),
                              size: 20,
                              activeBorderColor: Colors.transparent,
                              inactiveBorderColor: Colors.transparent,
                              activeBgColor: AppColors.secondary,
                              title: Text("Rents",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.lighttext,
                                      fontSize: 13)),
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
                              activeIcon: Icon(
                                Icons.check,
                                size: 16,
                                color: Colors.white,
                              ),
                              size: 20,
                              activeBorderColor: Colors.transparent,
                              inactiveBorderColor: Colors.transparent,
                              activeBgColor: AppColors.secondary,
                              title: Text("Others",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.lighttext,
                                      fontSize: 13)),
                              value: value4,
                              onChanged: (value) => setState(() {
                                    value4 = value;
                                    typeData = "Others";
                                    value1 = false;
                                    value3 = false;
                                    value2 = false;
                                  })),
                          SizedBox(height: 10),
                          ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    AppColors.secondary),
                              ),
                              onPressed: () {
                                var expense = Expenses(
                                    amt: int.parse(expenseController.text),
                                    type: typeData,
                                    creationDate: DateTime.now());
                                addData(expense);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ExpensesPage()));
                              },
                              child: const Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 70, vertical: 5),
                                  child: Text("Update",
                                      style: TextStyle(fontSize: 17)),
                                ),
                              )),
                        ],
                      ),
                    )),
              ))),
    );
  }
}
