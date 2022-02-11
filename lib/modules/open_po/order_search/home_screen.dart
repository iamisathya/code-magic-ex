import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../utils/images.dart';
import 'components/body.dart';
import 'controller/openpo.search.controller.dart';

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
      body: Body(),
    );
  }
}
