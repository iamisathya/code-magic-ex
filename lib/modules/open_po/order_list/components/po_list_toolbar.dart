import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../data/enums.dart';
import '../../../../../widgets/text_view.dart';
import '../../../../core/values/colors.dart';
import '../../../../data/model/general_models.dart';
import '../../../../routes/app_pages.dart';
import '../../../../utils/extensions.dart';
import '../../../../utils/images.dart';
import '../controller/openpo.list.controller.dart';

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
                                    text: type.name.tr,
                                    style: controller.currentTab.value == index
                                        ? TextTypes.subtitle1
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
                        height: 20, semanticsLabel: "filter_po_list"),
                  ),
                  const SizedBox(width: 25),
                  GestureDetector(
                    onTap: () => Get.toNamed(Routes.OPEN_PO_SEARCH_PRODUCTS),
                    child: SvgPicture.asset(kSearchIcon,
                        height: 20, semanticsLabel: "search_po_list"),
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
