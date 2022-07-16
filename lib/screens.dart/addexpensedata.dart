import 'dart:ui';

import 'package:expense_tracker/database/database.dart';
import 'package:expense_tracker/utils/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  final incomeController = TextEditingController();

  var type = null;
  bool value1 = false;
  bool value2 = false;
  bool value3 = false;
  bool value4 = false;
  String typeData = "";
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.themeColor,
                      borderRadius: BorderRadius.circular(8)),
                  height: MediaQuery.of(context).size.height * 0.80,
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
                                    icon: Icon(CupertinoIcons.back)),
                                Text("Add Expense data"),
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
                        Text("Enter spent Amount"),
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
                        Text("Type of expenditure:"),
                        CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            title: Text("Food"),
                            value: value1,
                            onChanged: (value) => setState(() {
                                  this.value1 = value!;
                                  typeData = "Food";
                                  value2 = false;
                                  value3 = false;
                                  value4 = false;
                                  print(typeData);
                                })),
                        CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            title: Text("Leisure"),
                            value: value2,
                            onChanged: (value) => setState(() {
                                  this.value2 = value!;
                                  typeData = "Leisure";
                                  value1 = false;
                                  value3 = false;
                                  value4 = false;
                                  print(typeData);
                                })),
                        CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            title: Text("Rents"),
                            value: value3,
                            onChanged: (value) => setState(() {
                                  this.value3 = value!;
                                  typeData = "Rents";
                                  value1 = false;
                                  value2 = false;
                                  value4 = false;
                                })),
                        CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            title: Text("Others"),
                            value: value4,
                            onChanged: (value) => setState(() {
                                  this.value4 = value!;
                                  typeData = "Others";
                                  value1 = false;
                                  value3 = false;
                                  value2 = false;
                                })),
                        Text("Update Income data (optional)"),
                        SizedBox(height: 10),
                        CupertinoTextField(
                          controller: incomeController,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6)),
                          cursorColor: AppColors.themeColor,
                          autofocus: true,
                          style: const TextStyle(color: AppColors.darkBack),
                          keyboardType: TextInputType.number,
                        ),
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
                              print(expense);
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
            )));
  }
}
