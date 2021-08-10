
import 'package:code_magic_ex/models/user_info.dart';
import 'package:code_magic_ex/ui/screens/order_entry/controllers/order_complete.dart';
import 'package:code_magic_ex/utilities/user_session.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../../../styles/edge_insets.dart';
import '../../../../../../../ui/global/theme/app_theme.dart';
import '../../../../../../../ui/global/widgets/primary_button.dart';
import '../../../../../../../ui/global/widgets/primary_button_outline.dart';
import '../../../../../../utilities/extensions.dart';
import '../../../../../../utilities/images.dart';
import '../../../../../../utilities/size_config.dart';
import '../../../order_entry.dart';

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
                    "Order Summary - ",
                    style: AppTheme.lightTheme.textTheme.headline4,
                  ),
                  Text(
                    "#${controller.orderResponse.id.unicity.retrieveOrderId()}",
                    style: AppTheme.lightTheme.textTheme.headline6,
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
                    ColumnItem(
                      title: "User ID",
                      value: info.id.unicity.toString(),
                    ),
                    ColumnItem(
                      title: "User Name",
                      value: info.humanName.fullName,
                    ),
                    ColumnItem(
                      title: "Order Number",
                      value: controller.orderResponse.id.unicity.retrieveOrderId(),
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
                        text: "View Order"),
                    PrimaryOutlineButton(
                        press: () => controller.openProductList(),
                        text: "Product List"),
                  ],
                ),
              ),
              SizedBox(
                width: SizeConfig.screenWidth * 0.6,
                child: PrimaryButton(
                  text: "Go back",
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
              style: AppTheme.lightTheme.textTheme.headline6,
            ),
          ),
          Expanded(
            child: Text(
              "   :  ",
              textAlign: TextAlign.center,
              style: AppTheme.lightTheme.textTheme.headline6,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: AppTheme.lightTheme.textTheme.headline6,
            ),
          ),
        ],
      ),
    );
  }
}
