import 'package:expense_tracker/screens.dart/homepage.dart';
import 'package:expense_tracker/utils/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Apptheme.light(),
      darkTheme: Apptheme.dark(),
      home: const HomePage(),
    );
  }
}