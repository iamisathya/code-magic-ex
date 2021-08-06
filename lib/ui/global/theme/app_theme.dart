import 'package:code_magic_ex/constants/font_weights.dart';
import 'package:flutter/material.dart';
import '../../../utilities/constants.dart';

class AppTheme {
  //
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      color: kMainColor,
      iconTheme: IconThemeData(
        color: kMainColor,
      ),
    ),
    colorScheme: const ColorScheme.light(
      primary: Colors.black,
      primaryVariant: Colors.black,
      secondary: Colors.red,
    ),
    cardTheme: const CardTheme(
      color: Colors.black,
    ),
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),
    textTheme: const TextTheme(
      headline1: TextStyle(
        color: Colors.black,
        fontSize: 34.0,
      ),
      headline2: TextStyle(
        color: Colors.black,
        fontSize: 28.0,
      ),
      headline3: TextStyle(
        color: Colors.black,
        fontSize: 24.0,
      ),
      headline4: TextStyle(
        color: Colors.black,
        fontSize: 20.0,
      ),
      headline5: TextStyle(
        color: Colors.black,
        fontSize: 18.0,
      ),
      headline6: TextStyle(
        fontWeight: AppFontWeight.bold,
        color: Colors.black,
        fontSize: 16.0,
      ),
      subtitle2: TextStyle(
        color: Colors.black,
        fontSize: 18.0,
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      color: Colors.black,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    colorScheme: const ColorScheme.light(
      primary: Colors.black,
      onPrimary: Colors.black,
      primaryVariant: Colors.black,
      secondary: Colors.red,
    ),
    cardTheme: const CardTheme(
      color: Colors.black,
    ),
    iconTheme: const IconThemeData(
      color: Colors.white54,
    ),
    textTheme: const TextTheme(
      headline1: TextStyle(
        color: Colors.black,
        fontSize: 34.0,
      ),
      headline2: TextStyle(
        color: Colors.black,
        fontSize: 28.0,
      ),
      headline3: TextStyle(
        color: Colors.black,
        fontSize: 24.0,
      ),
      headline4: TextStyle(
        color: Colors.black,
        fontSize: 22.0,
      ),
      headline5: TextStyle(
        color: Colors.black,
        fontSize: 20.0,
      ),
      headline6: TextStyle(
        color: Colors.black,
        fontSize: 18.0,
      ),
      subtitle2: TextStyle(
        color: Colors.black,
        fontSize: 18.0,
      ),
    ),
  );
}

TextTheme textTheme() {
  return const TextTheme(
    headline4: TextStyle(color: Colors.white, fontSize: 16),
    headline5: TextStyle(color: Colors.white, fontSize: 14),
  );
}
