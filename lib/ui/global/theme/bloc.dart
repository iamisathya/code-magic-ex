import 'package:code_magic_ex/utilities/user_session.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class ThemeBloc {
   final _appThemeStreamController =
      BehaviorSubject<ThemeTypes>.seeded(ThemeTypes.light);

  Stream<ThemeTypes> get appThemeStream =>
      _appThemeStreamController.stream;

  Function(ThemeTypes) get _setappThemeStream => _appThemeStreamController.sink.add;

  ThemeMode get getThemeMode => describeEnum(_appThemeStreamController.value) == "light" ? ThemeMode.light : ThemeMode.dark;

  void get toggleThemeMode => themeBloc.getThemeMode == ThemeMode.dark ? _setappThemeStream(ThemeTypes.light) : _setappThemeStream(ThemeTypes.dark);
}
final themeBloc = ThemeBloc();
