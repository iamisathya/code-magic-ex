import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../data/enums.dart';
import '../../../../../../widgets/text_view.dart';
import '../../../../../core/values/colors.dart';

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
