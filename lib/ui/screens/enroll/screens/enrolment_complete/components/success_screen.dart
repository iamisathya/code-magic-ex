import 'package:dsc_tools/ui/global/widgets/gradient_button.dart';
import 'package:dsc_tools/ui/screens/barcode/barcode.screen.dart';
import 'package:dsc_tools/ui/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../../constants/colors.dart';
import '../../../../../../utilities/enums.dart';
import '../../../../../../utilities/images.dart';
import '../../../../../global/theme/text_view.dart';

class EnrolmentSuccessScreen extends StatelessWidget {
  final String distributorId;
  final String poNumber;

  const EnrolmentSuccessScreen({this.distributorId = "", this.poNumber = ""});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child:
                    AppText(text: "thank_you".tr, style: TextTypes.headline4),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: AppText(
                    text: "order_place_success".tr,
                    style: TextTypes.bodyText1,
                    color: AppColor.darkLiver),
              ),
            ],
          ),
          SvgPicture.asset(kEnrolmentSuccessImage,
              height: 232, semanticsLabel: "Enrolment success!"),
          Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: AppText(
                  text: "${"distributor_id".tr} : $distributorId",
                  style: TextTypes.bodyText1,
                  color: AppColor.charcoal,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: AppText(
                  text: "${"po_number".tr}: $poNumber",
                  style: TextTypes.bodyText1,
                  color: AppColor.charcoal,
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: AppText(
                  text: "scan_barcode".tr,
                  style: TextTypes.bodyText1,
                  color: AppColor.charcoal,
                ),
              ),
              GestureDetector(
                  onTap: () {
                    Get.offAll(() => MainHomeScreen());
                    Get.to(() => BarcodeHomeScreen());
                  },
                  child: SvgPicture.asset(kScanBarCodeImage)),
              const SizedBox(height: 30),
              GradientButton(
                  onClick: () => Get.offAll(() => MainHomeScreen()),
                  buttonText: "goto_home")
            ],
          ),
        ],
      ),
    );
  }
}
