import 'package:dsc_tools/models/order_list_rmas.dart';
import 'package:dsc_tools/ui/global/widgets/sign_out_button.dart';
import 'package:dsc_tools/ui/screens/inventory/component/page_title.dart';
import 'package:dsc_tools/ui/screens/open_po/home/components/loader.dart';
import 'package:dsc_tools/ui/screens/sales_reports/component/option_bar.dart';
import 'package:dsc_tools/ui/screens/sales_reports/controller/salesreports.home.controller.dart';
import 'package:dsc_tools/utilities/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

import 'date_selector.dart';
import 'sales_report.item.dart';
import 'tool_bar.dart';

class Body2 extends StatelessWidget {
  final SalesReportHomeController controller =
      Get.put(SalesReportHomeController());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        const PageTitle(title: "Sales Report"),
        SalesReportToolBar(),
        DateSelector(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SignOutButton(
            title: "Find Sales Reports",
            onPress: () => controller.getAllSalesReports(),
            bgColor: const Color(0xFF1C9CFC),
            fgColor: const Color(0xFFFFFFFF),
            icon: kArrowIcon,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: OptionBar(),
        ),
        if(!controller.isLoading.value)
        Obx(() => ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: controller.allOrdersAndRmas.value.orders[0].items.length,
            itemBuilder: (BuildContext ctxt, int index) {
              final OrderItem item =
                  controller.allOrdersAndRmas.value.orders[0].items[index];
              return SalesReportItem(item: item);
            })),
      ]),
    );
  }
}
