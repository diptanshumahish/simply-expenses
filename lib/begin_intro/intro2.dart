import 'package:expense_tracker/theme.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage2 extends StatelessWidget {
  const IntroPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.secondary,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Easily TrackYour Expenses!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30),
            ),
            LottieBuilder.asset('assets/lottie/expense.json')
          ],
        ),
      ),
    );
  }
}
