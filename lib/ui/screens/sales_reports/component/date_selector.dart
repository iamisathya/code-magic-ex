import 'package:dsc_tools/ui/global/theme/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

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
      color: const Color(0xFFF5F5F5),
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
                      color: const Color(0xFFFFFFFF),
                      border: Border.all(color: const Color(0xFF384250)),
                      borderRadius: BorderRadius.circular(3)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: controller.startDateString.value == ""
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const AppText(
                                  text: "Start Date: ",
                                  color: Color(0xFF384250)),
                              SvgPicture.asset(kPlusIcon,
                                  color: const Color(0xFF384250),
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
                                  const AppText(
                                      text: "Start Date: ",
                                      color: Color(0xFF606975),
                                      fontSize: 12),
                                  AppText(
                                      text: controller.startDateString.value,
                                      color: const Color(0xFF384250)),
                                ],
                              ),
                              SvgPicture.asset(kPlusIcon,
                                  color: const Color(0xFF384250),
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
                      color: const Color(0xFFFFFFFF),
                      border: Border.all(color: const Color(0xFF384250)),
                      borderRadius: BorderRadius.circular(3)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: controller.endDateString.value == ""
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const AppText(
                                  text: "End Date: ", color: Color(0xFF384250)),
                              SvgPicture.asset(kPlusIcon,
                                  color: const Color(0xFF384250),
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
                                  const AppText(
                                      text: "End Date: ",
                                      color: Color(0xFF384250),
                                      fontSize: 12),
                                  AppText(
                                      text: controller.endDateString.value,
                                      color: const Color(0xFF384250)),
                                ],
                              ),
                              SvgPicture.asset(kPlusIcon,
                                  color: const Color(0xFF384250),
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
