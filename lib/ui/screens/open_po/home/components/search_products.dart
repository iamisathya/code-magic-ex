import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../utilities/images.dart';
import '../../controller/openpo.search.controller.dart';
import 'search_bar_field.dart';

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
          title: appBarTitle,
          actions: <Widget>[
            IconButton(
              icon: actionIcon,
              onPressed: () {
                setState(() {
                  if (actionIcon.key == const ObjectKey("seachIcon")) {
                    appBarTitle = SearchBarField(
                        searchTextController: controller.searchTextController);
                    controller
                        .addSearchItem(controller.searchTextController.text);
                  } else {
                    appBarTitle = const Text("");
                  }
                });
              },
            ),
          ]),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 50,
              color: const Color(0xFFF5F5F5),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Search History",
                      style: TextStyle(fontSize: 14, color: Color(0xFF000000)),
                    ),
                    GestureDetector(
                      onTap: () => controller.clearHistory(),
                      child: const Text(
                        "Clear all",
                        style:
                            TextStyle(fontSize: 14, color: Color(0xFFFE5D7C)),
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
                              .copyWith(color: const Color(0xFF606975))),
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
