import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../constants/colors.dart';
import '../../../../utilities/images.dart';
import '../../open_po/home/components/search_bar_field.dart';
import '../controller/search_sales_products.dart';

class SearchSalesReport extends StatefulWidget {
  @override
  _SearchAppBarState createState() => _SearchAppBarState();
}

class _SearchAppBarState extends State<SearchSalesReport> {
  SalesReportSearchController controller =
      Get.put(SalesReportSearchController());

  Widget appBarTitle = const Text("");
  SvgPicture actionIcon = SvgPicture.asset(kSearchIcon,
      height: 20, key: const ObjectKey("seachIcon"));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          titleSpacing: 0,
          centerTitle: false,
          title: appBarTitle,
          actions: <Widget>[
            IconButton(
              icon: actionIcon,
              onPressed: () {
                setState(() {
                  if (actionIcon.key == const ObjectKey("seachIcon")) {
                    appBarTitle = SearchBarField(
                        searchTextController: controller.searchTextController,
                        placeHolder: "Orer search");
                    controller
                        .addSearchItem(controller.searchTextController.text);
                  } else {
                    controller.searchTextController.text = "";
                  }
                });
              },
            ),
          ]),
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
                    const Text(
                      "Search History",
                      style: TextStyle(fontSize: 14, color: AppColor.kBlackColor),
                    ),
                    GestureDetector(
                      onTap: () => controller.clearHistory(),
                      child: const Text(
                        "Clear all",
                        style:
                            TextStyle(fontSize: 14, color: AppColor.brinkPink),
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
