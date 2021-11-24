import 'package:dsc_tools/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utilities/enums.dart';
import '../../../global/theme/app_text.dart';
import '../controller/salesreports.home.controller.dart';

class RowDateSelector extends StatelessWidget {
  final SalesReportHomeController controller =
      Get.put(SalesReportHomeController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 94,
      color: AppColor.gainsboro,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Obx(
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const AppText(
                                  text: "Start Date: ",
                                  color: AppColor.cadet,
                                  fontSize: 10),
                              AppText(
                                  text: controller.startDateString.value,
                                  color: AppColor.charcoal),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Flexible(
              child: Obx(
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const AppText(
                                  text: "End Date: ",
                                  color: AppColor.charcoal,
                                  fontSize: 10),
                              AppText(
                                  text: controller.endDateString.value,
                                  color: AppColor.charcoal),
                            ],
                          ),
                        ],
                      ),
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
