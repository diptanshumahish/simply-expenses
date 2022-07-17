import 'package:expense_tracker/utils/theme.dart';
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
    return Scaffold(
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
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => HomePage())));
            },
            icon: Icon(CupertinoIcons.back,
                color: topColor == Brightness.dark
                    ? Colors.white
                    : AppColors.darkBack)),
        elevation: 0,
      ),
    );
  }
}
