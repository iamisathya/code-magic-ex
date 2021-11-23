import 'package:dsc_tools/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../../../../utilities/enums.dart';
import '../../../../../utilities/images.dart';
import '../../../../global/theme/text_view.dart';
import '../../../../global/widgets/bottom_button_bar.dart';
import '../../controller/openpo.details.controller.dart';
import 'loader.dart';
import 'po_ordered_item.dart';
import 'total_price_container.dart';

class OpenPODetailsPage extends StatelessWidget {
  final OpenPoDetailsController controller = Get.put(OpenPoDetailsController());
  static const String routeName = '/openPoDetailsPage';
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => LoadingOverlay(
        isLoading: controller.isLoading.value,
        progressIndicator: const Loader(),
        child: Scaffold(
          backgroundColor: const Color(0xFFF5F5F5),
          appBar: AppBar(
              title: Obx(() => Text(controller.passedOrderNumber.value,
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: const Color(0xFF000000))))),
          body: SingleChildScrollView(
            child: Obx(
              () => SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(minHeight: Get.height - (controller.poOrderAttachment.isNotEmpty ? 334 : 284)),
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
                        color: const Color(0xFFE3E8ED),
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
                                  const Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                                    child: AppText(
                                      text: "View",
                                      style: TextTypes.bodyText1,
                                      color: Color(0xFF1C9CFC),
                                    ),
                                  ),
                                  SvgPicture.asset(kFileIcon,
                                      height: 15,
                                      color: const Color(0xFF1C9CFC))
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
            onTapCancelButton: Get.back,
            negetiveText: "back",
            positiveText: "Print PO List",
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
      color: const Color(0xFF76E5DE),
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
                              color: const Color(0xFF505050)))),
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
                              color: const Color(0xFF9999A4)))),
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
                      color: const Color(0xFF9999A4))),
            ),
          ),
        ],
      ),
    );
  }
}
