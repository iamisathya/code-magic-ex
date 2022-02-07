import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../navigation/router.dart';
import '../../../../utilities/enums.dart';
import '../../../../utilities/images.dart';
import '../../../global/theme/text_view.dart';

class TermsConditionsSetting extends StatelessWidget {
  const TermsConditionsSetting({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(ScreenPaths.termsConditions),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(kProfileTermsConditionIcon,
                      width: 44, height: 44),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: AppText(
                        text: 'terms_and_conditions'.tr,
                        style: TextTypes.headline5),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
