import 'package:dsc_tools/ui/global/theme/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../constants/colors.dart';
import '../../../../utilities/enums.dart';
import '../../../../utilities/images.dart';
import '../controller/salesreports.home.controller.dart';

class DateSelector extends StatelessWidget {
  final SalesReportHomeController controller =
      Get.put(SalesReportHomeController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 158,
      color: AppColor.gainsboro,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(
              () => GestureDetector(
                onTap: () => controller.onTapDateSelector(
                    DateSelectorType.startDate, context),
                child: Container(
                  height: 54,
                  decoration: BoxDecoration(
                      color: AppColor.kWhiteColor,
                      borderRadius: BorderRadius.circular(3)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: controller.startDateString.value == ""
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppText(
                                  style: TextTypes.bodyText1,
                                  text: "${"start_date".tr}: ",
                                  color: AppColor.charcoal),
                              SvgPicture.asset(kPlusIcon,
                                  color: AppColor.charcoal,
                                  width: 14,
                                  semanticsLabel: 'plus icon'),
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  AppText(
                                    text: "${"start_date".tr}: ",
                                    color: AppColor.cadet,
                                    style: TextTypes.caption,
                                  ),
                                  AppText(
                                      style: TextTypes.bodyText1,
                                      text: controller.startDateString.value,
                                      color: AppColor.charcoal),
                                ],
                              ),
                              SvgPicture.asset(kPlusIcon,
                                  color: AppColor.charcoal,
                                  width: 14,
                                  semanticsLabel: 'plus icon'),
                            ],
                          ),
                  ),
                ),
              ),
            ),
            Obx(
              () => GestureDetector(
                onTap: () => controller.onTapDateSelector(
                    DateSelectorType.endDate, context),
                child: Container(
                  height: 54,
                  decoration: BoxDecoration(
                      color: AppColor.kWhiteColor,
                      borderRadius: BorderRadius.circular(3)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: controller.endDateString.value == ""
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppText(
                                  style: TextTypes.bodyText1,
                                  text: "${"end_date".tr}: ",
                                  color: AppColor.charcoal),
                              SvgPicture.asset(kPlusIcon,
                                  color: AppColor.charcoal,
                                  width: 14,
                                  semanticsLabel: 'plsu icon'),
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  AppText(
                                    text: "${"end_date".tr}: ",
                                    color: AppColor.charcoal,
                                    style: TextTypes.caption,
                                  ),
                                  AppText(
                                      style: TextTypes.bodyText1,
                                      text: controller.endDateString.value,
                                      color: AppColor.charcoal),
                                ],
                              ),
                              SvgPicture.asset(kPlusIcon,
                                  color: AppColor.charcoal,
                                  width: 14,
                                  semanticsLabel: 'plsu icon'),
                            ],
                          ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
