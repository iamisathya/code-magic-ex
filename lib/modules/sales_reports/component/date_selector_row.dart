import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/enums.dart';
import '../../../core/values/colors.dart';
import '../../../widgets/text_view.dart';
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
                              AppText(
                                  text: "${"end_date".tr}: ",
                                  style: TextTypes.caption,
                                  color: AppColor.charcoal),
                              AppText(
                                  style: TextTypes.bodyText1,
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
