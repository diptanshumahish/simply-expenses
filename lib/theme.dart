import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppColors {
  static const themeColor = Color(0xFF57c4e5);
  static const secondary = Color(0xFFf97068);
  static const sec = Color(0xFFffff82);
  static const darkBack = Color(0xFF212738);
  static const lighttext = Color(0xFFedf2ef);
  static const positive = Colors.green;
}

abstract class Apptheme {
  static var brgthDark = Brightness.dark;
//light theme
  static ThemeData light() => ThemeData(
        brightness: Brightness.light,
        textTheme: GoogleFonts.interTextTheme().apply(),
        scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
      );
  static ThemeData dark() => ThemeData(
        scaffoldBackgroundColor: const Color(0xFF232324),
        brightness: Brightness.dark,
        textTheme: GoogleFonts.interTextTheme().apply(),
      );
}
