import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../constants/colors.dart';
import '../../../../../utilities/enums.dart';
import '../../../../../utilities/images.dart';
import '../../../../global/theme/text_view.dart';
import '../controller/openpo.search.controller.dart';

class SearchProducts extends StatefulWidget {
  @override
  _SearchAppBarState createState() => _SearchAppBarState();
}

class _SearchAppBarState extends State<SearchProducts> {
  OpenPoSearchController controller = Get.put(OpenPoSearchController());
  SvgPicture actionIcon = SvgPicture.asset(kSearchIcon,
      height: 20, key: const ObjectKey("seachIcon"));

  Widget appBarTitle = const Text("");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        centerTitle: false,
        title: GetBuilder<OpenPoSearchController>(builder: (_) {
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
      // AppBar(
      //     titleSpacing: 0,
      //     centerTitle: false,
      //     title: appBarTitle,
      //     actions: <Widget>[
      //       IconButton(
      //         icon: actionIcon,
      //         onPressed: () {
      //           setState(() {
      //             if (actionIcon.key == const ObjectKey("seachIcon")) {
      //               appBarTitle = SearchBarField(
      //                   searchTextController: controller.searchTextController);
      //               controller
      //                   .addSearchItem(controller.searchTextController.text);
      //             } else {
      //               appBarTitle = const Text("");
      //             }
      //           });
      //         },
      //       ),
      //     ]),
      body: SingleChildScrollView(
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
                        text: "search_history".tr, style: TextTypes.subtitle1),
                    GestureDetector(
                      onTap: () => controller.clearHistory(),
                      child: AppText(
                        text: "clear_all".tr,
                        style: TextTypes.subtitle1,
                        color: AppColor.brinkPink,
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
      ),
    );
  }
}
