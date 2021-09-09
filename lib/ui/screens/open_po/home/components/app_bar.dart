import 'package:dsc_tools/controllers/language_controller.dart';
import 'package:dsc_tools/utilities/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'app_bar_controller.dart';

class OpenPoAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBarController controller = Get.put(AppBarController());
  final LanguageController languageController = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    final String iconPath =
        "assets/icons/languages/${languageController.currentOption.icon}";
    return AppBar(
      centerTitle: false,
      titleSpacing: 0.0,
      title: Image.asset(kUnicityGradientImage, fit: BoxFit.cover),
      actions: [
        GestureDetector(
          onTap: () => controller.showPopupMenu(context),
          child: SizedBox(
            width: 65,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    languageController.currentOption.value.toUpperCase(),
                    style: const TextStyle(color: Colors.black, fontSize: 14),
                  ),
                ),
                SvgPicture.asset(iconPath,
                    height: 20, semanticsLabel: "change language"),
              ],
            ),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}
