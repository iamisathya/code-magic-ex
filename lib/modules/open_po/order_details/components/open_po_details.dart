import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../../../../data/enums.dart';
import '../../../../../widgets/text_view.dart';
import '../../../../core/values/colors.dart';
import '../../../../utils/constants.dart';
import '../../../../utils/images.dart';
import '../../../../widgets/bottom_button_bar.dart';
import '../../order_create/component/loader.dart';
import '../../order_create/component/total_price_container.dart';
import '../controller/openpo.details.controller.dart';
import 'po_ordered_item.dart';

class OpenPODetailsPage extends StatelessWidget {
  final OpenPoDetailsController controller = Get.put(OpenPoDetailsController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => LoadingOverlay(
        isLoading: controller.isLoading.value,
        progressIndicator: const Loader(),
        child: Scaffold(
          backgroundColor: AppColor.kWhiteSmokeColor,
          appBar: AppBar(
              title: Obx(() => Text(controller.passedOrderNumber.value,
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: AppColor.kBlackColor)))),
          body: SingleChildScrollView(
            child: Obx(
              () => SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(
                          minHeight: Get.height -
                              (controller.poOrderAttachment.isNotEmpty
                                  ? 334
                                  : 284)),
                      child: Column(
                        children: [
                          TopBar(controller: controller),
                          ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount:
                                  controller.openPlaceOrderDetails.length,
                              itemBuilder: (BuildContext ctxt, int index) {
                                return PoOrderedItem(
                                    item:
                                        controller.openPlaceOrderDetails[index],
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
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
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
          ),
          bottomNavigationBar: BottomButtonBar(
            showNeutral: false,
            bgColor: AppColor.brightGray,
            onTapCancelButton: Get.back,
            negetiveText: "back".tr,
            positiveText: "print_po_list".tr,
            onTapPositiveButton: () {
              controller.proceedToPrint(context,
                  orderId: controller.openPlaceOrderId.orderId);
            },
          ),
        ),
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final OpenPoDetailsController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      color: AppColor.crayola,
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 20, left: 30, bottom: 10, right: 30),
            child: Row(
              children: [
                Flexible(
                  child: Container(
                    width: double.infinity,
                    color: Colors.white,
                    height: 40,
                    child: Center(
                      child: AppText(
                          text: controller.openPlaceOrderId.orderDscid,
                          style: TextTypes.subtitle2,
                          color: AppColor.darkLiver),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: Container(
                      width: double.infinity,
                      color: Colors.white,
                      height: 40,
                      child: Center(
                          child: AppText(
                              text: controller.openPlaceOrderId.orderDate,
                              style: TextTypes.subtitle2,
                              color: AppColor.manatee))),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, bottom: 20, right: 30),
            child: Container(
              width: double.infinity,
              color: Colors.white,
              height: 40,
              child: Center(
                  child: AppText(
                      text: controller.openPlaceOrderId.createBy,
                      style: TextTypes.subtitle2,
                      color: AppColor.manatee)),
            ),
          ),
        ],
      ),
    );
  }
}
