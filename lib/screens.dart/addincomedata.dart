import 'dart:ui';
import 'package:expense_tracker/database/incomedatabase.dart';
import 'package:expense_tracker/screens.dart/incomescreen.dart';
import 'package:expense_tracker/utils/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddIncomeData extends StatefulWidget {
  const AddIncomeData({Key? key}) : super(key: key);

  @override
  State<AddIncomeData> createState() => _AddIncomeDataState();
}

class _AddIncomeDataState extends State<AddIncomeData> {
  final incomeController = TextEditingController();
  final incomeSourceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var inDb = IncomeConnect();
    void addIncome(Income income) async {
      await inDb.insertIncome(income);
      setState(() {});
    }

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
                          : Color(0xFFDAD5D5),
                      borderRadius: BorderRadius.circular(8)),
                  height: MediaQuery.of(context).size.height * 0.40,
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
                                Text(
                                  "Add Earnings data",
                                  style: TextStyle(
                                      color: topColor == Brightness.dark
                                          ? AppColors.lighttext
                                          : AppColors.darkBack,
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
                          color: topColor == Brightness.dark
                              ? AppColors.lighttext
                              : AppColors.darkBack,
                        ),
                        SizedBox(height: 20),
                        Text("Enter earnings amount",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: topColor == Brightness.dark
                                    ? AppColors.lighttext
                                    : AppColors.darkBack,
                                fontSize: 18)),
                        SizedBox(height: 10),
                        CupertinoTextField(
                          controller: incomeController,
                          keyboardType: TextInputType.number,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6)),
                          cursorColor: AppColors.themeColor,
                          autofocus: true,
                          style: const TextStyle(color: AppColors.darkBack),
                        ),
                        SizedBox(height: 20),
                        Text("Enter earnings' source",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: topColor == Brightness.dark
                                    ? AppColors.lighttext
                                    : AppColors.darkBack,
                                fontSize: 18)),
                        SizedBox(height: 10),
                        CupertinoTextField(
                          textCapitalization: TextCapitalization.words,
                          controller: incomeSourceController,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6)),
                          cursorColor: AppColors.themeColor,
                          autofocus: true,
                          style: const TextStyle(color: AppColors.darkBack),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  AppColors.secondary),
                            ),
                            onPressed: () {
                              var income = Income(
                                  inc: int.parse(incomeController.text),
                                  source: incomeSourceController.text,
                                  creationDate: DateTime.now());
                              addIncome(income);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => IncomeScreen()));
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
                  ),
                ),
              ))),
    );
  }
}
