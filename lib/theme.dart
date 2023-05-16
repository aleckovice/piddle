import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const piddlePurple = Color.fromRGBO(134, 101, 217, 1);

ThemeData get theme {
  final theme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: piddlePurple,
      brightness: Brightness.dark,
    ),
    useMaterial3: true,
  );
  return theme.copyWith(
    textTheme: GoogleFonts.pressStart2pTextTheme(theme.textTheme),
    primaryTextTheme: GoogleFonts.pressStart2pTextTheme(theme.primaryTextTheme),
  );
}
