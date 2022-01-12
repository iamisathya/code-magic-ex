// ignore_for_file: avoid_redundant_argument_values
import 'package:flutter/material.dart';

class AppThemes {
  AppThemes._();

  static const Color dodgerBlue = Color(0xFF204CDC);
  static const Color whiteLilac = Color.fromRGBO(248, 250, 252, 1);

  //the light theme
  static final ThemeData lightTheme = ThemeData(
      fontFamily: "MavenPro",
      primarySwatch: const MaterialColor(4280371421, {
        50: Color(0xffe9edfc),
        100: Color(0xffd3daf8),
        200: Color(0xffa6b6f2),
        300: Color(0xff7a91eb),
        400: Color(0xff4e6de4),
        500: Color(0xff2148de),
        600: Color(0xff1b3ab1),
        700: Color(0xff142b85),
        800: Color(0xff0d1d59),
        900: Color(0xff070e2c)
      }),
      brightness: Brightness.light,
      primaryColor: const Color(0xFF1C9CFC),
      primaryColorBrightness: Brightness.dark,
      primaryColorLight: const Color(0xffd3daf8),
      primaryColorDark: const Color(0xff142b85),
      accentColor: const Color(0xff2148de),
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
      toggleableActiveColor: const Color(0xff1b3ab1),
      secondaryHeaderColor: const Color(0xffe9edfc),
      backgroundColor: const Color(0xffa6b6f2),
      dialogBackgroundColor: const Color(0xffffffff),
      indicatorColor: const Color(0xff2148de),
      hintColor: const Color(0x8a000000),
      errorColor: const Color(0xffd32f2f),
      appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(color: Color(0xFF000000), fontSize: 18),
        backgroundColor: Color(0xFFFFFFFF),
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      cardTheme: const CardTheme(
        color: Color(0xFFFFFFFF),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all<Size>(const Size(100, 40)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2.0),
                  side: BorderSide.none)),
          backgroundColor: MaterialStateProperty.all<Color>(
            const Color(0xFF1C9CFC),
          ), //button color
          foregroundColor: MaterialStateProperty.all<Color>(
            const Color(0xFFFFFFFF),
          ), //text (and icon)
        ),
      ),
      buttonTheme: const ButtonThemeData(
        textTheme: ButtonTextTheme.normal,
        minWidth: 88,
        height: 40,
        padding: EdgeInsets.only(top: 0, bottom: 0, left: 16, right: 16),
        shape: RoundedRectangleBorder(
          side: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(2.0)),
        ),
        alignedDropdown: false,
        buttonColor: Color(0xFF1C9CFC),
        disabledColor: Color(0x61000000),
        highlightColor: Color(0x29000000),
        splashColor: Color(0x1f000000),
        focusColor: Color(0x1f000000),
        hoverColor: Color(0x0a000000),
        colorScheme: ColorScheme(
          primary: Color(0xff1C9CFC),
          primaryVariant: Color(0xff142b85),
          secondary: Color(0xff2148de),
          secondaryVariant: Color(0xff142b85),
          surface: Color(0xffffffff),
          background: Color(0xffa6b6f2),
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
          fontSize: 60,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        headline2: TextStyle(
          color: Color(0x8a000000),
          fontSize: 48,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        headline3: TextStyle(
          color: Color(0xFF000000),
          fontSize: 34,
          fontWeight: FontWeight.normal,
          fontStyle: FontStyle.normal,
        ),
        headline4: TextStyle(
          color: Color(0xFF000000),
          fontSize: 24,
          fontWeight: FontWeight.normal,
          fontStyle: FontStyle.normal,
        ),
        headline5: TextStyle(
          color: Color(0xFF000000),
          fontSize: 20,
          fontWeight: FontWeight.normal,
          fontStyle: FontStyle.normal,
        ),
        headline6: TextStyle(
          color: Color(0xFF384250),
          fontSize: 18,
          fontWeight: FontWeight.normal,
          fontStyle: FontStyle.normal,
        ),
        subtitle1: TextStyle(
          color: Color(0xFF000000),
          fontSize: 16,
          fontWeight: FontWeight.normal,
          fontStyle: FontStyle.normal,
        ),
        subtitle2: TextStyle(
          color: Color(0xFF606975),
          fontSize: 14,
          fontWeight: FontWeight.normal,
          fontStyle: FontStyle.normal,
        ),
        bodyText1: TextStyle(
          color: Color(0xFF000000),
          fontSize: 14,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
        ),
        bodyText2: TextStyle(
          color: Color(0xFF505050),
          fontSize: 12,
          fontWeight: FontWeight.normal,
          fontStyle: FontStyle.normal,
        ),
        caption: TextStyle(
          color: Color(0xFF606975),
          fontSize: 12,
          fontWeight: FontWeight.normal,
          fontStyle: FontStyle.normal,
        ),
        button: TextStyle(
          color: Color(0xdd000000),
          fontSize: null,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        overline: TextStyle(
          color: Color(0xff000000),
          fontSize: null,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
      ),
      primaryTextTheme: const TextTheme(
        headline1: TextStyle(
          color: Color(0xb3ffffff),
          fontSize: null,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        headline2: TextStyle(
          color: Color(0xb3ffffff),
          fontSize: null,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        headline3: TextStyle(
          color: Color(0xb3ffffff),
          fontSize: null,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        headline4: TextStyle(
          color: Color(0xb3ffffff),
          fontSize: null,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        headline5: TextStyle(
          color: Color(0xffffffff),
          fontSize: null,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        headline6: TextStyle(
          color: Color(0xffffffff),
          fontSize: null,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        subtitle1: TextStyle(
          color: Color(0xffffffff),
          fontSize: null,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        bodyText1: TextStyle(
          color: Color(0xffffffff),
          fontSize: null,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        bodyText2: TextStyle(
          color: Color(0xffffffff),
          fontSize: null,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        caption: TextStyle(
          color: Color(0xb3ffffff),
          fontSize: null,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        button: TextStyle(
          color: Color(0xffffffff),
          fontSize: null,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        subtitle2: TextStyle(
          color: Color(0xffffffff),
          fontSize: null,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        overline: TextStyle(
          color: Color(0xffffffff),
          fontSize: null,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
      ),
      accentTextTheme: const TextTheme(
        headline1: TextStyle(
          color: Color(0xb3ffffff),
          fontSize: null,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        headline2: TextStyle(
          color: Color(0xb3ffffff),
          fontSize: null,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        headline3: TextStyle(
          color: Color(0xb3ffffff),
          fontSize: null,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        headline4: TextStyle(
          color: Color(0xb3ffffff),
          fontSize: null,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        headline5: TextStyle(
          color: Color(0xffffffff),
          fontSize: null,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        headline6: TextStyle(
          color: Color(0xffffffff),
          fontSize: null,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        subtitle1: TextStyle(
          color: Color(0xffffffff),
          fontSize: null,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        bodyText1: TextStyle(
          color: Color(0xffffffff),
          fontSize: null,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        bodyText2: TextStyle(
          color: Color(0xffffffff),
          fontSize: null,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        caption: TextStyle(
          color: Color(0xb3ffffff),
          fontSize: null,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        button: TextStyle(
          color: Color(0xffffffff),
          fontSize: null,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        subtitle2: TextStyle(
          color: Color(0xffffffff),
          fontSize: null,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        overline: TextStyle(
          color: Color(0xffffffff),
          fontSize: null,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        labelStyle: TextStyle(
          color: Color(0xdd000000),
          fontSize: null,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        helperStyle: TextStyle(
          color: Color(0xdd000000),
          fontSize: null,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        hintStyle: TextStyle(
          color: Color(0xdd000000),
          fontSize: null,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        errorStyle: TextStyle(
          color: Color(0xffd32f2f),
          fontSize: null,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        errorMaxLines: null,
        isDense: false,
        contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 15),
        isCollapsed: false,
        prefixStyle: TextStyle(
          color: Color(0xdd000000),
          fontSize: null,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        suffixStyle: TextStyle(
          color: Color(0xdd000000),
          fontSize: null,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        counterStyle: TextStyle(
          color: Color(0xdd000000),
          fontSize: null,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        filled: false,
        fillColor: Color(0x00000000),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xffd32f2f),
          ),
          gapPadding: 10,
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFF204CDC),
          ),
          gapPadding: 10,
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xffd32f2f),
          ),
          gapPadding: 10,
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFF204CDC),
          ),
          gapPadding: 10,
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFF204CDC),
          ),
          gapPadding: 10,
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFF204CDC),
          ),
          gapPadding: 10,
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
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
        activeTrackColor: null,
        inactiveTrackColor: null,
        disabledActiveTrackColor: null,
        disabledInactiveTrackColor: null,
        activeTickMarkColor: null,
        inactiveTickMarkColor: null,
        disabledActiveTickMarkColor: null,
        disabledInactiveTickMarkColor: null,
        thumbColor: null,
        disabledThumbColor: null,
        thumbShape: null,
        overlayColor: null,
        valueIndicatorColor: null,
        valueIndicatorShape: null,
        showValueIndicator: null,
        valueIndicatorTextStyle: TextStyle(
          color: Color(0xffffffff),
          fontSize: null,
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
        labelPadding: EdgeInsets.only(top: 0, bottom: 0, left: 8, right: 8),
        labelStyle: TextStyle(
          color: Color(0xde000000),
          fontSize: null,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        padding: EdgeInsets.only(top: 4, bottom: 4, left: 4, right: 4),
        secondaryLabelStyle: TextStyle(
          color: Color(0x3d000000),
          fontSize: null,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        secondarySelectedColor: Color(0x3D1C9CFC),
        selectedColor: Color(0x3d000000),
        shape: StadiumBorder(
            side: BorderSide(
          color: Color(0xff000000),
          width: 0,
          style: BorderStyle.none,
        )),
      ),
      dialogTheme: const DialogTheme(
          shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Color(0xff000000),
          width: 0,
          style: BorderStyle.none,
        ),
        borderRadius: BorderRadius.all(Radius.circular(0.0)),
      )),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Color(0xff4285f4),
        selectionColor: Color(0xffa6b6f2),
        selectionHandleColor: Color(0xff7a91eb),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF1C9CFC),
        elevation: 10,
        selectedLabelStyle:
            const TextStyle(color: Color(0xFFA67926), fontSize: 14.0),
        unselectedLabelStyle:
            TextStyle(color: Colors.grey[600], fontSize: 12.0),
        selectedItemColor: const Color(0xFF000000),
        unselectedItemColor: const Color(0xFFE3E8ED),
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
      popupMenuTheme: PopupMenuThemeData(
          color: const Color(0xFFFFFFFF),
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          )));

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
        side: BorderSide(color: Color(0xff64ffda), width: 2),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
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
      contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 15),
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
      floatingLabelBehavior: FloatingLabelBehavior.always,
      fillColor: Color(0x00000000),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
      border: OutlineInputBorder(
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
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: const Color(0xFF1C9CFC),
      elevation: 10,
      selectedLabelStyle:
          const TextStyle(color: Color(0xFFA67926), fontSize: 14.0),
      unselectedLabelStyle: TextStyle(color: Colors.grey[600], fontSize: 12.0),
      selectedItemColor: const Color(0xFF000000),
      unselectedItemColor: const Color(0xFFE3E8ED),
      showSelectedLabels: false,
      showUnselectedLabels: false,
    ),
  );
}
