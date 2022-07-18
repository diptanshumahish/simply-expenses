import 'package:expense_tracker/screens.dart/intro/splashscreen.dart';
import 'package:expense_tracker/theme.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
      home: SplashScreen(),
    );
  }
}
