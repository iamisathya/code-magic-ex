import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../../../styles/edge_insets.dart';
import '../../../../../../../ui/global/widgets/primary_button.dart';
import '../../../../../../../ui/global/widgets/primary_button_outline.dart';
import '../../../../../../utilities/images.dart';
import '../../../../../../utilities/size_config.dart';
import '../../../bloc/enroll_complete_controller.dart';
import '../../../enroll.dart';

class Body extends StatelessWidget {
  final EnrollCompleteController controller =
      Get.put(EnrollCompleteController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: Get.height,
        margin: kEdgeInset(v: 12),
        child: Column(
          children: [
            SizedBox(height: SizeConfig.screenHeight * 0.03),
            SvgPicture.asset(kImageOrderComplete,
                height: SizeConfig.screenHeight * 0.25),
            SizedBox(height: SizeConfig.screenHeight * 0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Enroll Successfull ",
                ),
                Text(
                  " #${controller.orderNumber.value}",
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "We are recived order from your, we are processing it. We'll send it to you shortly",
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: kEdgeInsetSymmetric(h: 0, v: 20),
              child: Column(
                children: [
                  Obx(() => ColumnItem(
                        title: "Order ID",
                        value: controller.orderNumber.value,
                      )),
                  Obx(() => ColumnItem(
                        title: "User ID",
                        value: controller.userId.value,
                      )),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: SizeConfig.screenWidth * 0.4,
                    child: PrimaryButton(
                      text: "Close",
                      press: () => Get.offAll(() => EnrollHomeScreen()),
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.screenWidth * 0.4,
                    child: PrimaryOutlineButton(
                        press: () => controller.viewOrder(),
                        text: "View Order"),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ColumnItem extends StatelessWidget {
  const ColumnItem({
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kEdgeInsetSymmetric(h: 12),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              title,
            ),
          ),
          const Expanded(
            child: Text(
              " : ",
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
