import 'package:dsc_tools/models/general_models.dart';
import 'package:dsc_tools/ui/global/theme/text_view.dart';
import 'package:dsc_tools/ui/screens/open_po/controller/openpo.list.controller.dart';
import 'package:dsc_tools/utilities/enums.dart';
import 'package:dsc_tools/utilities/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../utilities/extensions.dart';
import 'search_products.dart';

class PoListToolBar extends StatelessWidget {
  const PoListToolBar({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final OpenPoListController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF76E5DE),
      height: 70,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Obx(
                () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: controller.availableMonthSlots
                        .mapIndexed((NameValueType type, int index) =>
                            GestureDetector(
                                onTap: () => controller
                                    .onChangeMonthType(index),
                                child: AppText(
                                    text: type.name,
                                    style:
                                        controller.currentTab.value ==
                                                index
                                            ? TextTypes.bodyText1
                                            : TextTypes.bodyText2)))
                        .toList()),
              ),
            ),
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () => controller.showPicker(context),
                    child: SvgPicture.asset(kOpenPoFilterIcon,
                        height: 20, semanticsLabel: "Filter PO list"),
                  ),
                  const SizedBox(width: 25),
                  GestureDetector(
                    onTap: () => Get.to(() => SearchProducts()),
                    child: SvgPicture.asset(kSearchIcon,
                        height: 20, semanticsLabel: "Search PO list"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}