import 'package:expense_tracker/screens.dart/homepage.dart';
import 'package:expense_tracker/screens.dart/intro/loginpage.dart';
import 'package:expense_tracker/shared/sharedpreferenecs.dart';
import 'package:expense_tracker/utils/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void loadPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = (prefs.getString("name") ?? 0);
      currency = (prefs.getString("currency") ?? 0);
    });
  }

  @override
  void initState() {
    Future((() {
      setState(() {
        move = true;
      });
    }));
    Future.delayed(const Duration(seconds: 4), (() async {
      showGeneralDialog(
        barrierLabel: "Label",
        barrierDismissible: false,
        barrierColor: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
        transitionDuration: const Duration(milliseconds: 600),
        context: context,
        pageBuilder: (context, anim1, anim2) {
          return (username == null || currency == null)
              ? const LoginPage()
              : HomePage();
        },
      );
    }));
    super.initState();
    loadPref();
  }

  bool move = false;
  @override
  Widget build(BuildContext context) {
    var topColor = Theme.of(context).brightness;
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              AnimatedPositioned(
                duration: Duration(milliseconds: 900),
                curve: Curves.bounceInOut,
                top: !move ? -1000 : -100,
                left: -50,
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.secondary.withOpacity(0.4),
                      shape: BoxShape.circle),
                  height: 300,
                  width: 300,
                ),
              ),
              AnimatedPositioned(
                duration: Duration(milliseconds: 900),
                top: !move ? -1000 : -100,
                left: -50,
                curve: Curves.bounceOut,
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
              AnimatedPositioned(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.bounceInOut,
                  right: MediaQuery.of(context).size.width / 8,
                  top: !move ? -500 : -30,
                  height: MediaQuery.of(context).size.height / 3,
                  width: MediaQuery.of(context).size.height / 14,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: AppColors.themeColor.withAlpha(100)),
                  )),
              AnimatedPositioned(
                duration: Duration(milliseconds: 500),
                curve: Curves.bounceInOut,
                bottom: !move ? -100 : MediaQuery.of(context).size.height / 6,
                left: !move ? -100 : MediaQuery.of(context).size.width / 4,
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.sec.withOpacity(0.4),
                      shape: BoxShape.circle),
                  height: 100,
                  width: 100,
                ),
              ),
              AnimatedPositioned(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeIn,
                bottom: !move ? -1000 : -MediaQuery.of(context).size.height / 6,
                right: -MediaQuery.of(context).size.width / 4,
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.secondary.withOpacity(0.4),
                      shape: BoxShape.circle),
                  height: 300,
                  width: 300,
                ),
              ),
              Center(
                child: Container(
                  height: 170,
                  width: 170,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.themeColor),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
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
                  ),
                ),
              ),
              Positioned(
                  bottom: MediaQuery.of(context).size.height / 8,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      CupertinoActivityIndicator(
                        color: AppColors.themeColor,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text("Version 1.0",
                          style: TextStyle(
                              color: topColor == Brightness.dark
                                  ? AppColors.lighttext
                                  : AppColors.darkBack,
                              fontSize: 18)),
                    ],
                  ))
            ],
          )),
    );
  }
}
