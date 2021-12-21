import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../constants/colors.dart';
import '../../../../../utilities/constants.dart';
import '../../../../../utilities/enums.dart';
import '../../../../../utilities/images.dart';
import '../../../../global/theme/text_view.dart';
import '../../order_create/component/total_price_container.dart';
import '../controller/openpo.details.controller.dart';
import 'openpo_details_topbar.dart';
import 'po_ordered_item.dart';

class Body extends StatelessWidget {
  final OpenPoDetailsController controller = Get.put(OpenPoDetailsController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Obx(
        () => SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(
                    minHeight: Get.height -
                        (controller.poOrderAttachment.isNotEmpty ? 334 : 284)),
                child: Column(
                  children: [
                    OpenPoDetailsTopBar(),
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.openPlaceOrderDetails.length,
                        itemBuilder: (BuildContext ctxt, int index) {
                          return PoOrderedItem(
                              item: controller.openPlaceOrderDetails[index],
                              idx: index);
                        }),
                    const SizedBox(
                      height: 34,
                    ),
                  ],
                ),
              ),
              TotalPrice(
                  totalPrice: controller.openPlaceOrderId.orderTotalPrice,
                  totalPv: controller.openPlaceOrderId.orderTotalPv,
                  bgColor: kWhiteSmokeColor),
              if (controller.poOrderAttachment.isNotEmpty)
                Container(
                  height: 50,
                  color: AppColor.brightGray,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                          text: controller.poOrderAttachment,
                          style: TextTypes.bodyText1),
                      GestureDetector(
                        onTap: () => controller.openDialog(
                            context, controller.poOrderAttachment),
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: AppText(
                                text: "view".tr,
                                style: TextTypes.bodyText1,
                                color: AppColor.dodgerBlue,
                              ),
                            ),
                            SvgPicture.asset(kFileIcon,
                                height: 15, color: AppColor.dodgerBlue)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
