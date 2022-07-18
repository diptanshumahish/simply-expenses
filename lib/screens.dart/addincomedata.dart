import 'dart:ui';
import 'package:expense_tracker/database/incomedatabase.dart';
import 'package:expense_tracker/screens.dart/incomescreen.dart';
import 'package:expense_tracker/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: prefer_typing_uninitialized_variables
var newIncome;

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
    var height = MediaQuery.of(context).size.height;
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
                          : const Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(8)),
                  height: height < 820
                      ? height * 0.43
                      : MediaQuery.of(context).size.height * 0.35,
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
                                  "Add Earnings data",
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
                        Text("Enter earnings amount",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: topColor == Brightness.dark
                                    ? AppColors.lighttext
                                    : AppColors.darkBack,
                                fontSize: 18)),
                        const SizedBox(height: 10),
                        CupertinoTextField(
                          controller: incomeController,
                          keyboardType: TextInputType.number,
                          decoration: BoxDecoration(
                              color: const Color(0xFFDDDADA),
                              borderRadius: BorderRadius.circular(6)),
                          cursorColor: AppColors.themeColor,
                          autofocus: true,
                          style: const TextStyle(color: AppColors.darkBack),
                        ),
                        const SizedBox(height: 20),
                        Text("Enter earnings' source",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: topColor == Brightness.dark
                                    ? AppColors.lighttext
                                    : AppColors.darkBack,
                                fontSize: 18)),
                        const SizedBox(height: 10),
                        CupertinoTextField(
                          textCapitalization: TextCapitalization.words,
                          controller: incomeSourceController,
                          decoration: BoxDecoration(
                              color: const Color(0xFFDDDADA),
                              borderRadius: BorderRadius.circular(6)),
                          cursorColor: AppColors.themeColor,
                          autofocus: true,
                          style: const TextStyle(color: AppColors.darkBack),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  AppColors.secondary),
                            ),
                            onPressed: () {
                              (incomeController.text == "" ||
                                      incomeSourceController.text == "")
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
                                      newIncome = Income(
                                          inc: double.parse(
                                              incomeController.text),
                                          source: incomeSourceController.text,
                                          creationDate: DateTime.now()),
                                      addIncome(newIncome),
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const IncomeScreen())),
                                    };
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
