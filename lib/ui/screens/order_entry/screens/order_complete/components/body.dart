import 'package:code_magic_ex/constants/font_weights.dart';
import 'package:code_magic_ex/styles/edge_insets.dart';
import 'package:code_magic_ex/ui/global/theme/app_theme.dart';

import 'package:code_magic_ex/ui/global/widgets/primary_button.dart';
import 'package:code_magic_ex/utilities/images.dart';
import 'package:code_magic_ex/utilities/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../order_entry.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: 
    Container(
      margin: kEdgeInset(v: 16),
      child: Center(
        child: Column(
          children: [
            SizedBox(height: SizeConfig.screenHeight * 0.03),
            SvgPicture.asset(kImageOrderComplete,
                height: SizeConfig.screenHeight * 0.25),
            SizedBox(height: SizeConfig.screenHeight * 0.05),
            Text(
              "Order Summary - #23232323",
              style: AppTheme.lightTheme.textTheme.headline2,
            ),
            const Text(
              "We are recived order from your, we are processing it. We'll send it to you shortly",
            ),
            Container(
              margin: kEdgeInsetSymmetric(h: 0, v: 20),
              child: Column(
                children: const [
                  ColumnItem(
                    title: "User ID",
                    value: "121212",
                  ),
                  ColumnItem(
                    title: "User Name",
                    value: "121212",
                  ),
                  ColumnItem(
                    title: "Order Number",
                    value: "121212",
                  ),
                ],
              ),
            ),
            Container(
              margin: kEdgeInsetTLRB(b: 20),
              child: Column(
                children: [
                  TextButton.icon(onPressed: () => null, icon: const Icon(Icons.arrow_forward_outlined), label: const Text("Check Orders")),
                  TextButton.icon(onPressed: () => null, icon: const Icon(Icons.arrow_forward_outlined), label: const Text("Get Print")),
                  TextButton.icon(onPressed: () => null, icon: const Icon(Icons.arrow_forward_outlined), label: const Text("Go back")),
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
      padding: kEdgeInset(v: 10),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              title,
              style: AppTheme.lightTheme.textTheme.headline4,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              ": $value",
              style: AppTheme.lightTheme.textTheme.headline4,
            ),
          ),
        ],
      ),
    );
  }
}
