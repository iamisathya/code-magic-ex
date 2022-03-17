import 'package:dsc_tools/core/values/colors.dart';
import 'package:dsc_tools/data/enums.dart';
import 'package:dsc_tools/modules/home/controller/home.controller.dart';
import 'package:dsc_tools/utils/extensions.dart';
import 'package:dsc_tools/widgets/text_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/model/sales_report_item_item.dart';
import '../../../data/model/sales_report_order_item.dart';
import '../../../data/model/sales_report_rma_item.dart';
import '../../../widgets/page_title.dart';
import '../../inventory/inventory_home/widgets/no_record_found.dart';
import '../controller/salesreports.home.controller.dart';
import 'date_selector.dart';
import 'date_selector_row.dart';
import 'sales_report.item.item.dart' hide GrandTotal;
import 'sales_report.order.item.dart';
import 'sales_report.rma.item.dart';
import 'tool_bar.dart';

class Body2 extends StatelessWidget {
  final SalesReportHomeController controller =
      Get.put(SalesReportHomeController());
  final HomeController _homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            PageTitle(title: "sales_report".tr),
            SalesReportToolBar(),
            const SizedBox(height: 5),
            if (controller.activeListLength != 0)
              RowDateSelector()
            else
              DateSelector(),
            if (!controller.isLoading.value && controller.activeListLength != 0)
              Column(
                children: [
                  if (controller.activeTab != "item") _renderTotalContainer(),
                  _renderGridView(),
                ],
              ),
            if (!controller.isLoading.value &&
                controller.activeListLength == 0 &&
                controller.isDataFetched.value)
              NoRecordFound(),
          ],
        ),
      ),
    );
  }

  GridView _renderGridView() {
    const double _crossAxisSpacing = 8;
    final double _aspectRatio = _homeController.isMobileLayout ? 6 : 1.72;
    final int _crossAxisCount = _homeController.isMobileLayout ? 1 : 2;
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: _crossAxisCount,
        crossAxisSpacing: _crossAxisSpacing,
        childAspectRatio: _aspectRatio,
      ),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: controller.activeListLength,
      itemBuilder: (BuildContext ctxt, int index) {
        if (controller.activeTab == "order") {
          final SalesReportOrderItem item = controller.allSalesReports[index];
          return SalesReportEachOrderItem(item: item);
        } else if (controller.activeTab == "rma") {
          final SalesReportRmaItem item = controller.allSalesRmaReports[index];
          return SalesReportEachRmaItem(item: item);
        }
        final SalesReportItemItem item = controller.allSalesItemReports[index];
        return SalesReportEachItemItem(item: item);
      },
    );
  }

  Widget _renderTotalContainer() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: const BoxDecoration(
          color: AppColor.kWhiteColor,
          border: Border(bottom: BorderSide(width: 0.5))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Column(
              children: [
                AppText(
                    text: 'grand_total_price'.tr, style: TextTypes.bodyText1),
                const SizedBox(height: 5),
                AppText(
                    text: controller.totalAmount.value
                        .doubleNumberFormat()
                        .precisionCheck,
                    style: TextTypes.subtitle1)
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                AppText(text: 'grand_total_pv'.tr, style: TextTypes.bodyText1),
                const SizedBox(height: 5),
                AppText(
                    text: controller.totalVolume.value.toString(),
                    style: TextTypes.subtitle1)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
