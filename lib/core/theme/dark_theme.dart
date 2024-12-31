import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:journal_app/core/theme/colors.dart';

final customDarkTheme = ThemeData(
  scaffoldBackgroundColor: Colors.grey.shade900,
  primaryColor: KColors.primary,
  colorScheme: const ColorScheme.dark(brightness: Brightness.light),
  iconTheme: IconThemeData(color: Colors.purple.shade200, opacity: 0.8),
  // primarySwatch: MaterialColor(
  //   0xff933456,
  //   // --- colorMapDark,
  // ),
  textTheme: GoogleFonts.darkerGrotesqueTextTheme().copyWith(),
  appBarTheme: const AppBarTheme(
      // --- color: KColors.GRAY_BG,
      ),
);
