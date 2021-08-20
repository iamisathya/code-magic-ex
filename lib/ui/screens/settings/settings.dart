import 'package:code_magic_ex/constants/globals.dart';
import 'package:code_magic_ex/controllers/global_controllers.dart';
import 'package:code_magic_ex/controllers/theme_controller.dart';
import 'package:code_magic_ex/models/menu_option_model.dart';
import 'package:code_magic_ex/ui/global/widgets/transparent_app_bar.dart';
import 'package:code_magic_ex/utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SettingsPage extends StatelessWidget {
  static const String routeName = '/settings';

  final ThemeController themeController = Get.put(ThemeController());
  final LanguageController languageController = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {    
    return Scaffold(
      appBar: const TransAppBar(
        title: "Settings",
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            ListTile(
              contentPadding: const EdgeInsets.all(8),
              minVerticalPadding: 10,
              title: const Text(
                "Dark Mode",
              ),
              subtitle: const Text(
                "Enable/Disable dark mode",
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
              title: const Text(
                "Language",
              ),
              subtitle: const Text(
                "Change app language",
              ),
              trailing: DropdownButton<MenuOptionsModel>(
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
                items: Globals.languageOptions
                    .map<DropdownMenuItem<MenuOptionsModel>>((MenuOptionsModel option) {
                  return DropdownMenuItem<MenuOptionsModel>(
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
