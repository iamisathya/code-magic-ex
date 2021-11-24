import 'package:dsc_tools/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../utilities/enums.dart';
import '../../../../../global/theme/text_view.dart';

class CashOnDeliveryDetails extends StatelessWidget {
  const CashOnDeliveryDetails(
      {Key? key, required this.message, required this.image})
      : super(key: key);

  final String message;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 24),
        child: SvgPicture.asset(image),
      ),
      AppText(
        text: message,
        style: TextTypes.bodyText1,
        color: AppColor.auroMetalSaurus,
        align: TextAlign.center,
      )
    ]);
  }
}
