import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../../../../utilities/images.dart';
import '../../../../global/widgets/sign_out_button.dart';
import '../../controller/openpo.details.controller.dart';
import 'loader.dart';
import 'po_ordered_item.dart';
import 'total_price_container.dart';

class OpenPODetailsPage extends GetView<OpenPoDetailsController> {
  // final OpenPoDetailsController controller =
  //     Get.put(OpenPoDetailsController(api: MemberCallsService(Dio())));
  static const String routeName = '/openPoDetailsPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
          title: Obx(() => Text(controller.passedOrderNumber.value,
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: const Color(0xFF000000))))),
      body: Obx(
        () => LoadingOverlay(
          isLoading: controller.isLoading.value,
          progressIndicator: const Loader(),
          child: SingleChildScrollView(
            child: controller.obx(
              (state) => SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 130,
                      color: const Color(0xFF5297A6),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 20, left: 30, bottom: 10, right: 30),
                            child: Row(
                              children: [
                                Flexible(
                                  child: Container(
                                    width: double.infinity,
                                    color: Colors.white,
                                    height: 40,
                                    child: Center(
                                        child: Text(
                                      controller.openPlaceOrderId.orderDscid,
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle2!
                                          .copyWith(
                                              color: const Color(0xFF9999A4)),
                                    )),
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
                                        child: Text(
                                      controller.openPlaceOrderId.orderDate,
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle2!
                                          .copyWith(
                                              color: const Color(0xFF9999A4)),
                                    )),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 30, bottom: 20, right: 30),
                            child: Container(
                              width: double.infinity,
                              color: Colors.white,
                              height: 40,
                              child: Center(
                                  child: Text(
                                controller.openPlaceOrderId.createBy,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(color: const Color(0xFF9999A4)),
                              )),
                            ),
                          ),
                        ],
                      ),
                    ),
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
                    TotalPrice(
                        totalPrice: controller.openPlaceOrderId.orderTotalPrice,
                        totalPv: controller.openPlaceOrderId.orderTotalPv),
                    const SizedBox(
                      height: 30,
                    ),
                    if (controller.poOrderAttachment.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10, left: 20, right: 20, bottom: 5),
                        child: SignOutButton(
                            title: controller.poOrderAttachment,
                            onPress: () {
                              controller.openDialog(
                                  context, controller.poOrderAttachment);
                            },
                            icon: kFileIcon),
                      )
                    else
                      const SizedBox(),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 5, left: 20, right: 20, bottom: 10),
                      child: SignOutButton(
                        title: "Print PO List",
                        onPress: () {
                          controller.proceedToPrint(context,
                              orderId: controller.openPlaceOrderId.orderId);
                        },
                        bgColor: const Color(0xFF1C9CFC),
                        fgColor: const Color(0xFFFFFFFF),
                        icon: kPrintIcon,
                        iconColor: const Color(0xFFFFFFFF),
                      ),
                    ),
                  ],
                ),
              ), // optional
              onError: (error) => Center(
                // optional
                child: Text(
                  'Error: $error',
                  style: const TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
