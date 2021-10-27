import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../../../../models/general_models.dart';
import '../../../../../utilities/extensions.dart';
import '../../../../../utilities/images.dart';
import '../../controller/openpo.list.controller.dart';
import 'loader.dart';
import 'po_item.dart';
import 'search_products.dart';

class OpenPoOrderList extends StatelessWidget {
  final OpenPoListController controller = Get.put(OpenPoListController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => LoadingOverlay(
        isLoading: controller.isLoading.value,
        progressIndicator: const Loader(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.white,
                height: 70,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "PO List",
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      // ShareButton(
                      //     onPress: () => Get.to(() => CreateOpenPoOrder())),
                    ],
                  ),
                ),
              ),
              Container(
                color: const Color(0xFF76E5DE),
                height: 70,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 3,
                        child: Obx(
                          () => Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: controller.availableMonthSlots
                                  .mapIndexed((NameValueType type, int index) =>
                                      GestureDetector(
                                        onTap: () =>
                                            controller.onChangeMonthType(index),
                                        child: Text(
                                          type.name,
                                          style:
                                              controller.currentTab.value ==
                                                      index
                                                  ? Theme.of(context)
                                                      .textTheme
                                                      .bodyText1
                                                  : Theme.of(context)
                                                      .textTheme
                                                      .bodyText2,
                                        ),
                                      ))
                                  .toList()),
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () => controller.showPicker(context),
                              child: SvgPicture.asset(kOpenPoFilterIcon,
                                  height: 20, semanticsLabel: "Filter PO list"),
                            ),
                            const SizedBox(width: 25),
                            GestureDetector(
                              onTap: () => Get.to(() => SearchProducts()),
                              child: SvgPicture.asset(kSearchIcon,
                                  height: 20, semanticsLabel: "Search PO list"),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SingleChildScrollView(
                  physics: const ScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Container(
                      color: const Color(0xFFF5F5F5),
                      child: Obx(
                        () => ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.tempOpenPlaceOrders.length,
                            itemBuilder: (BuildContext ctxt, int index) {
                              return POItem(
                                  openPo: controller.tempOpenPlaceOrders[index],
                                  controller: controller);
                            }),
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
