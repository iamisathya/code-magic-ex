import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../translations/localization_service.dart';
import '../../../utilities/constants.dart';
import '../../../utilities/enums.dart';
import '../../../utilities/function.dart';
import '../../../utilities/user_session.dart';
import '../../global/navigation_drawer.dart';
import '../../global/theme/bloc.dart';
import '../../global/widgets/transparent_app_bar.dart';

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

  Future<void> _changeLanguage(LocaleTypes type) async {
    // final locale = Locale(lang, 'US');
    // Get.updateLocale(locale);
    LocalizationService().changeLocale(describeEnum(type));
    // translationBloc.setappLanguageStream(lang);
    await UserSessionManager.shared.setCurrentLanguage(getLocale(type));
    Navigator.pop(context, describeEnum(type));
  }

  Future<void> _showPopupMenu(BuildContext context) async {
    final currentLang = UserSessionManager.shared.currentLanguage;
    await showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(100, 100, 0, 100),
      items: [
        PopupMenuItem<String>(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          value: "EN",
          child: ListTile(
            shape: kRoundedBorder(),
            selectedTileColor: kMainColor,
            selected: currentLang == "en",
            leading: const IconButton(
              onPressed: null,
              icon: Icon(Icons.language_outlined),
            ),
            title: const Text("English"),
            onTap: () => _changeLanguage(LocaleTypes.en),
          ),
        ),
        PopupMenuItem<String>(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          value: "TH",
          child: ListTile(
            shape: kRoundedBorder(),
            selectedTileColor: kMainColor,
            selected: currentLang == "th",
            leading: const IconButton(
              onPressed: null,
              icon: Icon(Icons.language_outlined),
            ),
            title: const Text("Thai"),
            onTap: () => _changeLanguage(LocaleTypes.th),
          ),
        )
      ],
      elevation: 8.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TransAppBar(
          title: "home".tr,
          action: <Widget>[
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
          child: Column(
            children: const [
              Text("DASHBOARD"),
            ],
          ),
        ));
  }
}

extension PopupMenuItemExtension on PopupMenuItem {}
