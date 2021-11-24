import 'package:dsc_tools/ui/screens/open_po/order_search/controller/openpo.search.controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../utilities/images.dart';
import 'components/body.dart';
import 'components/search_bar_field.dart';

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
                      searchTextController: controller.searchTextController,
                      placeHolder: "Search text here...",
                    );
                    controller
                        .addSearchItem(controller.searchTextController.text);
                  } else {
                    appBarTitle = const Text("");
                  }
                });
              },
            ),
          ]),
      body: Body(),
    );
  }
}
