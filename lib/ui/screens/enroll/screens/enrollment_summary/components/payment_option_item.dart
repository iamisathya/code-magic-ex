import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../constants/colors.dart';
import '../../../../../../utilities/enums.dart';
import '../../../../../global/theme/text_view.dart';

class PaymentOptionItem extends StatelessWidget {
  const PaymentOptionItem({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPress,
    required this.isActive,
  }) : super(key: key);

  final String title;
  final String icon;
  final bool isActive;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 50,
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          gradient: LinearGradient(
            colors: [
              if (isActive) AppColor.dodgerBlue else AppColor.kWhiteColor,
              if (isActive) AppColor.dodgerBlue else AppColor.kWhiteColor,
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 0.0),
            stops: const [0.0, 1.0],
          ),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 90,
              child: SvgPicture.asset(icon,
                  color: isActive ? AppColor.kWhiteColor : AppColor.cadet),
            ),
            Expanded(
              child: AppText(
                text: title,
                style: TextTypes.bodyText1,
                color: isActive ? AppColor.kWhiteColor : AppColor.kBlackColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
