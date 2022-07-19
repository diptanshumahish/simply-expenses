import 'package:expense_tracker/theme.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.sec,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Welcome to Simply Expenses!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30),
            ),
            LottieBuilder.asset('assets/lottie/welcome.json')
          ],
        ),
      ),
    );
  }
}
