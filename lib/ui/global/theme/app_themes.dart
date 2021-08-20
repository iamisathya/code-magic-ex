import 'package:flutter/material.dart';

class AppThemes {
  AppThemes._();

  static const Color dodgerBlue = Color(0xFF204CDC);
  static const Color whiteLilac = Color.fromRGBO(248, 250, 252, 1);

  //the light theme
  static final ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.red,
    brightness: Brightness.light,
    primaryColor: const Color(0xfff44336),
    primaryColorBrightness: Brightness.dark,
    primaryColorLight: const Color(0xffffcdd2),
    primaryColorDark: const Color(0xffd32f2f),
    accentColor: const Color(0xfff44336),
    accentColorBrightness: Brightness.dark,
    canvasColor: const Color(0xfffafafa),
    scaffoldBackgroundColor: const Color(0xfffafafa),
    bottomAppBarColor: const Color(0xffffffff),
    cardColor: const Color(0xffffffff),
    dividerColor: const Color(0x1f000000),
    highlightColor: const Color(0x66bcbcbc),
    splashColor: const Color(0x66c8c8c8),
    selectedRowColor: const Color(0xfff5f5f5),
    unselectedWidgetColor: const Color(0x8a000000),
    disabledColor: const Color(0x61000000),
    buttonColor: const Color(0xffe0e0e0),
    toggleableActiveColor: const Color(0xffe53935),
    secondaryHeaderColor: const Color(0xffffebee),
    backgroundColor: const Color(0xffef9a9a),
    dialogBackgroundColor: const Color(0xffffffff),
    indicatorColor: const Color(0xfff44336),
    hintColor: const Color(0x8a000000),
    errorColor: const Color(0xffd32f2f),
    buttonTheme: const ButtonThemeData(
      padding: EdgeInsets.only(left: 16, right: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2.0)),
      ),
      buttonColor: Color(0xffe0e0e0),
      disabledColor: Color(0x61000000),
      highlightColor: Color(0x29000000),
      splashColor: Color(0x1f000000),
      focusColor: Color(0x1f000000),
      hoverColor: Color(0x0a000000),
      colorScheme: ColorScheme(
        primary: Color(0xfff44336),
        primaryVariant: Color(0xffd32f2f),
        secondary: Color(0xfff44336),
        secondaryVariant: Color(0xffd32f2f),
        surface: Color(0xffffffff),
        background: Color(0xffef9a9a),
        error: Color(0xffd32f2f),
        onPrimary: Color(0xffffffff),
        onSecondary: Color(0xffffffff),
        onSurface: Color(0xff000000),
        onBackground: Color(0xffffffff),
        onError: Color(0xffffffff),
        brightness: Brightness.light,
      ),
    ),
    textTheme: const TextTheme(
      headline1: TextStyle(
        color: Color(0x8a000000),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      headline2: TextStyle(
        color: Color(0x8a000000),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      headline3: TextStyle(
        color: Color(0x8a000000),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      headline4: TextStyle(
        color: Color(0x8a000000),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      headline5: TextStyle(
        color: Color(0xdd000000),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      headline6: TextStyle(
        color: Color(0xdd000000),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      subtitle1: TextStyle(
        color: Color(0xdd000000),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      bodyText1: TextStyle(
        color: Color(0xdd000000),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      bodyText2: TextStyle(
        color: Color(0xdd000000),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      caption: TextStyle(
        color: Color(0x8a000000),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      button: TextStyle(
        color: Color(0xdd000000),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      overline: TextStyle(
        color: Color(0xff000000),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
    ),
    primaryTextTheme: const TextTheme(
      headline1: TextStyle(
        color: Color(0xb3ffffff),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      headline2: TextStyle(
        color: Color(0xb3ffffff),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      headline3: TextStyle(
        color: Color(0xb3ffffff),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      headline4: TextStyle(
        color: Color(0xb3ffffff),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      headline5: TextStyle(
        color: Color(0xffffffff),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      headline6: TextStyle(
        color: Color(0xffffffff),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      subtitle1: TextStyle(
        color: Color(0xffffffff),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      bodyText1: TextStyle(
        color: Color(0xffffffff),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      bodyText2: TextStyle(
        color: Color(0xffffffff),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      caption: TextStyle(
        color: Color(0xb3ffffff),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      button: TextStyle(
        color: Color(0xffffffff),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      subtitle2: TextStyle(
        color: Color(0xffffffff),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      overline: TextStyle(
        color: Color(0xffffffff),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
    ),
    accentTextTheme: const TextTheme(
      headline1: TextStyle(
        color: Color(0xb3ffffff),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      headline2: TextStyle(
        color: Color(0xb3ffffff),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      headline3: TextStyle(
        color: Color(0xb3ffffff),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      headline4: TextStyle(
        color: Color(0xb3ffffff),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      headline5: TextStyle(
        color: Color(0xffffffff),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      headline6: TextStyle(
        color: Color(0xffffffff),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      subtitle1: TextStyle(
        color: Color(0xffffffff),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      bodyText1: TextStyle(
        color: Color(0xffffffff),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      bodyText2: TextStyle(
        color: Color(0xffffffff),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      caption: TextStyle(
        color: Color(0xb3ffffff),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      button: TextStyle(
        color: Color(0xffffffff),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      subtitle2: TextStyle(
        color: Color(0xffffffff),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      overline: TextStyle(
        color: Color(0xffffffff),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(
        color: Color(0xdd000000),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      helperStyle: TextStyle(
        color: Color(0xdd000000),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      hintStyle: TextStyle(
        color: Color(0xdd000000),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      errorStyle: TextStyle(
        color: Color(0xdd000000),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      contentPadding: EdgeInsets.only(top: 12, bottom: 12),
      prefixStyle: TextStyle(
        color: Color(0xdd000000),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      suffixStyle: TextStyle(
        color: Color(0xdd000000),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      counterStyle: TextStyle(
        color: Color(0xdd000000),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      fillColor: Color(0x00000000),
      errorBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
      focusedBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
      focusedErrorBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
      disabledBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
      enabledBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
      border: UnderlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
    ),
    iconTheme: const IconThemeData(
      color: Color(0xdd000000),
      opacity: 1,
      size: 24,
    ),
    primaryIconTheme: const IconThemeData(
      color: Color(0xffffffff),
      opacity: 1,
      size: 24,
    ),
    accentIconTheme: const IconThemeData(
      color: Color(0xffffffff),
      opacity: 1,
      size: 24,
    ),
    sliderTheme: const SliderThemeData(
      valueIndicatorTextStyle: TextStyle(
        color: Color(0xffffffff),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
    ),
    tabBarTheme: const TabBarTheme(
      indicatorSize: TabBarIndicatorSize.tab,
      labelColor: Color(0xffffffff),
      unselectedLabelColor: Color(0xb2ffffff),
    ),
    chipTheme: const ChipThemeData(
      backgroundColor: Color(0x1f000000),
      brightness: Brightness.light,
      deleteIconColor: Color(0xde000000),
      disabledColor: Color(0x0c000000),
      labelPadding: EdgeInsets.only(left: 8, right: 8),
      labelStyle: TextStyle(
        color: Color(0xde000000),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      padding: EdgeInsets.only(top: 4, bottom: 4, left: 4, right: 4),
      secondaryLabelStyle: TextStyle(
        color: Color(0x3d000000),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      secondarySelectedColor: Color(0x3df44336),
      selectedColor: Color(0x3d000000),
      shape: StadiumBorder(),
    ),
    dialogTheme: const DialogTheme(shape: RoundedRectangleBorder()),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Color(0xff4285f4),
      selectionColor: Color(0xffef9a9a),
      selectionHandleColor: Color(0xffe57373),
    ),
  );

  //the dark theme
  static final ThemeData darkTheme = ThemeData(
    primarySwatch: const MaterialColor(4280361249, {
      50: Color(0xfff2f2f2),
      100: Color(0xffe6e6e6),
      200: Color(0xffcccccc),
      300: Color(0xffb3b3b3),
      400: Color(0xff999999),
      500: Color(0xff808080),
      600: Color(0xff666666),
      700: Color(0xff4d4d4d),
      800: Color(0xff333333),
      900: Color(0xff191919)
    }),
    brightness: Brightness.dark,
    primaryColor: const Color(0xff212121),
    primaryColorBrightness: Brightness.dark,
    primaryColorLight: const Color(0xff9e9e9e),
    primaryColorDark: const Color(0xff000000),
    accentColor: const Color(0xff64ffda),
    accentColorBrightness: Brightness.light,
    canvasColor: const Color(0xff303030),
    scaffoldBackgroundColor: const Color(0xff303030),
    bottomAppBarColor: const Color(0xff424242),
    cardColor: const Color(0xff424242),
    dividerColor: const Color(0x1fffffff),
    highlightColor: const Color(0x40cccccc),
    splashColor: const Color(0x40cccccc),
    selectedRowColor: const Color(0xfff5f5f5),
    unselectedWidgetColor: const Color(0xb3ffffff),
    disabledColor: const Color(0x62ffffff),
    buttonColor: const Color(0xff546e7a),
    toggleableActiveColor: const Color(0xff64ffda),
    secondaryHeaderColor: const Color(0xff616161),
    backgroundColor: const Color(0xff616161),
    dialogBackgroundColor: const Color(0xff424242),
    indicatorColor: const Color(0xff64ffda),
    hintColor: const Color(0x80ffffff),
    errorColor: const Color(0xffd32f2f),
    buttonTheme: const ButtonThemeData(
      padding: EdgeInsets.only(left: 16, right: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2.0)),
      ),
      buttonColor: Color(0xff546e7a),
      disabledColor: Color(0x61ffffff),
      highlightColor: Color(0x29ffffff),
      splashColor: Color(0x1fffffff),
      focusColor: Color(0x1fffffff),
      hoverColor: Color(0x0affffff),
      colorScheme: ColorScheme(
        primary: Color(0xff607d8b),
        primaryVariant: Color(0xff000000),
        secondary: Color(0xff64ffda),
        secondaryVariant: Color(0xff00bfa5),
        surface: Color(0xff424242),
        background: Color(0xff616161),
        error: Color(0xffd32f2f),
        onPrimary: Color(0xffffffff),
        onSecondary: Color(0xff000000),
        onSurface: Color(0xffffffff),
        onBackground: Color(0xffffffff),
        onError: Color(0xff000000),
        brightness: Brightness.dark,
      ),
    ),
    textTheme: const TextTheme(
      headline1: TextStyle(
        color: Color(0xb3ffffff),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      headline2: TextStyle(
        color: Color(0xb3ffffff),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      headline3: TextStyle(
        color: Color(0xb3ffffff),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      headline4: TextStyle(
        color: Color(0xb3ffffff),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      headline5: TextStyle(
        color: Color(0xffffffff),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      headline6: TextStyle(
        color: Color(0xffffffff),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      subtitle1: TextStyle(
        color: Color(0xffffffff),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      bodyText1: TextStyle(
        color: Color(0xffffffff),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      bodyText2: TextStyle(
        color: Color(0xffffffff),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      caption: TextStyle(
        color: Color(0xb3ffffff),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      button: TextStyle(
        color: Color(0xffffffff),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      subtitle2: TextStyle(
        color: Color(0xffffffff),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      overline: TextStyle(
        color: Color(0xffffffff),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
    ),
    primaryTextTheme: const TextTheme(
      headline1: TextStyle(
        color: Color(0xb3ffffff),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      headline2: TextStyle(
        color: Color(0xb3ffffff),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      headline3: TextStyle(
        color: Color(0xb3ffffff),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      headline4: TextStyle(
        color: Color(0xb3ffffff),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      headline5: TextStyle(
        color: Color(0xffffffff),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      headline6: TextStyle(
        color: Color(0xffffffff),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      subtitle1: TextStyle(
        color: Color(0xffffffff),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      bodyText1: TextStyle(
        color: Color(0xffffffff),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      bodyText2: TextStyle(
        color: Color(0xffffffff),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      caption: TextStyle(
        color: Color(0xb3ffffff),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      button: TextStyle(
        color: Color(0xffffffff),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      subtitle2: TextStyle(
        color: Color(0xffffffff),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      overline: TextStyle(
        color: Color(0xffffffff),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
    ),
    accentTextTheme: const TextTheme(
      headline1: TextStyle(
        color: Color(0x8a000000),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      headline2: TextStyle(
        color: Color(0x8a000000),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      headline3: TextStyle(
        color: Color(0x8a000000),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      headline4: TextStyle(
        color: Color(0x8a000000),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      headline5: TextStyle(
        color: Color(0xdd000000),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      headline6: TextStyle(
        color: Color(0xdd000000),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      subtitle1: TextStyle(
        color: Color(0xdd000000),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      bodyText1: TextStyle(
        color: Color(0xdd000000),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      bodyText2: TextStyle(
        color: Color(0xdd000000),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      caption: TextStyle(
        color: Color(0x8a000000),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      button: TextStyle(
        color: Color(0xdd000000),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      subtitle2: TextStyle(
        color: Color(0xff000000),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      overline: TextStyle(
        color: Color(0xff000000),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(
        color: Color(0xffffffff),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      helperStyle: TextStyle(
        color: Color(0xffffffff),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      hintStyle: TextStyle(
        color: Color(0xffffffff),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      errorStyle: TextStyle(
        color: Color(0xffffffff),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      contentPadding: EdgeInsets.only(top: 12, bottom: 12),
      prefixStyle: TextStyle(
        color: Color(0xffffffff),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      suffixStyle: TextStyle(
        color: Color(0xffffffff),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      counterStyle: TextStyle(
        color: Color(0xffffffff),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      fillColor: Color(0x00000000),
      errorBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
      focusedBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
      focusedErrorBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
      disabledBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
      enabledBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
      border: UnderlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
    ),
    iconTheme: const IconThemeData(
      color: Color(0xffffffff),
      opacity: 1,
      size: 24,
    ),
    primaryIconTheme: const IconThemeData(
      color: Color(0xffffffff),
      opacity: 1,
      size: 24,
    ),
    accentIconTheme: const IconThemeData(
      color: Color(0xff000000),
      opacity: 1,
      size: 24,
    ),
    sliderTheme: const SliderThemeData(
      valueIndicatorTextStyle: TextStyle(
        color: Color(0xdd000000),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
    ),
    tabBarTheme: const TabBarTheme(
      indicatorSize: TabBarIndicatorSize.tab,
      labelColor: Color(0xffffffff),
      unselectedLabelColor: Color(0xb2ffffff),
    ),
    chipTheme: const ChipThemeData(
      backgroundColor: Color(0x1fffffff),
      brightness: Brightness.dark,
      deleteIconColor: Color(0xdeffffff),
      disabledColor: Color(0x0cffffff),
      labelPadding: EdgeInsets.only(left: 8, right: 8),
      labelStyle: TextStyle(
        color: Color(0xdeffffff),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      padding: EdgeInsets.only(top: 4, bottom: 4, left: 4, right: 4),
      secondaryLabelStyle: TextStyle(
        color: Color(0x3dffffff),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      secondarySelectedColor: Color(0x3d212121),
      selectedColor: Color(0x3dffffff),
      shape: StadiumBorder(),
    ),
    dialogTheme: const DialogTheme(shape: RoundedRectangleBorder()),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Color(0xff4285f4),
      selectionColor: Color(0xff64ffda),
      selectionHandleColor: Color(0xff1de9b6),
    ),
  );
}
