import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../data/enums.dart';
import '../../../../../../widgets/text_view.dart';
import '../../../../../core/values/colors.dart';

class ModalPicker extends StatelessWidget {
  const ModalPicker(
      {Key? key,
      required this.onSelectFilter,
      required this.onSelectedItemChanged,
      required this.options,
      required this.selectedIndex})
      : super(key: key);

  final VoidCallback onSelectFilter;
  final Function(int?) onSelectedItemChanged;
  final int selectedIndex;
  final List<String> options;

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
                color: AppColor.darkLiver,
              ),
            ),
            GestureDetector(
              onTap: onSelectFilter,
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
              scrollController:
                  FixedExtentScrollController(initialItem: selectedIndex),
              magnification: 1.2,
              useMagnifier: true,
              itemExtent: 50.0,
              onSelectedItemChanged: onSelectedItemChanged,
              children: options
                  .map((e) => Container(
                        alignment: Alignment.center,
                        height: 100,
                        child: AppText(text: e, style: TextTypes.headline5),
                      ))
                  .toList()),
        ),
      ],
    );
  }
}
