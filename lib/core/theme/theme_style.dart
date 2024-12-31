import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:journal_app/core/theme/colors.dart';

class ThemeConfig {
  static final TextTheme textTheme = ThemeData.light().textTheme;
}

final TextTheme kTextTheme = ThemeConfig.textTheme;
final TextStyle kTextBody1 = kTextTheme.bodyLarge!;
final TextStyle kTextBody2 =
    GoogleFonts.darkerGrotesque(textStyle: kTextTheme.bodyMedium!); //default
final TextStyle kTextBody3 =
    GoogleFonts.poppins(textStyle: kTextTheme.bodyMedium!); //default
final TextStyle kTitleStyle = kTextBody1.copyWith(
    fontSize: 32, color: KColors.black, fontWeight: FontWeight.bold);
final TextStyle kSubTitleStyle =
    kTextBody3.copyWith(fontSize: 16, color: KColors.gray);

final TextStyle dropDownTitleStyle = kTextBody3.copyWith(
    fontSize: 14, color: KColors.black, fontWeight: FontWeight.w600);

const double PADDING = 16;
const double PADDING_SM = 8;
const double PADDING_LG = 24;
const double PADDING_XL = 32;

final kBoxShadowLight = <BoxShadow>[
  const BoxShadow(
    color: Color(0xFFB6C6D4),
    spreadRadius: -8,
    blurRadius: 6.0,
    offset: Offset(6, 6),
  ),
  const BoxShadow(
    color: Color.fromRGBO(0, 0, 0, 0.05),
    blurRadius: 0,
    offset: Offset(-0, -0),
  )
];
