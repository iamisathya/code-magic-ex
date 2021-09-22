import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../utilities/enums.dart';
import '../../../../utilities/extensions.dart';
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
            Obx(() => GestureDetector(
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              "Start Date: ${controller.startDate.value.yyyyMMdd()}",
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(color: const Color(0xFF384250))),
                          SvgPicture.asset(kPlusIcon,
                              color: const Color(0xFF384250),
                              width: 14,
                              semanticsLabel: 'plus icon'),
                        ],
                      ),
                    ),
                  ),
                )),
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              "End Date: ${controller.endDate.value.yyyyMMdd()}",
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(color: const Color(0xFF384250))),
                          SvgPicture.asset(kPlusIcon,
                              color: const Color(0xFF384250),
                              width: 14,
                              semanticsLabel: 'plsu icon'),
                        ],
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
