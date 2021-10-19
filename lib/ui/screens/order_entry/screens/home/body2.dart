import 'package:dsc_tools/models/general_models.dart';
import 'package:dsc_tools/ui/global/widgets/animated_add_button.dart';
import 'package:dsc_tools/ui/screens/inventory/component/search_inventory.dart';
import 'package:dsc_tools/ui/screens/open_po/home/components/add_products.dart';
import 'package:dsc_tools/ui/screens/open_po/home/components/loader.dart';
import 'package:dsc_tools/ui/screens/order_entry/controllers/orderentry.home.controller.dart';
import 'package:dsc_tools/utilities/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../../../../utilities/extensions.dart';

class Body extends StatelessWidget {
  final OrderEntryUserListController controller =
      Get.put(OrderEntryUserListController());

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
                                      style:
                                          controller.currentTab.value == index
                                              ? Theme.of(context)
                                                  .textTheme
                                                  .subtitle1
                                              : Theme.of(context)
                                                  .textTheme
                                                  .bodyText2,
                                    ),
                                  ),
                                ),
                              )
                              .toList()),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        height: 54,
                        child: TextField(
                          controller: controller.searchUserTextController,
                          decoration: InputDecoration(
                            filled: true,
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            fillColor: Colors.white,
                            hintText: "BA Number or Govt ID or Name",
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 18, horizontal: 20),
                            suffixIcon: IconButton(
                                onPressed: controller.onSearchPressed,
                                color: const Color(0xFF384250),
                                icon: SvgPicture.asset(kSearchV2Icon,
                                    width: 20, semanticsLabel: 'search icon')),
                            hintStyle: TextStyle(color: Colors.grey[300]),
                          ),
                        ),
                      )
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
                            itemCount: controller.searchedUsers.length,
                            itemBuilder: (BuildContext ctxt, int index) {
                              return Text(controller.searchedUsers[index]);
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
