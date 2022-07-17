import 'package:expense_tracker/screens.dart/addexpensedata.dart';
import 'package:expense_tracker/screens.dart/expenselist.dart';
import 'package:expense_tracker/screens.dart/homepage.dart';
import 'package:expense_tracker/utils/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpensesPage extends StatefulWidget {
  const ExpensesPage({Key? key}) : super(key: key);

  @override
  State<ExpensesPage> createState() => _ExpensesPageState();
}

class _ExpensesPageState extends State<ExpensesPage> {
  @override
  Widget build(BuildContext context) {
    var topColor = Theme.of(context).brightness;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My expenses",
          style: TextStyle(
              fontSize: 22,
              color: topColor == Brightness.dark
                  ? Colors.white
                  : AppColors.darkBack),
        ),
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => HomePage())));
            },
            icon: Icon(CupertinoIcons.back,
                color: topColor == Brightness.dark
                    ? Colors.white
                    : AppColors.darkBack)),
        elevation: 0,
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [ExpenseList()],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.themeColor,
        label: Text("Add Expenses"),
        icon: Icon(CupertinoIcons.add_circled_solid),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        onPressed: () {
          showGeneralDialog(
            barrierLabel: "Label",
            barrierDismissible: false,
            barrierColor: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
            transitionDuration: const Duration(milliseconds: 350),
            context: context,
            pageBuilder: (context, anim1, anim2) {
              return AddExpenseData();
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
    );
  }
}
