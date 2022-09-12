import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_job_game/src/config/colors.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
    primarySwatch: AppColors.materialBrown,
    scaffoldBackgroundColor: AppColors.backgroundColor,
  );
}

class TextTheme {
  static TextStyle headline = GoogleFonts.rubik(color: Colors.black, fontSize: 40);
  static TextStyle button = GoogleFonts.varelaRound(color: Colors.white, fontSize: 16, letterSpacing: 1.6);
}