import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/dashboard.controller.dart';
import 'dashboard_menu_item.dart';
import 'sliver_grid_delegate_with_fixed_cross_axis_count_and_fixed_height.dart';

class DashboardMenu extends StatelessWidget {
  final DashboardController controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
              crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: controller.dashboardMenuItems.length,
      itemBuilder: (context, index) {
        final DashboardMenuItemModel item = controller.dashboardMenuItems[index];
        return DashboardMenuItem(item: item);
      },
    );
  }
}
