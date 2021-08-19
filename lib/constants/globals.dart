import 'package:code_magic_ex/models/menu_option_model.dart';

class Globals {
  Globals._();
  static const String defaultLanguage = 'en';
//List of languages that are supported.  Used in selector.
//Follow this plugin for translating a google sheet to languages
//https://github.com/aloisdeniel/flutter_sheet_localization
//Flutter App translations google sheet
//https://docs.google.com/spreadsheets/d/1oS7iJ6ocrZBA53SxRfKF0CG9HAaXeKtzvsTBhgG4Zzk/edit?usp=sharing

  static final List<MenuOptionsModel> languageOptions = [
    MenuOptionsModel(key: "en", value: "English"), //English
    MenuOptionsModel(key: "th", value: "Thai"), //Chinese
  ];
}
