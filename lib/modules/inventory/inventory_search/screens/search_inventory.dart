import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../data/enums.dart';
import '../../../../../widgets/text_view.dart';
import '../../../../core/values/colors.dart';
import '../controller/inventory.search.controller.dart';

class InventorySearchProducts extends StatelessWidget {
  final InventorySearchController controller =
      Get.put(InventorySearchController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        centerTitle: false,
        title: GetBuilder<InventorySearchController>(builder: (_) {
          return controller.appBarTitle;
        }),
        actions: <Widget>[
          Obx(
            () => IconButton(
              icon: controller.searchingProduct.value
                  ? controller.loadingIcon
                  : controller.actionIcon,
              onPressed: controller.onPressAppBar,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 80,
              color: AppColor.kWhiteSmokeColor,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 17, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "search_history".tr,
                      style: const TextStyle(
                          fontSize: 14, color: AppColor.kBlackColor),
                    ),
                    GestureDetector(
                      onTap: () => controller.clearHistory(),
                      child: Text(
                        "clear_all".tr,
                        style: const TextStyle(
                            fontSize: 14, color: AppColor.brinkPink),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Obx(
              () => ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.searchHistory.length,
                itemBuilder: (BuildContext ctxt, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: GestureDetector(
                      onTap: () => controller
                          .searchOrder(controller.searchHistory[index]),
                      child: Obx(
                        () => AppText(
                            text: controller.searchHistory[index],
                            style: controller.selectedSearchIndex.value == index
                                ? TextTypes.headline6
                                : TextTypes.subtitle2,
                            color: AppColor.cadet),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
