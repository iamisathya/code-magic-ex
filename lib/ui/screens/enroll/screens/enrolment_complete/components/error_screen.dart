import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../../constants/colors.dart';
import '../../../../../../utilities/enums.dart';
import '../../../../../../utilities/images.dart';
import '../../../../../global/theme/text_view.dart';
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
          GestureDetector(
            onTap: controller.onClickTryAgain,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 53),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: const LinearGradient(
                      colors: [AppColor.dodgerBlue, AppColor.skyBlue],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight)),
              child: AppText(
                text: "try_again".tr,
                style: TextTypes.headline6,
                color: AppColor.kWhiteColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
