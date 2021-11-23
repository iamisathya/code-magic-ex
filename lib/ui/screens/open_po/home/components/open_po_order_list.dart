import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/openpo.list.controller.dart';
import 'po_item.dart';
import 'po_list_toolbar.dart';

class OpenPoOrderList extends StatelessWidget {
  final OpenPoListController controller = Get.put(OpenPoListController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const HeaderBar(),
          PoListToolBar(controller: controller),
          OpenPoList(controller: controller)
        ],
      ),
    );
  }
}

class HeaderBar extends StatelessWidget {
  const HeaderBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

class OpenPoList extends StatelessWidget {
  const OpenPoList({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final OpenPoListController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
              },
            ),
          ),
        ),
      ),
    );
  }
}
