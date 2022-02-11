import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../data/enums.dart';
import '../../../../widgets/text_view.dart';
import '../../../core/values/colors.dart';

class UserInfoTag extends StatelessWidget {
  const UserInfoTag({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  final String icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 100),
      child: Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: AppColor.kWhiteColor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(icon, width: 20, height: 20),
              ),
              AppText(
                  text: title,
                  style: TextTypes.bodyText1,
                  color: AppColor.charcoal),
            ],
          )),
    );
  }
}
