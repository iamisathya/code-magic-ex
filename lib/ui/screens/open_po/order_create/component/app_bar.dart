import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../controllers/language_controller.dart';
import '../../../../../utilities/images.dart';
import '../../../profile/profile.dart';
import '../controller/app_bar_controller.dart';

class OpenPoAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBarController controller = Get.put(AppBarController());
  final LanguageController languageController = Get.put(LanguageController());

  OpenPoAppBar({this.leading = "back", this.showNotification = false});

  final String leading;
  final bool showNotification;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading == "profile"
          ? GestureDetector(
              onTap: () => Get.toNamed(UserProfileScreen.routeName),
              child: SvgPicture.asset(kUserProfileIcon,
                  width: 20, fit: BoxFit.scaleDown))
          : leading == "empty"
              ? const SizedBox()
              : IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(Icons.arrow_back_ios_new_outlined)),
      centerTitle: false,
      titleSpacing: 0.0,
      title: SvgPicture.asset(kUnicityLogoGradientImage, fit: BoxFit.cover),
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
        ),
        if (showNotification)
          IconButton(
              onPressed: controller.onPressNotification,
              icon: const Icon(Icons.notifications_none_outlined)),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}
