import 'package:dsc_tools/ui/screens/open_po/home/components/app_bar_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../controllers/language_controller.dart';
import '../../../../../utilities/images.dart';

class PlainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBarController controller = Get.put(AppBarController());
  final LanguageController languageController = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 40,
      leading: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: SvgPicture.asset(kUserIcon, height: 20),
      ),
      title: SvgPicture.asset(kUnicityDscImage, fit: BoxFit.cover),
      actions: [
        GestureDetector(
          onTap: () => controller.showPopupMenu(context),
          child: SizedBox(
            width: 100,
            child: Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.all(10.0),
              child: Text(
                languageController.currentOption.title,
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
