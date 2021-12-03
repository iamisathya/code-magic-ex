import 'package:dsc_tools/ui/screens/open_po/order_list/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/colors.dart';
import '../../../../utilities/images.dart';
import '../../../../utilities/user_session.dart';
import '../../../global/widgets/sign_out_button.dart';
import '../../barcode/barcode.screen.dart';
import '../../easy_ship/easyship.screen.dart';
import '../../enroll/enrollhome.screen.dart';
import '../../inventory/inventory.screen.dart';
import '../../order_entry/orderentry.screen.dart';
import '../../sales_reports/salesreports.screen.dart';
import '../components/dashboard.header.dart';
import '../components/menu.option.dart';
import '../components/profile.image.dart';
import '../controller/dashboard.controller.dart';

class Body extends StatelessWidget {
  final DashboardController controller = Get.put(DashboardController());
  static const String routeName = '/dashboardHomePage';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: AppColor.kWhiteColor,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  height: 300,
                  color: AppColor.kWhiteColor,
                  child: Stack(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(128)),
                          color: AppColor.brightGray,
                        ),
                        height: 300,
                        child: Column(
                          children: [
                            DashboardHeader(),
                            const SizedBox(
                              height: 10,
                            ),
                            ProfileImage(),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                                UserSessionManager
                                    .shared.userInfo!.humanName.fullName,
                                style: Theme.of(context).textTheme.headline4),
                            const SizedBox(height: 10),
                            Text(
                                UserSessionManager.shared.userInfo!.id.unicity
                                    .toString(),
                                style: Theme.of(context).textTheme.subtitle2),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 26,
                ),
                Obx(
                  () => Column(
                    children: [
                      MenuOption(
                          icon: kOpenPoIcon,
                          optionTitle: "open_po".tr,
                          onPress: () => Get.to(() => OpenPoHomeScreen())),
                      MenuOption(
                          icon: kEnrollIcon,
                          optionTitle: "enroll".tr,
                          onPress: () => Get.to(
                              () => EnrollHomeScreen())), //EnrollHomeScreen
                      MenuOption(
                          icon: kOrderEntryIcon,
                          optionTitle: "order_entry".tr,
                          onPress: () => Get.to(() => OrderEntryHomeScreen())),
                      MenuOption(
                          icon: kInventoryIcon,
                          optionTitle: "inventory".tr,
                          onPress: () => Get.to(() => InventoryHomeScreen())),
                      MenuOption(
                          icon: kSalesReportIcon,
                          trailingIcon: controller.isReportOptionShown.value
                              ? kCrossArrowIcon
                              : kArrowIcon,
                          optionTitle: "report".tr,
                          onPress: () =>
                              controller.isReportOptionShown.toggle()),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 200),
                        child: Column(
                          key: UniqueKey(),
                          children: [
                            if (controller.isReportOptionShown.value)
                              Column(children: [
                                MenuOption(
                                    optionTitle: "sales_report".tr,
                                    onPress: () =>
                                        Get.to(() => SalesReportsHomeScreen())),
                                MenuOption(
                                    optionTitle: "easyship_report".tr,
                                    onPress: () =>
                                        Get.to(() => EasyShipHomeScreen())),
                              ])
                            else
                              SizedBox(key: UniqueKey()),
                          ],
                        ),
                      ),
                      MenuOption(
                          icon: kBarcodeIcon,
                          optionTitle: "barcode".tr,
                          onPress: () => Get.to(() => BarcodeHomeScreen())),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: SignOutButton(
                    title: "sign_out".tr,
                    fontSize: 24,
                    height: 54,
                    onPress: () => controller.onLogout(context),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
