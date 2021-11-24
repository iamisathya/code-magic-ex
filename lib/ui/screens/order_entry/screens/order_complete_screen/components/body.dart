import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../constants/colors.dart';
import '../../../../../../utilities/enums.dart';
import '../../../../../../utilities/images.dart';
import '../../../../../global/theme/text_view.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: const [
              AppText(text: "Thank You", style: TextTypes.headline4),
              SizedBox(height: 10),
              AppText(
                  text: "Your order has been placed successfully!",
                  style: TextTypes.subtitle2,
                  color: AppColor.cadet),
            ],
          ),
          SvgPicture.asset(kOrderEntrySuccessImage, height: 224),
          Column(
            children: const [
              AppText(
                  text: "Distributor ID : 102915181",
                  style: TextTypes.subtitle2,
                  color: AppColor.cadet),
              SizedBox(height: 10),
              AppText(
                  text: "PO Number: BKM 2021-08-W002",
                  style: TextTypes.subtitle2,
                  color: AppColor.cadet),
            ],
          ),
          Column(
            children: [
              const AppText(text: "Scan Order", style: TextTypes.subtitle1),
              const SizedBox(height: 10),
              SvgPicture.asset(kOrderEntryBarcodeImage, height: 60, width: 100),
            ],
          ),
        ],
      ),
    );
  }
}
