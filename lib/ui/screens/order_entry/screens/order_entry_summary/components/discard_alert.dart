import 'package:dsc_tools/styles/border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../../constants/colors.dart';
import '../../../../../../utilities/enums.dart';
import '../../../../../../utilities/images.dart';
import '../../../../../global/theme/text_view.dart';
import '../../../controllers/orderentry.product.list.controller.dart';
import '../../../orderentry.screen.dart';

class DiscardAlert extends StatelessWidget {
  final OrderEntryProductListController controller =
      Get.put(OrderEntryProductListController());
  DiscardAlert({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 448,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: borderRadiusWithColor(bgColor: AppColor.kWhiteColor),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            SvgPicture.asset(kTrashImage, height: 198, width: 234),
            const AppText(
              text: "“Your current changes will not be saved”", //! hardcoded
              style: TextTypes.headline6,
              color: AppColor.charcoal,
            ),
            SizedBox(
              height: 50,
              child: Row(
                children: <Widget>[
                  Flexible(
                    child: NegetiveButton(
                        title: "cancel".tr,
                        onTap: () => Navigator.pop(context)),
                  ),
                  Flexible(
                    child: PositiveButton(
                        title: "ok_got_it".tr, onTap: controller.clearCart),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
