import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppColors {
  static const themeColor = Color(0xFF57c4e5);
  static const secondary = Color(0xFFf97068);
  static const sec = Color(0xFFffff82);
  static const darkBack = Color(0xFF212738);
  static const lighttext = Color(0xFFedf2ef);
}

abstract class Apptheme {
  static var brgthDark = Brightness.dark;
//light theme
  static ThemeData light() => ThemeData(
        brightness: Brightness.light,
        textTheme: GoogleFonts.interTextTheme().apply(),
        scaffoldBackgroundColor: Color.fromARGB(255, 255, 255, 255),
      );
  static ThemeData dark() => ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 35, 35, 36),
        brightness: Brightness.dark,
        textTheme: GoogleFonts.interTextTheme().apply(),
      );
}
