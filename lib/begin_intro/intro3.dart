import 'package:expense_tracker/theme.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPgae3 extends StatelessWidget {
  const IntroPgae3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.themeColor,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Swipe left on list items to delete any!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30),
            ),
            LottieBuilder.asset('assets/lottie/left.json')
          ],
        ),
      ),
    );
  }
}
