import 'package:code_magic_ex/utilities/user_session.dart';
import 'package:flutter/material.dart';

import 'package:code_magic_ex/resources/colors.dart';
import 'package:code_magic_ex/translations/bloc.dart';
import 'package:code_magic_ex/ui/global/navigation_drawer.dart';
import 'package:code_magic_ex/ui/global/theme/bloc.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainHomeScreen extends StatefulWidget {
  static const String routeName = '/mainHomePage';

  @override
  _MainHomeScreenState createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  Future<void> _changeLanguage(String lang) async {
    translationBloc.setappLanguageStream(lang);
    Navigator.pop(context, lang);
    await UserSessionManager.shared.setCurrentLanguage(lang);
  }

  Future<void> _showPopupMenu(BuildContext context) async {
    await showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(100, 100, 0, 100),
      items: [
        PopupMenuItem<String>(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          value: "EN",
          child: ListTile(
            selectedTileColor: AppColor.COLOR_399000,
            selected: translationBloc.getCurrentLanguage == "en",
            leading: const IconButton(
              onPressed: null,
              icon: Icon(Icons.language_outlined),
            ),
            title: const Text("English"),
            onTap: () => _changeLanguage("en"),
          ),
        ),
        PopupMenuItem<String>(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          value: "TH",
          child: ListTile(
            selectedTileColor: AppColor.COLOR_399000,
            selected: translationBloc.getCurrentLanguage == "th",
            leading: const IconButton(
              onPressed: null,
              icon: Icon(Icons.language_outlined),
            ),
            title: const Text("Thai"),
            onTap: () => _changeLanguage("th"),
          ),
        )
      ],
      elevation: 8.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.mode_night_outlined,
              ),
              tooltip: 'Theme selector',
              onPressed: () => themeBloc.toggleThemeMode,
            ),
            IconButton(
              icon: const Icon(
                Icons.translate_outlined,
              ),
              tooltip: 'Theme selector',
              onPressed: () => _showPopupMenu(context),
            ),
          ],
        ),
        drawer: NavigationDrawer(),
        body: Center(
          child: Text(AppLocalizations.of(context)!.zip),
        ));
  }
}

extension PopupMenuItemExtension on PopupMenuItem {}
