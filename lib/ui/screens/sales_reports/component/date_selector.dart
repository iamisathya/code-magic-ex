import 'package:dsc_tools/ui/global/widgets/sign_out_button.dart';
import 'package:dsc_tools/ui/screens/sales_reports/controller/salesreports.home.controller.dart';
import 'package:dsc_tools/utilities/enums.dart';
import 'package:dsc_tools/utilities/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DateSelector extends StatelessWidget {
  final SalesReportHomeController controller =
      Get.put(SalesReportHomeController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
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
                    height: 40,
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
                              "Start Date: ${DateFormat('yyyy-MM-dd').format(controller.startDate.value).toString()}",
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
                    height: 40,
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
                              "End Date: ${DateFormat('yyyy-MM-dd').format(controller.endDate.value).toString()}",
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
