import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../controllers/language_controller.dart';
import '../../../../../utilities/images.dart';
import 'app_bar_controller.dart';

class OpenPoAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBarController controller = Get.put(AppBarController());
  final LanguageController languageController = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      titleSpacing: 0.0,
      title: Image.asset(kUnicityGradientImage, fit: BoxFit.cover),
      actions: [
        GestureDetector(
          onTap: () => controller.showPopupMenu(context),
          child: SizedBox(
            width: 100,
            child: Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.all(10.0),
              child: Text(
                languageController.currentOption.title.toUpperCase(),
                style: const TextStyle(color: Colors.black, fontSize: 14),
                maxLines: 1,
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}
