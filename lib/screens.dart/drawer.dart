import 'package:expense_tracker/screens.dart/expensescreen.dart';
import 'package:expense_tracker/screens.dart/incomescreen.dart';
import 'package:expense_tracker/screens.dart/intro/loginpage.dart';
import 'package:expense_tracker/shared/sharedpreferenecs.dart';
import 'package:expense_tracker/utils/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  void loadPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = (prefs.getString("name") ?? 0);
      currency = (prefs.getString("currency") ?? 0);
    });
  }

  @override
  void initState() {
    loadPref();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var topColor = Theme.of(context).brightness;
    return Drawer(
      backgroundColor: topColor == Brightness.dark
          ? AppColors.darkBack
          : AppColors.lighttext,
      child: Column(
        children: [
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3.5,
              decoration: BoxDecoration(color: AppColors.themeColor),
              child: Stack(
                children: [
                  Positioned(
                      left: 0,
                      right: 0,
                      bottom: 10,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: (() {}),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                username,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.lighttext),
                              ),
                              Icon(CupertinoIcons.chevron_forward)
                            ],
                          ),
                        ),
                      )),
                  Positioned(
                      top: MediaQuery.of(context).size.height / 18,
                      right: 0,
                      child: IconButton(
                        icon: Icon(
                          CupertinoIcons.moon_circle_fill,
                          color: AppColors.lighttext,
                          size: 30,
                        ),
                        onPressed: () {},
                      )),
                  Positioned(
                      top: MediaQuery.of(context).size.height / 14,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Simply",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    color: Colors.white)),
                            Text("Expenses.",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    color: Colors.black))
                          ],
                        ),
                      )),
                  Positioned(
                      bottom: MediaQuery.of(context).size.height / 14,
                      child: Container(
                          height: 0.7,
                          width: MediaQuery.of(context).size.width,
                          color: AppColors.lighttext))
                ],
              )),
          SizedBox(height: height / 35),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: ((context) => ExpensesPage()))),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: topColor != Brightness.dark
                        ? AppColors.darkBack.withAlpha(20)
                        : AppColors.lighttext.withAlpha(30)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Expenses",
                        style: TextStyle(
                            fontSize: 26,
                            color: topColor == Brightness.dark
                                ? AppColors.lighttext
                                : AppColors.darkBack),
                      ),
                      Icon(Icons.attach_money,
                          color: topColor == Brightness.dark
                              ? AppColors.lighttext
                              : AppColors.darkBack)
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: ((context) => IncomeScreen()))),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: topColor != Brightness.dark
                        ? AppColors.darkBack.withAlpha(20)
                        : AppColors.lighttext.withAlpha(30)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Earnings ",
                        style: TextStyle(
                            fontSize: 26,
                            color: topColor == Brightness.dark
                                ? AppColors.lighttext
                                : AppColors.darkBack),
                      ),
                      Icon(Icons.money_rounded,
                          color: topColor == Brightness.dark
                              ? AppColors.lighttext
                              : AppColors.darkBack)
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: (() {
                Navigator.pushReplacement(
                    context,
                    (MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    )));
              }),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: topColor != Brightness.dark
                        ? AppColors.darkBack.withAlpha(20)
                        : AppColors.lighttext.withAlpha(30)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Change Preferences ",
                        style: TextStyle(
                            fontSize: 26,
                            color: topColor == Brightness.dark
                                ? AppColors.lighttext
                                : AppColors.darkBack),
                      ),
                      Icon(CupertinoIcons.profile_circled,
                          color: topColor == Brightness.dark
                              ? AppColors.lighttext
                              : AppColors.darkBack)
                    ],
                  ),
                ),
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Text("Version 1.0.0",
                style: TextStyle(
                    fontSize: 14,
                    color: topColor == Brightness.dark
                        ? AppColors.lighttext
                        : AppColors.darkBack)),
          )
        ],
      ),
    );
  }
}
