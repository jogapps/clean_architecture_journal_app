import 'package:flutter/material.dart';

class KColors {
  static const gradient = [
    Color(0xFFEDF8FF),
    Color(0xFFFDC1E8),
    Color(0xFFFFFFFF),
    Color(0xFFFDFAE1)
  ];

  static const primary = Color(0xFF458CFF);
  static const black = Color(0xff000000);
  static const gray = Color(0xff475367);
  static const inputBorder = Color(0xffdedfe2);
  static const textLight = Color(0xff747c87);
  static const textVeryLight = Color(0xffB2B2B2);
}

final Map<int, Color> colorMapLight = {
  50: const Color(0xff016BFD).withOpacity(.05),
  100: const Color(0xff016BFD).withOpacity(.1),
  200: const Color(0xff016BFD).withOpacity(.2),
  300: const Color(0xff016BFD).withOpacity(.3),
  400: const Color(0xff016BFD).withOpacity(.4),
  500: const Color(0xff016BFD).withOpacity(.5),
  600: const Color(0xff016BFD).withOpacity(.6),
  700: const Color(0xff016BFD).withOpacity(.7),
  800: const Color(0xff016BFD).withOpacity(.8),
  900: const Color(0xff016BFD),
};
