import 'package:expense_tracker/screens.dart/intro/loginpage.dart';
import 'package:expense_tracker/shared/sharedpreferenecs.dart';
import 'package:expense_tracker/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:getwidget/getwidget.dart';

import '../homepage.dart';

class LoginPageSecond extends StatefulWidget {
  const LoginPageSecond({Key? key}) : super(key: key);

  @override
  State<LoginPageSecond> createState() => _LoginPageSecondState();
}

class _LoginPageSecondState extends State<LoginPageSecond> {
  String currency = "";
  bool rupee = false;
  bool dollar = false;
  bool yen = false;
  bool euro = false;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var topColor = Theme.of(context).brightness;
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Positioned(
              top: -100,
              left: -50,
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.secondary.withOpacity(0.4),
                    shape: BoxShape.circle),
                height: 300,
                width: 300,
              ),
            ),
            Positioned(
              top: -100,
              left: -50,
              child: Container(
                decoration: BoxDecoration(
                    color: topColor == Brightness.dark
                        ? const Color(0xFF232324)
                        : Colors.white,
                    shape: BoxShape.circle),
                height: 250,
                width: 250,
              ),
            ),
            Positioned(
                right: MediaQuery.of(context).size.width / 8,
                top: -30,
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.height / 14,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: AppColors.themeColor.withAlpha(100)),
                )),
            Positioned(
              bottom: MediaQuery.of(context).size.height / 6,
              left: MediaQuery.of(context).size.width / 4,
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.sec.withOpacity(0.4),
                    shape: BoxShape.circle),
                height: 100,
                width: 100,
              ),
            ),
            Center(
              child: Container(
                height: height / 2.5,
                width: width * 0.85,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: topColor == Brightness.dark
                          ? Colors.white.withOpacity(0.09)
                          : AppColors.darkBack.withOpacity(0.3),
                      offset: const Offset(
                        0.0,
                        1.0,
                      ),
                      blurRadius: 30.0,
                      spreadRadius: 1.0,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                  color: topColor == Brightness.dark
                      ? const Color(0xFF232324)
                      : Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                IconButton(
                                    constraints: BoxConstraints(maxWidth: 40),
                                    alignment: Alignment.centerLeft,
                                    padding: EdgeInsets.zero,
                                    onPressed: (() {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginPage()));
                                    }),
                                    icon: Icon(
                                      CupertinoIcons.back,
                                    )),
                                SizedBox(width: 5),
                                Text(
                                  "Preferred currency unit :",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width / 20,
                                    fontWeight: FontWeight.w500,
                                    color: topColor == Brightness.dark
                                        ? Colors.white
                                        : AppColors.darkBack,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Container(
                              height: 1,
                              width: width,
                              color: topColor != Brightness.dark
                                  ? const Color(0xFF232324)
                                  : Colors.white,
                            ),
                            SizedBox(height: height < 820 ? 10 : 20),
                            GFCheckboxListTile(
                                activeBgColor: AppColors.positive,
                                type: GFCheckboxType.circle,
                                activeBorderColor: Colors.transparent,
                                inactiveBorderColor: Colors.transparent,
                                inactiveBgColor: AppColors.lighttext,
                                padding: EdgeInsets.zero,
                                size: 16,
                                value: rupee,
                                title: Text("Rupee \u{20B9}",
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width /
                                              24,
                                      color: topColor == Brightness.dark
                                          ? Colors.white
                                          : AppColors.darkBack,
                                    )),
                                activeIcon: const Icon(Icons.check,
                                    size: 16, color: AppColors.lighttext),
                                onChanged: (value) => setState(() {
                                      rupee = value;
                                      yen = false;
                                      euro = false;
                                      dollar = false;

                                      currency = "\u{20B9}";
                                    })),
                            GFCheckboxListTile(
                                activeBgColor: AppColors.positive,
                                activeBorderColor: Colors.transparent,
                                activeIcon: const Icon(Icons.check,
                                    size: 16, color: AppColors.lighttext),
                                inactiveBorderColor: Colors.transparent,
                                inactiveBgColor: AppColors.lighttext,
                                type: GFCheckboxType.circle,
                                padding: EdgeInsets.zero,
                                size: 16,
                                value: dollar,
                                title: Text("Dollar \u{0024}",
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width /
                                              24,
                                      color: topColor == Brightness.dark
                                          ? Colors.white
                                          : AppColors.darkBack,
                                    )),
                                onChanged: (value) => setState(() {
                                      dollar = value;
                                      yen = false;
                                      euro = false;
                                      rupee = false;
                                      currency = "\u{0024}";
                                    })),
                            GFCheckboxListTile(
                                activeBorderColor: Colors.transparent,
                                activeBgColor: AppColors.positive,
                                activeIcon: const Icon(Icons.check,
                                    size: 16, color: AppColors.lighttext),
                                inactiveBorderColor: Colors.transparent,
                                inactiveBgColor: AppColors.lighttext,
                                type: GFCheckboxType.circle,
                                padding: EdgeInsets.zero,
                                size: 16,
                                value: yen,
                                title: Text("Yen \u{00A5}",
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width /
                                              24,
                                      color: topColor == Brightness.dark
                                          ? Colors.white
                                          : AppColors.darkBack,
                                    )),
                                onChanged: (value) => setState(() {
                                      yen = value;
                                      dollar = false;
                                      euro = false;
                                      rupee = false;
                                      currency = "\u{00A5}";
                                    })),
                            GFCheckboxListTile(
                                activeBgColor: AppColors.positive,
                                activeBorderColor: Colors.transparent,
                                activeIcon: const Icon(Icons.check,
                                    size: 16, color: AppColors.lighttext),
                                inactiveBorderColor: Colors.transparent,
                                inactiveBgColor: AppColors.lighttext,
                                type: GFCheckboxType.circle,
                                padding: EdgeInsets.zero,
                                size: 16,
                                value: euro,
                                title: Text("Euro \u{20AC}",
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width /
                                              24,
                                      color: topColor == Brightness.dark
                                          ? Colors.white
                                          : AppColors.darkBack,
                                    )),
                                onChanged: (value) => setState(() {
                                      euro = value;
                                      dollar = false;
                                      yen = false;
                                      rupee = false;
                                      currency = "\u{20AC}";
                                    })),
                            SizedBox(
                              height: MediaQuery.of(context).size.width / 60,
                            ),
                            ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      AppColors.secondary),
                                ),
                                onPressed: () {
                                  (currency == "")
                                      ? showDialog(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              CupertinoAlertDialog(
                                                title: const Text("No input"),
                                                content: const Text(
                                                    "You didn't enter any name/currency type"),
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
                                          setState(() {
                                            saveDataCurrency(currency);
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: ((context) =>
                                                        const HomePage())));
                                          })
                                        };
                                },
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 50, vertical: 5),
                                    child: Text("Finish!",
                                        maxLines: 1,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              22,
                                        )),
                                  ),
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
