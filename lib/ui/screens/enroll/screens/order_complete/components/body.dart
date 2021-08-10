import 'package:code_magic_ex/models/user_info.dart';
import 'package:code_magic_ex/ui/screens/enroll/bloc/enroll_complete_controller.dart';
import 'package:code_magic_ex/ui/screens/enroll/enroll.dart';
import 'package:code_magic_ex/utilities/user_session.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../../../styles/edge_insets.dart';
import '../../../../../../../ui/global/theme/app_theme.dart';
import '../../../../../../../ui/global/widgets/primary_button.dart';
import '../../../../../../../ui/global/widgets/primary_button_outline.dart';
import '../../../../../../utilities/images.dart';
import '../../../../../../utilities/size_config.dart';

class Body extends StatelessWidget {
  final EnrollCompleteController controller =
      Get.put(EnrollCompleteController());

  @override
  Widget build(BuildContext context) {
    final UserInfo info = UserSessionManager.shared.userInfo!;
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
                Text(
                  "Enroll Successfull ",
                  style: AppTheme.lightTheme.textTheme.headline4,
                ),
                Text(
                  " #${info.id.unicity.toString()}",
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
                  const ColumnItem(
                    title: "Order ID",
                    value: "123455",
                  ),
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
              style: AppTheme.lightTheme.textTheme.headline6,
            ),
          ),
          Expanded(
            child: Text(
              " : ",
              textAlign: TextAlign.center,
              style: AppTheme.lightTheme.textTheme.headline6,
            ),
          ),
          Expanded(
            flex: 3,
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
