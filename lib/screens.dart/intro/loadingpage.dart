import 'package:expense_tracker/theme.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../homepage.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 1200), (() async {
      showGeneralDialog(
        barrierLabel: "Label",
        barrierDismissible: false,
        barrierColor: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
        transitionDuration: const Duration(milliseconds: 1000),
        context: context,
        pageBuilder: (context, anim1, anim2) {
          return const HomePage();
        },
      );
    }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var topColor = Theme.of(context).brightness;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LottieBuilder.asset('assets/lottie/load.json'),
            Text(
              "Please wait",
              style: TextStyle(
                  fontSize: 20,
                  color: topColor == Brightness.dark
                      ? AppColors.lighttext
                      : AppColors.darkBack),
            )
          ],
        ),
      ),
    );
  }
}
