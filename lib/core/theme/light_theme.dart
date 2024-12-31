import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:journal_app/core/theme/colors.dart';

const double _defualtBorderRadius = 12;
final customLightTheme = ThemeData(
  //scaffoldBackgroundColor: KColors.SCAFFOLD_BG,
  primaryColor: KColors.primary,
  primaryColorLight: Colors.white,
  dividerTheme: const DividerThemeData(
    color: Color(0xffF6F6F6),
    thickness: 1,
  ),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: Color(0xff0D1F2D),
  ),
  colorScheme: const ColorScheme.light(brightness: Brightness.light),
  iconTheme: const IconThemeData(
    // --- color: KColors.ICON_COLOR,
    size: 16,
  ),
  primarySwatch: MaterialColor(
    0xff2C3775,
    colorMapLight,
  ),
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    color: KColors.primary,
    //circularTrackColor: KColors.GRAY_BG.withOpacity(.5),
  ),
  textTheme: GoogleFonts.loraTextTheme().copyWith(
    titleLarge: const TextStyle(
      fontSize: 16,
    ),
    headlineSmall: const TextStyle(
      color: Color(0xff0D1F2D),
    ),
    bodyLarge: GoogleFonts.poppins(
      fontWeight: FontWeight.bold,
      fontSize: 20,
      // color: KColors.TEXT,
    ),
    bodyMedium: GoogleFonts.poppins(
      //color: KColors.TEXT,
      fontSize: 16,
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    // fillColor: KColors.INPUT_BG,
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: KColors.inputBorder,
      ),
      borderRadius: BorderRadius.all(Radius.circular(_defualtBorderRadius)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: KColors.inputBorder,
      ),
      borderRadius: BorderRadius.all(Radius.circular(_defualtBorderRadius)),
    ),
    border: InputBorder.none,
    errorStyle: TextStyle(color: KColors.primary, height: 0.7),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: KColors.primary),
      borderRadius: BorderRadius.all(Radius.circular(_defualtBorderRadius)),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: KColors.primary),
      borderRadius: BorderRadius.all(Radius.circular(_defualtBorderRadius)),
    ),
    disabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: KColors.textVeryLight,
      ),
      borderRadius: BorderRadius.all(Radius.circular(_defualtBorderRadius)),
    ),
    hintStyle: TextStyle(
      color: KColors.textLight,
    ),
    contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
  ),
  appBarTheme: const AppBarTheme(
    centerTitle: false,
    iconTheme: IconThemeData(
        // ---   color: KColors.TEXT,
        ),
    titleTextStyle: TextStyle(
      fontSize: 24,
      // --- color: KColors.TEXT,
      fontWeight: FontWeight.w600,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
    // --- backgroundColor: KColors.SCAFFOLD_BG,
    shadowColor: Color(0xffF6F6F6),
    elevation: 1,
  ),
);
