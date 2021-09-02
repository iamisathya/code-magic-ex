import 'package:dsc_tools/ui/screens/open_po/controller/openpo.controller.dart';
import 'package:dsc_tools/ui/screens/open_po/home/components/add_products.dart';
import 'package:dsc_tools/ui/screens/open_po/home/components/po_item.dart';
import 'package:dsc_tools/ui/screens/open_po/home/components/search_products.dart';
import 'package:dsc_tools/utilities/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../../utilities/extensions.dart';

class Body2 extends StatelessWidget {
  final OpenPoController controller = Get.put(OpenPoController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: Colors.white,
            height: 70,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "PO List",
                    style: TextStyle(fontSize: 24),
                  ),
                  GestureDetector(
                    onTap: () => Get.to(() => AddProducts()),
                    child: SvgPicture.asset(kAddPoIcon,
                        height: 40, semanticsLabel: "Add PO"),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: const Color(0xFFE3E8ED),
            height: 70,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: controller.availableMonthSlots
                            .mapIndexed((String type, int index) => Text(
                                  type,
                                  style: TextStyle(
                                      fontSize:
                                          controller.currentTab.value == index
                                              ? 14
                                              : 12,
                                      fontWeight:
                                          controller.currentTab.value == index
                                              ? FontWeight.w500
                                              : null),
                                ))
                            .toList()),
                  ),
                  Flexible(
                      child: GestureDetector(
                        onTap: () => Get.to(() => SearchProducts()),
                        child: SvgPicture.asset(kSearchIcon,
                            height: 20, semanticsLabel: "Search PO list"),
                      )),
                ],
              ),
            ),
          ),
          SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Container(
                  color: const Color(0xFFF5F5F5),
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 10,
                      itemBuilder: (BuildContext ctxt, int index) {
                        return POItem();
                      }),
                ),
              ))
        ],
      ),
    );
  }
}
