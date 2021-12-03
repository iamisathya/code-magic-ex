import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/globals.dart';
import '../../../controllers/global_controllers.dart';
import '../../../controllers/theme_controller.dart';
import '../../../models/country_info.dart';
import '../../global/widgets/transparent_app_bar.dart';

class SettingsPage extends StatelessWidget {
  static const String routeName = '/settings';

  final ThemeController themeController = Get.put(ThemeController());
  final LanguageController languageController = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TransAppBar(
        title: "settings".tr,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            ListTile(
              contentPadding: const EdgeInsets.all(8),
              minVerticalPadding: 10,
              title: Text(
                "dark_mode".tr,
              ),
              subtitle: const Text(
                "Enable/Disable dark mode",  //! hardcoded
              ),
              trailing: CupertinoSwitch(
                value: themeController.currentTheme == "dark",
                onChanged: (value) {
                  themeController.setThemeMode(value ? "dark" : "light");
                },
              ),
            ),
            ListTile(
              contentPadding: const EdgeInsets.all(8),
              minVerticalPadding: 10,
              title: Text(
                "language".tr,
              ),
              subtitle: const Text(
                "Change app language", //! hardcoded
              ),
              trailing: DropdownButton<Languages>(
                value: languageController.currentOption,
                icon: const Icon(Icons.arrow_drop_down),
                iconSize: 36,
                elevation: 16,
                underline: Container(
                  height: 0,
                ),
                onChanged: (option) async {
                  await languageController.updateLanguage(option!.value);
                  Get.forceAppUpdate();
                },
                items: Globals.currentMarket!.languages
                    .map<DropdownMenuItem<Languages>>((Languages option) {
                  return DropdownMenuItem<Languages>(
                    value: option,
                    child: Text(option.title),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
