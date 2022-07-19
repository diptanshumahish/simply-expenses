import 'package:expense_tracker/begin_intro/intro1.dart';
import 'package:expense_tracker/begin_intro/intro2.dart';
import 'package:expense_tracker/begin_intro/intro3.dart';
import 'package:expense_tracker/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroScreens extends StatefulWidget {
  const IntroScreens({Key? key}) : super(key: key);

  @override
  State<IntroScreens> createState() => _IntroScreensState();
}

class _IntroScreensState extends State<IntroScreens> {
  PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: _controller,
          children: [IntroPage1(), IntroPage2(), IntroPgae3()],
        ),
        Container(
            alignment: Alignment(0, 0.8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CupertinoButton(
                    child: Text(
                      "Previous",
                      style: TextStyle(color: AppColors.darkBack),
                    ),
                    onPressed: () {
                      _controller.previousPage(
                          duration: Duration(milliseconds: 400),
                          curve: Curves.bounceOut);
                    }),
                SmoothPageIndicator(controller: _controller, count: 3),
                CupertinoButton(
                    child: Text(
                      "Next",
                      style: TextStyle(color: AppColors.darkBack),
                    ),
                    onPressed: () {
                      _controller.nextPage(
                          duration: Duration(milliseconds: 400),
                          curve: Curves.bounceOut);
                    }),
              ],
            ))
      ],
    ));
  }
}
