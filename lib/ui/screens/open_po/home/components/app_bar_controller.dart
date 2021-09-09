import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../constants/globals.dart';
import '../../../../../controllers/language_controller.dart';
import '../../../../../models/country_info.dart';

class AppBarController extends GetxController {
  final LanguageController languageController = Get.put(LanguageController());

  Future<void> showPopupMenu(BuildContext context) async {
    await showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(100, 105, 0, 100),
      items: Globals.currentMarket!.languages
          .map((lang) => PopupMenuItem<String>(
                child: ListTile(
                  onTap: () => onSelectLanguage(lang, context),
                  title: Text(lang.title,
                      style: TextStyle(
                          color: languageController.currentOption.value ==
                                  lang.value
                              ? const Color(0xFF1C9CFC)
                              : const Color(0xFF000000))),
                ),
              ))
          .toList(),
      elevation: 8.0,
    );
  }

  Future<void> onSelectLanguage(Languages option, BuildContext context) async {
    await languageController.updateLanguage(option.value);
    Navigator.of(context).pop();
    Get.forceAppUpdate();
  }
}
