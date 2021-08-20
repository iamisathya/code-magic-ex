// import 'package:code_magic_ex/constants/font_weights.dart';
// import 'package:flutter/material.dart';

// class AppThemes {
//   AppThemes._();

//   static const Color dodgerBlue = Color(0xFF204CDC);
//   static const Color whiteLilac = Color.fromRGBO(248, 250, 252, 1);

//   static const Color blackPearl = Color.fromRGBO(30, 31, 43, 1);
//   static const Color brinkPink = Color.fromRGBO(255, 97, 136, 1);
//   static const Color juneBud = Color.fromRGBO(186, 215, 97, 1);
//   static const Color white = Color.fromRGBO(255, 255, 255, 1);
//   static const Color nevada = Color.fromRGBO(105, 109, 119, 1);
//   static const Color ebonyClay = Color.fromRGBO(40, 42, 58, 1);
//   static const Color greyColor = Colors.grey;

//   static String font1 = "ProductSans";
//   static String font2 = "Roboto";
//   //constants color range for light theme
//   //main color
//   static const Color _lightPrimaryColor = dodgerBlue;

//   //Background Colors
//   static const Color _lightBackgroundColor = whiteLilac;
//   static const Color _lightBackgroundAppBarColor = whiteLilac;
//   static const Color _lightBackgroundSecondaryColor = white;
//   static const Color _lightBackgroundAlertColor = blackPearl;
//   static const Color _lightBackgroundActionTextColor = white;

//   //Text Colors
//   static const Color _lightTextColor = Colors.black;
//   static const Color _greyColor = greyColor;

//   //Border Color
//   static const Color _lightBorderColor = nevada;

//   //Icon Color
//   static const Color _lightIconColor = nevada;

//   //Caption Colors
//   static const Color _lightCaptionColor = nevada;

//   //form input colors
//   static const Color _lightBorderActiveColor = _lightPrimaryColor;
//   static const Color _lightBorderErrorColor = brinkPink;

//   //constants color range for dark theme
//   static const Color _darkPrimaryColor = whiteLilac;

//   //Background Colors
//   static const Color _darkBackgroundColor = ebonyClay;
//   static const Color _darkBackgroundAppBarColor = ebonyClay;
//   static const Color _darkBackgroundSecondaryColor =
//       Color.fromRGBO(0, 0, 0, .6);
//   static const Color _darkBackgroundAlertColor = blackPearl;
//   static const Color _darkBackgroundActionTextColor = white;

//   //Text Colors
//   static const Color _darkTextColor = Colors.white;

//   //Caption Colors
//   static const Color _darkCaptionColor = nevada;

//   //Border Color
//   static const Color _darkBorderColor = nevada;

//   //Icon Color
//   static const Color _darkIconColor = nevada;

//   static const Color _darkInputFillColor = _darkBackgroundSecondaryColor;
//   static const Color _darkBorderActiveColor = _darkPrimaryColor;
//   static const Color _darkBorderErrorColor = brinkPink;

//   //text theme for light theme
//   static const TextTheme _lightTextTheme = TextTheme(
//     headline1: TextStyle(
//         fontSize: 96.0,
//         color: _lightTextColor,
//         letterSpacing: -1.5,
//         fontWeight: AppFontWeight.light),
//     headline2: TextStyle(
//         fontSize: 60.0,
//         color: _lightTextColor,
//         letterSpacing: -0.5,
//         fontWeight: AppFontWeight.light),
//     headline3: TextStyle(
//         fontSize: 48.0,
//         color: _lightTextColor,
//         letterSpacing: 0,
//         fontWeight: AppFontWeight.regular),
//     headline4: TextStyle(
//         fontSize: 34.0,
//         color: _lightTextColor,
//         letterSpacing: 0.25,
//         fontWeight: AppFontWeight.regular),
//     headline5: TextStyle(
//         fontSize: 24.0,
//         color: _lightTextColor,
//         letterSpacing: 0,
//         fontWeight: AppFontWeight.regular),
//     headline6: TextStyle(
//         fontSize: 20.0,
//         color: _lightPrimaryColor,
//         letterSpacing: 0.15,
//         fontWeight: AppFontWeight.medium),
//     bodyText1: TextStyle(
//         fontSize: 16.0,
//         color: _lightTextColor,
//         letterSpacing: 0.5,
//         fontWeight: AppFontWeight.regular),
//     bodyText2: TextStyle(
//         fontSize: 14.0,
//         color: _greyColor,
//         letterSpacing: 0.25,
//         fontWeight: AppFontWeight.regular),
//     button: TextStyle(
//       fontSize: 14.0,
//       color: _lightTextColor,
//       fontWeight: AppFontWeight.medium,
//       letterSpacing: 1.25,
//     ),
//     subtitle1: TextStyle(
//         fontSize: 16.0,
//         color: _lightTextColor,
//         letterSpacing: 0.15,
//         fontWeight: AppFontWeight.regular),
//     subtitle2: TextStyle(
//         fontSize: 14.0,
//         color: _lightTextColor,
//         letterSpacing: 0.1,
//         fontWeight: AppFontWeight.medium),
//     caption: TextStyle(
//         fontSize: 12.0,
//         color: _lightCaptionColor,
//         letterSpacing: 0.4,
//         fontWeight: AppFontWeight.regular),
//   );

//   //the light theme
//   static final ThemeData lightTheme = ThemeData(
//     primarySwatch: Colors.red,
//     brightness: Brightness.light,
//     primaryColor: const Color(0xfff44336),
//     primaryColorBrightness: Brightness.dark,
//     primaryColorLight: const Color(0xffffcdd2),
//     primaryColorDark: const Color(0xffd32f2f),
//     accentColor: const Color(0xfff44336),
//     accentColorBrightness: Brightness.dark,
//     canvasColor: const Color(0xfffafafa),
//     scaffoldBackgroundColor: const Color(0xfffafafa),
//     bottomAppBarColor: const Color(0xffffffff),
//     cardColor: const Color(0xffffffff),
//     dividerColor: const Color(0x1f000000),
//     highlightColor: const Color(0x66bcbcbc),
//     splashColor: const Color(0x66c8c8c8),
//     selectedRowColor: const Color(0xfff5f5f5),
//     unselectedWidgetColor: const Color(0x8a000000),
//     disabledColor: const Color(0x61000000),
//     buttonColor: const Color(0xffe0e0e0),
//     toggleableActiveColor: const Color(0xffe53935),
//     secondaryHeaderColor: const Color(0xffffebee),
//     backgroundColor: const Color(0xffef9a9a),
//     dialogBackgroundColor: const Color(0xffffffff),
//     indicatorColor: const Color(0xfff44336),
//     hintColor: const Color(0x8a000000),
//     errorColor: const Color(0xffd32f2f),
//     buttonTheme: const ButtonThemeData(
//       textTheme: ButtonTextTheme.normal,
//       minWidth: 88,
//       height: 36,
//       padding: EdgeInsets.only(top: 0, bottom: 0, left: 16, right: 16),
//       shape: RoundedRectangleBorder(
//         side: BorderSide(
//           color: Color(0xff000000),
//           width: 0,
//           style: BorderStyle.none,
//         ),
//         borderRadius: BorderRadius.all(Radius.circular(2.0)),
//       ),
//       alignedDropdown: false,
//       buttonColor: Color(0xffe0e0e0),
//       disabledColor: Color(0x61000000),
//       highlightColor: Color(0x29000000),
//       splashColor: Color(0x1f000000),
//       focusColor: Color(0x1f000000),
//       hoverColor: Color(0x0a000000),
//       colorScheme: ColorScheme(
//         primary: Color(0xfff44336),
//         primaryVariant: Color(0xffd32f2f),
//         secondary: Color(0xfff44336),
//         secondaryVariant: Color(0xffd32f2f),
//         surface: Color(0xffffffff),
//         background: Color(0xffef9a9a),
//         error: Color(0xffd32f2f),
//         onPrimary: Color(0xffffffff),
//         onSecondary: Color(0xffffffff),
//         onSurface: Color(0xff000000),
//         onBackground: Color(0xffffffff),
//         onError: Color(0xffffffff),
//         brightness: Brightness.light,
//       ),
//     ),
//     textTheme: const TextTheme(
//       display4: TextStyle(
//         color: Color(0x8a000000),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       display3: TextStyle(
//         color: Color(0x8a000000),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       display2: TextStyle(
//         color: Color(0x8a000000),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       display1: TextStyle(
//         color: Color(0x8a000000),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       headline: TextStyle(
//         color: Color(0xdd000000),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       title: TextStyle(
//         color: Color(0xdd000000),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       subhead: TextStyle(
//         color: Color(0xdd000000),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       body2: TextStyle(
//         color: Color(0xdd000000),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       body1: TextStyle(
//         color: Color(0xdd000000),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       caption: TextStyle(
//         color: Color(0x8a000000),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       button: TextStyle(
//         color: Color(0xdd000000),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       overline: TextStyle(
//         color: Color(0xff000000),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//     ),
//     primaryTextTheme: TextTheme(
//       headline1: TextStyle(
//         color: Color(0xb3ffffff),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       headline2: TextStyle(
//         color: Color(0xb3ffffff),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       headline3: TextStyle(
//         color: Color(0xb3ffffff),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       headline4: TextStyle(
//         color: Color(0xb3ffffff),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       headline5: TextStyle(
//         color: Color(0xffffffff),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       headline6: TextStyle(
//         color: Color(0xffffffff),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       subtitle1: TextStyle(
//         color: Color(0xffffffff),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       bodyText1: TextStyle(
//         color: Color(0xffffffff),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       bodyText2: TextStyle(
//         color: Color(0xffffffff),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       caption: TextStyle(
//         color: Color(0xb3ffffff),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       button: TextStyle(
//         color: Color(0xffffffff),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       subtitle2: TextStyle(
//         color: Color(0xffffffff),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       overline: TextStyle(
//         color: Color(0xffffffff),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//     ),
//     accentTextTheme: const TextTheme(
//       headline1: TextStyle(
//         color: Color(0xb3ffffff),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       headline2: TextStyle(
//         color: Color(0xb3ffffff),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       headline3: TextStyle(
//         color: Color(0xb3ffffff),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       headline4: TextStyle(
//         color: Color(0xb3ffffff),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       headline5: TextStyle(
//         color: Color(0xffffffff),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       headline6: TextStyle(
//         color: Color(0xffffffff),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       subtitle1: TextStyle(
//         color: Color(0xffffffff),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       bodyText1: TextStyle(
//         color: Color(0xffffffff),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       bodyText2: TextStyle(
//         color: Color(0xffffffff),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       caption: TextStyle(
//         color: Color(0xb3ffffff),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       button: TextStyle(
//         color: Color(0xffffffff),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       subtitle2: TextStyle(
//         color: Color(0xffffffff),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       overline: TextStyle(
//         color: Color(0xffffffff),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//     ),
//     inputDecorationTheme: const InputDecorationTheme(
//       labelStyle: TextStyle(
//         color: Color(0xdd000000),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       helperStyle: TextStyle(
//         color: Color(0xdd000000),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       hintStyle: TextStyle(
//         color: Color(0xdd000000),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       errorStyle: TextStyle(
//         color: Color(0xdd000000),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       errorMaxLines: null,
//       isDense: false,
//       contentPadding: EdgeInsets.only(top: 12, bottom: 12, left: 0, right: 0),
//       isCollapsed: false,
//       prefixStyle: TextStyle(
//         color: Color(0xdd000000),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       suffixStyle: TextStyle(
//         color: Color(0xdd000000),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       counterStyle: TextStyle(
//         color: Color(0xdd000000),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       filled: false,
//       fillColor: Color(0x00000000), floatingLabelBehavior: FloatingLabelBehavior.auto,
//       errorBorder: UnderlineInputBorder(
//         borderSide: BorderSide(
//           color: Color(0xff000000),
//           width: 1,
//           style: BorderStyle.solid,
//         ),
//         borderRadius: BorderRadius.all(Radius.circular(4.0)),
//       ),
//       focusedBorder: UnderlineInputBorder(
//         borderSide: BorderSide(
//           color: Color(0xff000000),
//           width: 1,
//           style: BorderStyle.solid,
//         ),
//         borderRadius: BorderRadius.all(Radius.circular(4.0)),
//       ),
//       focusedErrorBorder: UnderlineInputBorder(
//         borderSide: BorderSide(
//           color: Color(0xff000000),
//           width: 1,
//           style: BorderStyle.solid,
//         ),
//         borderRadius: BorderRadius.all(Radius.circular(4.0)),
//       ),
//       disabledBorder: UnderlineInputBorder(
//         borderSide: BorderSide(
//           color: Color(0xff000000),
//           width: 1,
//           style: BorderStyle.solid,
//         ),
//         borderRadius: BorderRadius.all(Radius.circular(4.0)),
//       ),
//       enabledBorder: UnderlineInputBorder(
//         borderSide: BorderSide(
//           color: Color(0xff000000),
//           width: 1,
//           style: BorderStyle.solid,
//         ),
//         borderRadius: BorderRadius.all(Radius.circular(4.0)),
//       ),
//       border: UnderlineInputBorder(
//         borderSide: BorderSide(
//           color: Color(0xff000000),
//           width: 1,
//           style: BorderStyle.solid,
//         ),
//         borderRadius: BorderRadius.all(Radius.circular(4.0)),
//       ),
//     ),
//     iconTheme: IconThemeData(
//       color: Color(0xdd000000),
//       opacity: 1,
//       size: 24,
//     ),
//     primaryIconTheme: IconThemeData(
//       color: Color(0xffffffff),
//       opacity: 1,
//       size: 24,
//     ),
//     accentIconTheme: IconThemeData(
//       color: Color(0xffffffff),
//       opacity: 1,
//       size: 24,
//     ),
//     sliderTheme: const SliderThemeData(
//       activeTrackColor: null,
//       inactiveTrackColor: null,
//       disabledActiveTrackColor: null,
//       disabledInactiveTrackColor: null,
//       activeTickMarkColor: null,
//       inactiveTickMarkColor: null,
//       disabledActiveTickMarkColor: null,
//       disabledInactiveTickMarkColor: null,
//       thumbColor: null,
//       disabledThumbColor: null,
//       thumbShape: null,
//       overlayColor: null,
//       valueIndicatorColor: null,
//       valueIndicatorShape: null,
//       showValueIndicator: null,
//       valueIndicatorTextStyle: TextStyle(
//         color: Color(0xffffffff),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//     ),
//     tabBarTheme: const TabBarTheme(
//       indicatorSize: TabBarIndicatorSize.tab,
//       labelColor: Color(0xffffffff),
//       unselectedLabelColor: Color(0xb2ffffff),
//     ),
//     chipTheme: const ChipThemeData(
//       backgroundColor: Color(0x1f000000),
//       brightness: Brightness.light,
//       deleteIconColor: Color(0xde000000),
//       disabledColor: Color(0x0c000000),
//       labelPadding: EdgeInsets.only(top: 0, bottom: 0, left: 8, right: 8),
//       labelStyle: TextStyle(
//         color: Color(0xde000000),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       padding: EdgeInsets.only(top: 4, bottom: 4, left: 4, right: 4),
//       secondaryLabelStyle: TextStyle(
//         color: Color(0x3d000000),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       secondarySelectedColor: Color(0x3df44336),
//       selectedColor: Color(0x3d000000),
//       shape: StadiumBorder(
//           side: BorderSide(
//         color: Color(0xff000000),
//         width: 0,
//         style: BorderStyle.none,
//       )),
//     ),
//     dialogTheme: DialogTheme(
//         shape: RoundedRectangleBorder(
//       side: BorderSide(
//         color: Color(0xff000000),
//         width: 0,
//         style: BorderStyle.none,
//       ),
//       borderRadius: BorderRadius.all(Radius.circular(0.0)),
//     )),
//     textSelectionTheme: TextSelectionThemeData(
//       cursorColor: Color(0xff4285f4),
//       selectionColor: Color(0xffef9a9a),
//       selectionHandleColor: Color(0xffe57373),
//     ),
//     // brightness: Brightness.light,
//     // fontFamily: font1,
//     // scaffoldBackgroundColor: _lightBackgroundColor,
//     // floatingActionButtonTheme: const FloatingActionButtonThemeData(
//     //   backgroundColor: _lightPrimaryColor,
//     //   foregroundColor: Colors.white
//     // ),
//     // appBarTheme: const AppBarTheme(
//     //   color: _lightBackgroundAppBarColor,
//     //   iconTheme: IconThemeData(color: _lightPrimaryColor),
//     //   textTheme: _lightTextTheme,
//     // ),
//     // colorScheme: const ColorScheme.light(
//     //   primary: _lightPrimaryColor,
//     //   primaryVariant: _lightBackgroundColor,
//     //   // secondary: _lightSecondaryColor,
//     // ),
//     // snackBarTheme: const SnackBarThemeData(
//     //     backgroundColor: _lightBackgroundAlertColor,
//     //     actionTextColor: _lightBackgroundActionTextColor),
//     // iconTheme: const IconThemeData(
//     //   color: _lightIconColor,
//     // ),
//     // popupMenuTheme:
//     //     const PopupMenuThemeData(color: _lightBackgroundColor, elevation: 10),
//     // textTheme: _lightTextTheme,
//     // buttonTheme: ButtonThemeData(
//     //     shape: RoundedRectangleBorder(
//     //       borderRadius: BorderRadius.circular(8),
//     //     ),
//     //     buttonColor: _lightPrimaryColor,
//     //     textTheme: ButtonTextTheme.primary),
//     // unselectedWidgetColor: _lightPrimaryColor,
//     // inputDecorationTheme: const InputDecorationTheme(
//     //   //prefixStyle: TextStyle(color: _lightIconColor),
//     //   border: OutlineInputBorder(
//     //       borderRadius: BorderRadius.all(
//     //     Radius.circular(8.0),
//     //   )),
//     //   enabledBorder: OutlineInputBorder(
//     //     borderSide: BorderSide(color: _lightBorderColor),
//     //     borderRadius: BorderRadius.all(Radius.circular(8.0)),
//     //   ),
//     //   focusedBorder: OutlineInputBorder(
//     //     borderSide: BorderSide(color: _lightBorderActiveColor),
//     //     borderRadius: BorderRadius.all(Radius.circular(8.0)),
//     //   ),
//     //   errorBorder: OutlineInputBorder(
//     //     borderSide: BorderSide(color: _lightBorderErrorColor),
//     //     borderRadius: BorderRadius.all(Radius.circular(8.0)),
//     //   ),
//     //   focusedErrorBorder: OutlineInputBorder(
//     //     borderSide: BorderSide(color: _lightBorderErrorColor),
//     //     borderRadius: BorderRadius.all(Radius.circular(8.0)),
//     //   ),
//     //   fillColor: _lightBackgroundSecondaryColor,

//     //   //focusColor: _lightBorderActiveColor,
//     // ), textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.grey[300]),
//   );

// //text theme for dark theme
//   /*static final TextStyle _darkScreenHeadingTextStyle =
//       _lightScreenHeadingTextStyle.copyWith(color: _darkTextColor);
//   static final TextStyle _darkScreenTaskNameTextStyle =
//       _lightScreenTaskNameTextStyle.copyWith(color: _darkTextColor);
//   static final TextStyle _darkScreenTaskDurationTextStyle =
//       _lightScreenTaskDurationTextStyle;
//   static final TextStyle _darkScreenButtonTextStyle = TextStyle(
//       fontSize: 14.0, color: _darkTextColor, fontWeight: FontWeight.w500);
//   static final TextStyle _darkScreenCaptionTextStyle = TextStyle(
//       fontSize: 12.0,
//       color: _darkBackgroundAppBarColor,
//       fontWeight: FontWeight.w100);*/

//   static const TextTheme _darkTextTheme = TextTheme(
//     headline1: TextStyle(
//         fontSize: 96.0,
//         color: _darkTextColor,
//         letterSpacing: -1.5,
//         fontWeight: AppFontWeight.light),
//     headline2: TextStyle(
//         fontSize: 60.0,
//         color: _darkTextColor,
//         letterSpacing: -0.5,
//         fontWeight: AppFontWeight.light),
//     headline3: TextStyle(
//         fontSize: 48.0,
//         color: _darkTextColor,
//         letterSpacing: 0,
//         fontWeight: AppFontWeight.regular),
//     headline4: TextStyle(
//         fontSize: 34.0,
//         color: _darkTextColor,
//         letterSpacing: 0.25,
//         fontWeight: AppFontWeight.regular),
//     headline5: TextStyle(
//         fontSize: 24.0,
//         color: _darkTextColor,
//         letterSpacing: 0,
//         fontWeight: AppFontWeight.regular),
//     headline6: TextStyle(
//         fontSize: 20.0,
//         color: _darkTextColor,
//         letterSpacing: 0.15,
//         fontWeight: AppFontWeight.medium),
//     bodyText1: TextStyle(
//         fontSize: 16.0,
//         color: _darkTextColor,
//         letterSpacing: 0.5,
//         fontWeight: AppFontWeight.regular),
//     bodyText2: TextStyle(
//         fontSize: 14.0,
//         color: _greyColor,
//         letterSpacing: 0.25,
//         fontWeight: AppFontWeight.regular),
//     button: TextStyle(
//       fontSize: 14.0,
//       color: _darkTextColor,
//       fontWeight: AppFontWeight.medium,
//       letterSpacing: 1.25,
//     ),
//     subtitle1: TextStyle(
//         fontSize: 16.0,
//         color: _darkTextColor,
//         letterSpacing: 0.15,
//         fontWeight: AppFontWeight.regular),
//     subtitle2: TextStyle(
//         fontSize: 14.0,
//         color: _darkTextColor,
//         letterSpacing: 0.1,
//         fontWeight: AppFontWeight.medium),
//     caption: TextStyle(
//         fontSize: 12.0,
//         color: _darkCaptionColor,
//         letterSpacing: 0.4,
//         fontWeight: AppFontWeight.regular),
//   );

//   //the dark theme
//   static final ThemeData darkTheme = ThemeData(
//     primarySwatch: const MaterialColor(4280361249, {
//       50: Color(0xfff2f2f2),
//       100: Color(0xffe6e6e6),
//       200: Color(0xffcccccc),
//       300: Color(0xffb3b3b3),
//       400: Color(0xff999999),
//       500: Color(0xff808080),
//       600: Color(0xff666666),
//       700: Color(0xff4d4d4d),
//       800: Color(0xff333333),
//       900: Color(0xff191919)
//     }),
//     brightness: Brightness.dark,
//     primaryColor: const Color(0xff212121),
//     primaryColorBrightness: Brightness.dark,
//     primaryColorLight: const Color(0xff9e9e9e),
//     primaryColorDark:const  Color(0xff000000),
//     accentColor: const Color(0xff64ffda),
//     accentColorBrightness: Brightness.light,
//     canvasColor: const Color(0xff303030),
//     scaffoldBackgroundColor: const Color(0xff303030),
//     bottomAppBarColor: const Color(0xff424242),
//     cardColor: const Color(0xff424242),
//     dividerColor: const Color(0x1fffffff),
//     highlightColor: const Color(0x40cccccc),
//     splashColor: const Color(0x40cccccc),
//     selectedRowColor:const  Color(0xfff5f5f5),
//     unselectedWidgetColor: const Color(0xb3ffffff),
//     disabledColor: const Color(0x62ffffff),
//     buttonColor: const Color(0xff546e7a),
//     toggleableActiveColor: const Color(0xff64ffda),
//     secondaryHeaderColor: const Color(0xff616161),
//     backgroundColor: const Color(0xff616161),
//     dialogBackgroundColor: const Color(0xff424242),
//     indicatorColor: const Color(0xff64ffda),
//     hintColor: const Color(0x80ffffff),
//     errorColor: const Color(0xffd32f2f),
//     buttonTheme: const ButtonThemeData(
//       textTheme: ButtonTextTheme.normal,
//       minWidth: 88,
//       height: 36,
//       padding: EdgeInsets.only(top: 0, bottom: 0, left: 16, right: 16),
//       shape: RoundedRectangleBorder(
//         side: BorderSide(
//           color: Color(0xff000000),
//           width: 0,
//           style: BorderStyle.none,
//         ),
//         borderRadius: BorderRadius.all(Radius.circular(2.0)),
//       ),
//       alignedDropdown: false,
//       buttonColor: Color(0xff546e7a),
//       disabledColor: Color(0x61ffffff),
//       highlightColor: Color(0x29ffffff),
//       splashColor: Color(0x1fffffff),
//       focusColor: Color(0x1fffffff),
//       hoverColor: Color(0x0affffff),
//       colorScheme: ColorScheme(
//         primary: Color(0xff607d8b),
//         primaryVariant: Color(0xff000000),
//         secondary: Color(0xff64ffda),
//         secondaryVariant: Color(0xff00bfa5),
//         surface: Color(0xff424242),
//         background: Color(0xff616161),
//         error: Color(0xffd32f2f),
//         onPrimary: Color(0xffffffff),
//         onSecondary: Color(0xff000000),
//         onSurface: Color(0xffffffff),
//         onBackground: Color(0xffffffff),
//         onError: Color(0xff000000),
//         brightness: Brightness.dark,
//       ),
//     ),
//     textTheme: const TextTheme(
//       headline1: TextStyle(
//         color: Color(0xb3ffffff),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       headline2: TextStyle(
//         color: Color(0xb3ffffff),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       headline3: TextStyle(
//         color: Color(0xb3ffffff),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       headline4: TextStyle(
//         color: Color(0xb3ffffff),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       headline5: TextStyle(
//         color: Color(0xffffffff),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       headline6: TextStyle(
//         color: Color(0xffffffff),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       subtitle1: TextStyle(
//         color: Color(0xffffffff),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       bodyText1: TextStyle(
//         color: Color(0xffffffff),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       bodyText2: TextStyle(
//         color: Color(0xffffffff),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       caption: TextStyle(
//         color: Color(0xb3ffffff),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       button: TextStyle(
//         color: Color(0xffffffff),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       subtitle2: TextStyle(
//         color: Color(0xffffffff),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       overline: TextStyle(
//         color: Color(0xffffffff),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//     ),
//     primaryTextTheme:const  TextTheme(
//       headline1: TextStyle(
//         color: Color(0xb3ffffff),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       headline2: TextStyle(
//         color: Color(0xb3ffffff),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       headline3: TextStyle(
//         color: Color(0xb3ffffff),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       headline4: TextStyle(
//         color: Color(0xb3ffffff),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       headline5: TextStyle(
//         color: Color(0xffffffff),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       headline6: TextStyle(
//         color: Color(0xffffffff),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       subtitle1: TextStyle(
//         color: Color(0xffffffff),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       bodyText1: TextStyle(
//         color: Color(0xffffffff),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       bodyText2: TextStyle(
//         color: Color(0xffffffff),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       caption: TextStyle(
//         color: Color(0xb3ffffff),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       button: TextStyle(
//         color: Color(0xffffffff),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       subtitle2: TextStyle(
//         color: Color(0xffffffff),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       overline: TextStyle(
//         color: Color(0xffffffff),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//     ),
//     accentTextTheme:const  TextTheme(
//       headline1: TextStyle(
//         color: Color(0x8a000000),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       headline2: TextStyle(
//         color: Color(0x8a000000),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       headline3: TextStyle(
//         color: Color(0x8a000000),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       headline4: TextStyle(
//         color: Color(0x8a000000),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       headline5: TextStyle(
//         color: Color(0xdd000000),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       headline6: TextStyle(
//         color: Color(0xdd000000),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       subtitle1: TextStyle(
//         color: Color(0xdd000000),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       bodyText1: TextStyle(
//         color: Color(0xdd000000),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       bodyText2: TextStyle(
//         color: Color(0xdd000000),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       caption: TextStyle(
//         color: Color(0x8a000000),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       button: TextStyle(
//         color: Color(0xdd000000),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       subtitle2: TextStyle(
//         color: Color(0xff000000),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       overline: TextStyle(
//         color: Color(0xff000000),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//     ),
//     inputDecorationTheme:const  InputDecorationTheme(
//       labelStyle: TextStyle(
//         color: Color(0xffffffff),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       helperStyle: TextStyle(
//         color: Color(0xffffffff),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       hintStyle: TextStyle(
//         color: Color(0xffffffff),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       errorStyle: TextStyle(
//         color: Color(0xffffffff),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       errorMaxLines: null,
//       isDense: false,
//       contentPadding: EdgeInsets.only(top: 12, bottom: 12, left: 0, right: 0),
//       isCollapsed: false,
//       prefixStyle: TextStyle(
//         color: Color(0xffffffff),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       suffixStyle: TextStyle(
//         color: Color(0xffffffff),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       counterStyle: TextStyle(
//         color: Color(0xffffffff),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       filled: false,
//       fillColor: Color(0x00000000), floatingLabelBehavior: FloatingLabelBehavior.auto,
//       errorBorder: UnderlineInputBorder(
//         borderSide: BorderSide(
//           color: Color(0xff000000),
//           width: 1,
//           style: BorderStyle.solid,
//         ),
//         borderRadius: BorderRadius.all(Radius.circular(4.0)),
//       ),
//       focusedBorder: UnderlineInputBorder(
//         borderSide: BorderSide(
//           color: Color(0xff000000),
//           width: 1,
//           style: BorderStyle.solid,
//         ),
//         borderRadius: BorderRadius.all(Radius.circular(4.0)),
//       ),
//       focusedErrorBorder: UnderlineInputBorder(
//         borderSide: BorderSide(
//           color: Color(0xff000000),
//           width: 1,
//           style: BorderStyle.solid,
//         ),
//         borderRadius: BorderRadius.all(Radius.circular(4.0)),
//       ),
//       disabledBorder: UnderlineInputBorder(
//         borderSide: BorderSide(
//           color: Color(0xff000000),
//           width: 1,
//           style: BorderStyle.solid,
//         ),
//         borderRadius: BorderRadius.all(Radius.circular(4.0)),
//       ),
//       enabledBorder: UnderlineInputBorder(
//         borderSide: BorderSide(
//           color: Color(0xff000000),
//           width: 1,
//           style: BorderStyle.solid,
//         ),
//         borderRadius: BorderRadius.all(Radius.circular(4.0)),
//       ),
//       border: UnderlineInputBorder(
//         borderSide: BorderSide(
//           color: Color(0xff000000),
//           width: 1,
//           style: BorderStyle.solid,
//         ),
//         borderRadius: BorderRadius.all(Radius.circular(4.0)),
//       ),
//     ),
//     iconTheme: const IconThemeData(
//       color: Color(0xffffffff),
//       opacity: 1,
//       size: 24,
//     ),
//     primaryIconTheme: const IconThemeData(
//       color: Color(0xffffffff),
//       opacity: 1,
//       size: 24,
//     ),
//     accentIconTheme: const IconThemeData(
//       color: Color(0xff000000),
//       opacity: 1,
//       size: 24,
//     ),
//     sliderTheme: const SliderThemeData(
//       activeTrackColor: null,
//       inactiveTrackColor: null,
//       disabledActiveTrackColor: null,
//       disabledInactiveTrackColor: null,
//       activeTickMarkColor: null,
//       inactiveTickMarkColor: null,
//       disabledActiveTickMarkColor: null,
//       disabledInactiveTickMarkColor: null,
//       thumbColor: null,
//       disabledThumbColor: null,
//       thumbShape: null,
//       overlayColor: null,
//       valueIndicatorColor: null,
//       valueIndicatorShape: null,
//       showValueIndicator: null,
//       valueIndicatorTextStyle: TextStyle(
//         color: Color(0xdd000000),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//     ),
//     tabBarTheme: const TabBarTheme(
//       indicatorSize: TabBarIndicatorSize.tab,
//       labelColor: Color(0xffffffff),
//       unselectedLabelColor: Color(0xb2ffffff),
//     ),
//     chipTheme: const ChipThemeData(
//       backgroundColor: Color(0x1fffffff),
//       brightness: Brightness.dark,
//       deleteIconColor: Color(0xdeffffff),
//       disabledColor: Color(0x0cffffff),
//       labelPadding: EdgeInsets.only(top: 0, bottom: 0, left: 8, right: 8),
//       labelStyle: TextStyle(
//         color: Color(0xdeffffff),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       padding: EdgeInsets.only(top: 4, bottom: 4, left: 4, right: 4),
//       secondaryLabelStyle: TextStyle(
//         color: Color(0x3dffffff),
//         fontSize: null,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.normal,
//       ),
//       secondarySelectedColor: Color(0x3d212121),
//       selectedColor: Color(0x3dffffff),
//       shape: StadiumBorder(
//           side: BorderSide(
//         color: Color(0xff000000),
//         width: 0,
//         style: BorderStyle.none,
//       )),
//     ),
//     dialogTheme: const DialogTheme(
//         shape: RoundedRectangleBorder(
//       side: BorderSide(
//         color: Color(0xff000000),
//         width: 0,
//         style: BorderStyle.none,
//       ),
//       borderRadius: BorderRadius.all(Radius.circular(0.0)),
//     )), textSelectionTheme: TextSelectionThemeData(cursorColor: Color(0xff4285f4), selectionColor: const Color(0xff64ffda), selectionHandleColor: Color(0xff1de9b6),),
//     // brightness: Brightness.dark,
//     // //primarySwatch: _darkPrimaryColor, //cant be Color on MaterialColor so it can compute different shades.
//     // accentColor: _darkPrimaryColor, //prefix icon color form input on focus
//     // fontFamily: font1,
//     // scaffoldBackgroundColor: _darkBackgroundColor,
//     // floatingActionButtonTheme: const FloatingActionButtonThemeData(
//     //   backgroundColor: _darkPrimaryColor,
//     // ),
//     // appBarTheme: const AppBarTheme(
//     //   color: _darkBackgroundAppBarColor,
//     //   iconTheme: IconThemeData(color: _darkTextColor),
//     //   textTheme: _darkTextTheme,
//     // ),
//     // colorScheme: const ColorScheme.dark(
//     //   primary: _darkPrimaryColor,
//     //   primaryVariant: _darkBackgroundColor,

//     //   // secondary: _darkSecondaryColor,
//     // ),
//     // snackBarTheme: const SnackBarThemeData(
//     //     contentTextStyle: TextStyle(color: Colors.white),
//     //     backgroundColor: _darkBackgroundAlertColor,
//     //     actionTextColor: _darkBackgroundActionTextColor),
//     // iconTheme: const IconThemeData(
//     //   color: _darkIconColor, //_darkIconColor,
//     // ),
//     // popupMenuTheme: const PopupMenuThemeData(
//     //   color: _darkBackgroundAppBarColor,
//     // ),
//     // textTheme: _darkTextTheme,
//     // buttonTheme: ButtonThemeData(
//     //     shape: RoundedRectangleBorder(
//     //       borderRadius: BorderRadius.circular(8),
//     //     ),
//     //     buttonColor: _darkPrimaryColor,
//     //     textTheme: ButtonTextTheme.primary),
//     // unselectedWidgetColor: _darkPrimaryColor,
//     // canvasColor: _lightBackgroundAlertColor,
//     // inputDecorationTheme: const InputDecorationTheme(
//     //   prefixStyle: TextStyle(color: _darkIconColor),
//     //   labelStyle: TextStyle(color: nevada),
//     //   border: OutlineInputBorder(
//     //       borderRadius: BorderRadius.all(
//     //     Radius.circular(8.0),
//     //   )),
//     //   enabledBorder: OutlineInputBorder(
//     //     borderSide: BorderSide(color: _darkBorderColor),
//     //     borderRadius: BorderRadius.all(Radius.circular(8.0)),
//     //   ),
//     //   focusedBorder: OutlineInputBorder(
//     //     borderSide: BorderSide(color: _darkBorderActiveColor),
//     //     borderRadius: BorderRadius.all(Radius.circular(8.0)),
//     //   ),
//     //   errorBorder: OutlineInputBorder(
//     //     borderSide: BorderSide(color: _darkBorderErrorColor),
//     //     borderRadius: BorderRadius.all(Radius.circular(8.0)),
//     //   ),
//     //   focusedErrorBorder: OutlineInputBorder(
//     //     borderSide: BorderSide(color: _darkBorderErrorColor),
//     //     borderRadius: BorderRadius.all(Radius.circular(8.0)),
//     //   ),
//     //   fillColor: _darkInputFillColor,
//     //   //focusColor: _darkBorderActiveColor,
//     // ),
//   );
// }
