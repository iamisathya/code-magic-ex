import 'package:dsc_tools/constants/colors.dart';
import 'package:dsc_tools/ui/global/theme/text_view.dart';
import 'package:dsc_tools/ui/screens/open_po/controller/openpo.list.controller.dart';
import 'package:dsc_tools/utilities/enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dropdown_item.dart';

class OpenPoListFilterDropdown extends StatelessWidget {
  OpenPoListFilterDropdown({
    Key? key,
  }) : super(key: key);

  final OpenPoListController controller = Get.put(OpenPoListController());

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: 48,
          color: Colors.white,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            GestureDetector(
              onTap: Get.back,
              child: AppText(
                  text: "cancel".tr,
                  style: TextTypes.bodyText1,
                  color: AppColor.darkLiver),
            ),
            GestureDetector(
              onTap: controller.onSelectFilter,
              child: AppText(
                text: "done".tr,
                style: TextTypes.headline6,
                color: AppColor.blueCrayola,
              ),
            )
          ]),
        ),
        SizedBox(
          height: 250,
          child: CupertinoPicker(
            backgroundColor: AppColor.ghostWhite,
            scrollController: FixedExtentScrollController(
                initialItem: controller.selectedFilterIndex.value),
            magnification: 1.2,
            useMagnifier: true,
            itemExtent: 50.0,
            onSelectedItemChanged: (val) {
              controller.selectedFilterIndex.value = val;
            },
            children: const [
              DropDownItem(title: "Show All"),
              DropDownItem(title: "Wating Approval"),
              DropDownItem(title: "Inventory Transferred"),
              DropDownItem(title: "Approved"),
              DropDownItem(title: "Deleted")
            ],
          ),
        ),
      ],
    );
  }
}
