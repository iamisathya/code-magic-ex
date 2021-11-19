import '../../../../../global/theme/text_view.dart';

import '../../../../../../utilities/enums.dart';
import '../../../../../../utilities/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
                  color: Color(0xFF606975)),
            ],
          ),
          SvgPicture.asset(kOrderEntrySuccessImage, height: 224),
          Column(
            children: const [
              AppText(
                  text: "Distributor ID : 102915181",
                  style: TextTypes.subtitle2,
                  color: Color(0xFF606975)),
              SizedBox(height: 10),
              AppText(
                  text: "PO Number: BKM 2021-08-W002",
                  style: TextTypes.subtitle2,
                  color: Color(0xFF606975)),
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
