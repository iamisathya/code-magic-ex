import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../data/enums.dart';
import '../../../../widgets/text_view.dart';
import '../../../utils/images.dart';
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
                  onChanged: (bool val) =>
                      controller.onNotificationSwitchChange(value: val)),
            ),
          ],
        ),
      ),
    );
  }
}
