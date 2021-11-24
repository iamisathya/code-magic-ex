import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../constants/colors.dart';
import '../../../../../models/general_models.dart';
import '../../../../../utilities/enums.dart';
import '../../../../../utilities/extensions.dart';
import '../../../../../utilities/images.dart';
import '../../../../global/theme/text_view.dart';
import '../../controller/openpo.list.controller.dart';
import '../../order_search/components/search_products.dart';

class PoListToolBar extends StatelessWidget {
  const PoListToolBar({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final OpenPoListController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.crayola,
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
                                onTap: () =>
                                    controller.onChangeMonthType(index),
                                child: AppText(
                                    text: type.name,
                                    style: controller.currentTab.value == index
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
