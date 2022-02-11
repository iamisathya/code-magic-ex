import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../../data/enums.dart';
import '../../../../../../widgets/text_view.dart';
import '../../../../../core/values/colors.dart';
import '../../../../../utils/images.dart';
import '../../../../../widgets/gradient_button.dart';
import '../controller/enrolment_complete_controller.dart';

class EnrolmentErrorScreen extends StatelessWidget {
  final EnrolmentCompleteController controller =
      Get.put(EnrolmentCompleteController());
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: AppText(
                      text: "enrollment_error", style: TextTypes.headline4)),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: AppText(
                    text: "page_has_some_error".tr,
                    style: TextTypes.bodyText1,
                    color: AppColor.darkLiver),
              ),
            ],
          ),
          SvgPicture.asset(kEnrolmentErrorImage,
              height: 232, semanticsLabel: "enrolment_error".tr),
          GradientButton(onClick: () => controller.onClickTryAgain())
        ],
      ),
    );
  }
}
