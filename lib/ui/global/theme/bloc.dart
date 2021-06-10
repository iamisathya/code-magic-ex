import 'package:code_magic_ex/ui/global/theme/app_theme.dart';
import 'package:code_magic_ex/utilities/user_session.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class ThemeBloc {
  final _appThemeStreamController =
      BehaviorSubject<ThemeTypes>.seeded(ThemeTypes.light);

  Stream<ThemeTypes> get appThemeStream =>
      _appThemeStreamController.stream;

  Function(ThemeTypes) get setappThemeStream => _appThemeStreamController.sink.add;

  ThemeMode get getThemeMode => _appThemeStreamController.value.toString() == "light" ? ThemeMode.light : ThemeMode.dark;
}
final themeBloc = ThemeBloc();
