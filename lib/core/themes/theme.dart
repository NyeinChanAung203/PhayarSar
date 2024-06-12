import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme => ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.yellow,
          brightness: Brightness.light,
        ),
        fontFamily: GoogleFonts.montserrat.call().fontFamily,
      );

  static ThemeData get darkTheme => ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.yellow,
          brightness: Brightness.dark,
        ),
        fontFamily: GoogleFonts.montserrat.call().fontFamily,
      );
}
