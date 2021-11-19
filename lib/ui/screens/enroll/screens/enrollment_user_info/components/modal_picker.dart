import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../utilities/enums.dart';
import '../../../../../global/theme/text_view.dart';

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
                color: const Color(0xFF505050),
              ),
            ),
            GestureDetector(
              onTap: onSelectFilter,
              child: AppText(
                text: "done".tr,
                style: TextTypes.headline6,
                color: const Color(0xFF1A78F4),
              ),
            )
          ]),
        ),
        SizedBox(
          height: 250,
          child: CupertinoPicker(
              backgroundColor: const Color(0xFFF6F9FD),
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
