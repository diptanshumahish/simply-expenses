import 'package:expense_tracker/screens.dart/homepage.dart';
import 'package:expense_tracker/shared/sharedpreferenecs.dart';
import 'package:expense_tracker/utils/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/checkbox_list_tile/gf_checkbox_list_tile.dart';
import 'package:getwidget/types/gf_checkbox_type.dart';
import 'package:responsive_framework/responsive_framework.dart';

var name;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String currency = "";
  bool rupee = false;
  bool dollar = false;
  bool yen = false;
  bool euro = false;

  var nameController = TextEditingController();
  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var topColor = Theme.of(context).brightness;
    return Scaffold(
      body: Container(
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
                        ? Color(0xFF232324)
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
            Positioned(
              bottom: -MediaQuery.of(context).size.height / 6,
              right: -MediaQuery.of(context).size.width / 4,
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.secondary.withOpacity(0.4),
                    shape: BoxShape.circle),
                height: 300,
                width: 300,
              ),
            ),
            width < 600
                ? Center(
                    child: Container(
                      height: MediaQuery.of(context).size.height / 1.5,
                      width: MediaQuery.of(context).size.width * 0.80,
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
                            ? Color(0xFF232324)
                            : Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Let's know each other !",
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width / 20,
                                color: topColor == Brightness.dark
                                    ? Colors.white
                                    : AppColors.darkBack,
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.width / 26,
                            ),
                            Container(
                                height: 0.4,
                                width: MediaQuery.of(context).size.width - 10,
                                color: topColor == Brightness.dark
                                    ? AppColors.lighttext
                                    : AppColors.darkBack),
                            SizedBox(
                              height: MediaQuery.of(context).size.width / 26,
                            ),
                            Text(
                              "Your name:",
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width / 22,
                                color: topColor == Brightness.dark
                                    ? Colors.white
                                    : AppColors.darkBack,
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.width / 200,
                            ),
                            TextField(
                              style: TextStyle(
                                fontSize: 15,
                                color: topColor == Brightness.dark
                                    ? AppColors.lighttext
                                    : AppColors.darkBack,
                              ),
                              decoration: const InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColors.secondary),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColors.secondary),
                                ),
                                focusColor: AppColors.secondary,
                                hintText: "Enter your name here",
                              ),
                              autofocus: true,
                              textCapitalization: TextCapitalization.words,
                              controller: nameController,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.width / 100,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Enter your preferred currency unit :",
                                      style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width /
                                                24,
                                        color: topColor == Brightness.dark
                                            ? Colors.white
                                            : AppColors.darkBack,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.width / 50,
                                  ),
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
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                30,
                                            color: topColor == Brightness.dark
                                                ? Colors.white
                                                : AppColors.darkBack,
                                          )),
                                      activeIcon: Icon(Icons.check,
                                          size: 16, color: AppColors.lighttext),
                                      onChanged: (value) => setState(() {
                                            print(width);
                                            rupee = value;
                                            yen = false;
                                            euro = false;
                                            dollar = false;
                                            currency = "\u{20B9}";
                                          })),
                                  GFCheckboxListTile(
                                      activeBgColor: AppColors.positive,
                                      activeBorderColor: Colors.transparent,
                                      activeIcon: Icon(Icons.check,
                                          size: 16, color: AppColors.lighttext),
                                      inactiveBorderColor: Colors.transparent,
                                      inactiveBgColor: AppColors.lighttext,
                                      type: GFCheckboxType.circle,
                                      padding: EdgeInsets.zero,
                                      size: 16,
                                      value: dollar,
                                      title: Text("Dollar \u{0024}",
                                          style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                30,
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
                                      activeIcon: Icon(Icons.check,
                                          size: 16, color: AppColors.lighttext),
                                      inactiveBorderColor: Colors.transparent,
                                      inactiveBgColor: AppColors.lighttext,
                                      type: GFCheckboxType.circle,
                                      padding: EdgeInsets.zero,
                                      size: 16,
                                      value: yen,
                                      title: Text("Yen \u{00A5}",
                                          style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                30,
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
                                      activeIcon: Icon(Icons.check,
                                          size: 16, color: AppColors.lighttext),
                                      inactiveBorderColor: Colors.transparent,
                                      inactiveBgColor: AppColors.lighttext,
                                      type: GFCheckboxType.circle,
                                      padding: EdgeInsets.zero,
                                      size: 16,
                                      value: euro,
                                      title: Text("Euro \u{20AC}",
                                          style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                30,
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
                                    height:
                                        MediaQuery.of(context).size.width / 60,
                                  ),
                                  ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                AppColors.secondary),
                                      ),
                                      onPressed: () {
                                        name = nameController.text;
                                        setState(() {
                                          saveData(name);
                                          saveDataCurrency(currency);
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: ((context) =>
                                                      HomePage())));
                                        });
                                      },
                                      child: Center(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 50, vertical: 5),
                                          child: Text("Let's Go!",
                                              maxLines: 1,
                                              style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    80,
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
                : Center(),
          ],
        ),
      ),
    );
  }
}
