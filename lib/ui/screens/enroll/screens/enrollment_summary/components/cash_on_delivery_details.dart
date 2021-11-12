import 'package:dsc_tools/ui/global/theme/text_view.dart';
import 'package:dsc_tools/utilities/enums.dart';
import 'package:dsc_tools/utilities/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
        color: const Color(0xFF707783),
        align: TextAlign.center,
      )
    ]);
  }
}
