import 'package:dsc_tools/ui/screens/dashboard/controller/dashboard.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'sliver_grid_delegate_with_fixed_cross_axis_count_and_fixed_height.dart';

class DashboardMenu extends StatelessWidget {
  final DashboardController controller = Get.put(DashboardController());
  DashboardMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
              crossAxisCount: 2, crossAxisSpacing: 5, mainAxisSpacing: 5),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 8,
      itemBuilder: (context, index) {
        return controller.items[index];
      },
    );
  }
}
