import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../utilities/enums.dart';
import '../../../../utilities/images.dart';
import '../../../global/theme/text_view.dart';
import '../controller/profile.controller.dart';

class NotificationSetting extends StatelessWidget {
  final UserProfileController controller = Get.put(UserProfileController());
  NotificationSetting({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(kProfileNotificationIcon,
                    width: 44, height: 44),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: AppText(
                      text: 'notifications'.tr, style: TextTypes.headline5),
                )
              ],
            ),
            Obx(
              () => Switch.adaptive(
                  value: controller.notificationStatus.value,
                  onChanged: controller.onNotificationSwitchChange),
            ),
          ],
        ),
      ),
    );
  }
}
