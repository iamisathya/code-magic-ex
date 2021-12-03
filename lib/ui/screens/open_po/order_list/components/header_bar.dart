import 'package:get/get.dart';

import 'package:dsc_tools/ui/global/theme/text_view.dart';
import 'package:dsc_tools/utilities/enums.dart';
import 'package:flutter/material.dart';

class HeaderBar extends StatelessWidget {
  const HeaderBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 70,
      alignment: Alignment.center,
      child: AppText(
        text: "po_list".tr,
        style: TextTypes.headline4,
      ),
    );
  }
}
