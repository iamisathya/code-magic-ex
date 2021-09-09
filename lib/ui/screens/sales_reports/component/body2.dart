import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../models/order_list_rmas.dart';
import '../../../../utilities/images.dart';
import '../../../global/widgets/sign_out_button.dart';
import '../../inventory/component/no_record_found.dart';
import '../../inventory/component/page_title.dart';
import '../controller/salesreports.home.controller.dart';
import 'date_selector.dart';
import 'option_bar.dart';
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
        if (!controller.isLoading.value &&
            controller.allOrdersAndRmas.value.orders.isNotEmpty)
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: OptionBar(),
              ),
              Obx(() => ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount:
                      controller.allOrdersAndRmas.value.orders[0].items.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    final OrderItem item = controller
                        .allOrdersAndRmas.value.orders[0].items[index];
                    return SalesReportItem(item: item);
                  })),
            ],
          ),
        if (!controller.isLoading.value &&
            controller.allOrdersAndRmas.value.orders.isEmpty)
          NoRecordFound()
      ]),
    );
  }
}
