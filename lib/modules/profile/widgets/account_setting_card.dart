import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../data/enums.dart';
import '../../../../widgets/text_view.dart';
import '../../../core/values/colors.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/images.dart';
import '../controller/profile.controller.dart';

class AccountSetting extends StatelessWidget {
  final UserProfileController _controller = Get.put(UserProfileController());
  AccountSetting({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding:
                const EdgeInsets.only(top: 18, bottom: 10, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(kProfileAccountSettingIcon,
                        width: 44, height: 44),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: AppText(
                          text: 'account_setting'.tr,
                          style: TextTypes.headline5),
                    )
                  ],
                ),
              ],
            ),
          ),
          Row(
            children: [
              const SizedBox(width: 80),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                      onPressed: _controller.changeProfilePicture,
                      child: AppText(
                          text: "edit_profile_picture".tr,
                          style: TextTypes.headline6,
                          color: AppColor.dodgerBlue)),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: TextButton(
                        onPressed: () => Get.toNamed(Routes.UPDATE_EMAIL),
                        child: AppText(
                            text: "change_email".tr,
                            style: TextTypes.headline6,
                            color: AppColor.dodgerBlue)),
                  ),
                  TextButton(
                      onPressed: () => Get.toNamed(Routes.UPDATE_PASSWORD),
                      child: AppText(
                          text: "change_password".tr,
                          style: TextTypes.headline6,
                          color: AppColor.dodgerBlue))
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
