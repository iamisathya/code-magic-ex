import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/global_controllers.dart';
import '../../../data/provider/globals.dart';
import '../../data/model/country_info.dart';
import '../../widgets/page_title.dart';
import '../open_po/order_create/component/app_bar.dart';

class SettingsPage extends StatelessWidget {
  final ThemeController themeController = Get.put(ThemeController());
  final LanguageController languageController = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OpenPoAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            PageTitle(title: "settings".tr),
            ListTile(
              contentPadding: const EdgeInsets.all(8),
              minVerticalPadding: 10,
              title: Text(
                "dark_mode".tr,
              ),
              subtitle: Text(
                "enable_or_disable_dark_mode".tr,
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
              subtitle: Text(
                "change_app_language".tr,
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
                  await languageController.updateLanguage(option!.iso);
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
