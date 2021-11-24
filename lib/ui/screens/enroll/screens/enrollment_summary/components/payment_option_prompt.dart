import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../constants/colors.dart';
import '../../../../../../constants/globals.dart';
import '../../../../../../utilities/enums.dart';
import '../../../../../../utilities/images.dart';
import '../../../../../global/theme/text_view.dart';

class PromptPaymentOption extends StatelessWidget {
  const PromptPaymentOption({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 371,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgPicture.asset(kPromptPayImage),
          const AppText(
              text: "Scan The QR Code to Pay",
              style: TextTypes.bodyText1,
              color: AppColor.ateneoBlue),
          SvgPicture.asset(kBarcodeExampleImage),
          Text(
            "${Globals.currency} 8,040",
            style: const TextStyle(
                fontWeight: FontWeight.w800,
                color: AppColor.kBlackColor,
                fontSize: 24),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.access_time),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: AppText(
                    text: "03 Nov 2021 -",
                    style: TextTypes.bodyText1,
                    color: AppColor.charcoal),
              ),
              AppText(
                  text: "01:55",
                  style: TextTypes.bodyText1,
                  color: AppColor.mediumAquamarine),
            ],
          )
        ],
      ),
    );
  }
}
