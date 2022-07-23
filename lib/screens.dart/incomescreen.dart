import 'package:expense_tracker/screens.dart/addincomedata.dart';
import 'package:expense_tracker/screens.dart/incomelist.dart';
import 'package:expense_tracker/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'homepage.dart';

class IncomeScreen extends StatefulWidget {
  const IncomeScreen({Key? key}) : super(key: key);

  @override
  State<IncomeScreen> createState() => _IncomeScreenState();
}

class _IncomeScreenState extends State<IncomeScreen> {
  @override
  Widget build(BuildContext context) {
    var topColor = Theme.of(context).brightness;
    return WillPopScope(
      onWillPop: () async {
        Navigator.push(
            context, MaterialPageRoute(builder: ((context) => HomePage())));
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "My Earnings",
            style: TextStyle(
                fontSize: 22,
                color: topColor == Brightness.dark
                    ? Colors.white
                    : AppColors.darkBack),
          ),
          backgroundColor: Colors.transparent,
          leading: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const HomePage())));
              },
              icon: Icon(CupertinoIcons.back,
                  color: topColor == Brightness.dark
                      ? Colors.white
                      : AppColors.darkBack)),
          elevation: 0,
        ),
        body: Scrollbar(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [IncomeList()],
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          label: const Text("Update Income"),
          icon: const Icon(CupertinoIcons.add_circled_solid),
          backgroundColor: AppColors.themeColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          onPressed: () {
            showGeneralDialog(
              barrierLabel: "Label",
              barrierDismissible: false,
              barrierColor: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
              transitionDuration: const Duration(milliseconds: 350),
              context: context,
              pageBuilder: (context, anim1, anim2) {
                return const AddIncomeData();
              },
              transitionBuilder: (context, anim1, anim2, child) {
                return SlideTransition(
                  position:
                      Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
                          .animate(anim1),
                  child: child,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
