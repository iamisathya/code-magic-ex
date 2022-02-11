import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../core/styles/edge_insets.dart';
import '../../../../../data/model/user_info.dart';
import '../../../../../utils/extensions.dart';
import '../../../../../utils/images.dart';
import '../../../../../utils/size_config.dart';
import '../../../../../utils/user_session.dart';
import '../../../../../widgets/primary_button.dart';
import '../../../../../widgets/primary_button_outline.dart';
import '../../../controllers/ordercomplete.controller.dart';
import '../../../orderentry.screen.dart';

class Body extends StatelessWidget {
  final OrderCompleteController controller = Get.put(OrderCompleteController());

  @override
  Widget build(BuildContext context) {
    final UserInfo info = UserSessionManager.shared.userInfo!;
    return SingleChildScrollView(
      child: Container(
        margin: kEdgeInset(v: 12),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.03),
              SvgPicture.asset(kImageOrderComplete,
                  height: SizeConfig.screenHeight * 0.25),
              SizedBox(height: SizeConfig.screenHeight * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${"order_summary".tr} - ",
                  ),
                  Text(
                    "#${controller.orderResponse.id.unicity.retrieveOrderId()}",
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "processing_order_msg".tr,
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: kEdgeInsetSymmetric(h: 0, v: 20),
                child: Column(
                  children: [
                    ColumnItem(
                      title: "user_id".tr,
                      value: info.id.unicity.toString(),
                    ),
                    ColumnItem(
                      title: "user_name".tr,
                      value: info.humanName.fullName,
                    ),
                    ColumnItem(
                      title: "order_number".tr,
                      value:
                          controller.orderResponse.id.unicity.retrieveOrderId(),
                    ),
                  ],
                ),
              ),
              Container(
                margin: kEdgeInsetTLRB(b: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    PrimaryOutlineButton(
                        press: () => controller.viewOrder(),
                        text: "vieworder".tr),
                    PrimaryOutlineButton(
                        press: () => controller.openProductList(),
                        text: "print_doc".tr),
                  ],
                ),
              ),
              SizedBox(
                width: SizeConfig.screenWidth * 0.6,
                child: PrimaryButton(
                  text: "back".tr,
                  press: () => Get.offAll(() => OrderEntryHomeScreen()),
                ),
              ),
            ],
          ),
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
      padding: kEdgeInsetSymmetric(h: 30),
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
              "   :  ",
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 2,
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
