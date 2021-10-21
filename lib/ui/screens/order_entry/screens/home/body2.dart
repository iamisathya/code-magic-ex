import 'package:dsc_tools/models/general_models.dart';
import 'package:dsc_tools/ui/global/theme/text_view.dart';
import 'package:dsc_tools/ui/screens/open_po/home/components/loader.dart';
import 'package:dsc_tools/ui/screens/order_entry/controllers/orderentry.home.controller.dart';
import 'package:dsc_tools/utilities/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../../../../utilities/extensions.dart';
import 'components/white_search_field.dart';

class Body extends StatelessWidget {
  final OrderEntryUserListController controller =
      Get.put(OrderEntryUserListController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => LoadingOverlay(
        isLoading: controller.isLoading.value,
        progressIndicator: const Loader(),
        child: Column(
          children: [
            Container(
              color: Colors.white,
              height: 70,
              alignment: Alignment.center,
              child: Text(
                "Order Entry",
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            Container(
              color: const Color(0xFF76E5DE),
              height: 130,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                        children: controller.searchOptions
                            .mapIndexed(
                              (NameValueType type, int index) =>
                                  GestureDetector(
                                onTap: () =>
                                    controller.onChangeMonthType(index),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: index != 0 ? 8.0 : 0),
                                  child: Text(
                                    type.name,
                                    style: controller.currentTab.value == index
                                        ? Theme.of(context).textTheme.subtitle1
                                        : Theme.of(context).textTheme.bodyText2,
                                  ),
                                ),
                              ),
                            )
                            .toList()),
                    WhiteSearchField(
                        controller: controller.searchUserTextController,
                        onPress: controller.searchUserBySearchQuery,
                        hintText: "BA Number or Govt ID or Name",
                        isFetching: controller.isFetching)
                  ],
                ),
              ),
            ),
            if(controller.filterMethod.value != "baId") Expanded(
              child: SingleChildScrollView(
                  child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Container(
                  color: const Color(0xFFF5F5F5),
                  child: Obx(
                    () => ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.searchResultsOfUserInfo.length,
                        itemBuilder: (BuildContext ctxt, int index) {
                          final bool isSelected =
                              controller.selecteduserIndex.value == index;
                          return GestureDetector(
                            onTap: () => controller.onSelectUser(index),
                            child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: isSelected
                                    ? AppText(
                                        text: controller
                                            .searchResultsOfUserInfo[index]
                                            .humanName
                                            .fullName,
                                        style: TextTypes.headline6)
                                    : AppText(
                                        text: controller
                                            .searchResultsOfUserInfo[index]
                                            .humanName
                                            .fullName,
                                        style: TextTypes.bodyText1,
                                        color: const Color(0xFF505050))),
                          );
                        }),
                  ),
                ),
              )),
            ) else const SizedBox()
          ],
        ),
      ),
    );
  }
}
