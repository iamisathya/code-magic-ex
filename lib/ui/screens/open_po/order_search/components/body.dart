import 'package:dsc_tools/constants/colors.dart';
import 'package:dsc_tools/ui/global/theme/text_view.dart';
import 'package:dsc_tools/ui/screens/open_po/order_search/controller/openpo.search.controller.dart';
import 'package:dsc_tools/utilities/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Body extends StatelessWidget {
  final OpenPoSearchController controller = Get.put(OpenPoSearchController());
  Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 54,
            color: AppColor.kWhiteSmokeColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                      text: "search_history".tr,
                      style: TextTypes.subtitle1),
                  GestureDetector(
                    onTap: () => controller.clearHistory(),
                    child: AppText(
                      text: "clear_all".tr,
                      style: TextTypes.subtitle1, color: AppColor.brinkPink,
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
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: GestureDetector(
                    onTap: () =>
                        controller.searchOrder(controller.searchHistory[index]),
                    child: Text(controller.searchHistory[index],
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2!
                            .copyWith(color: AppColor.cadet)),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
