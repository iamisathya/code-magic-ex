import 'package:dsc_tools/constants/colors.dart';
import 'package:dsc_tools/ui/screens/enroll/screens/enrolment_complete/controller/enrolment_complete_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../../utilities/enums.dart';
import '../../../../../../utilities/images.dart';
import '../../../../../global/theme/text_view.dart';

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
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: AppText(
                    text: "Enrollment Error", style: TextTypes.headline4),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: AppText(
                    text: "This Page has been Error!",
                    style: TextTypes.bodyText1,
                    color: AppColor.darkLiver),
              ),
            ],
          ),
          SvgPicture.asset(kEnrolmentErrorImage,
              height: 232, semanticsLabel: "Enrolment error!"),
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
              child: const AppText(
                text: "Try Again!",
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
