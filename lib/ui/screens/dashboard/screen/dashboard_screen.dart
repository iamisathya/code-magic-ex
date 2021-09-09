import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utilities/images.dart';
import '../../../../utilities/user_session.dart';
import '../../../global/widgets/scrollable.dart';
import '../../../global/widgets/sign_out_button.dart';
import '../../barcode/barcode.screen.dart';
import '../../enroll/enrollhome.screen.dart';
import '../../inventory/inventory.screen.dart';
import '../../open_po/home/home.screen.dart';
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
        color: const Color(0xFFFFFFFF),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  height: 300,
                  color: const Color(0xFFFFFFFF),
                  child: Stack(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(128)),
                          color: Color(0xFFE3E8ED),
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
                Column(
                  children: [
                    MenuOption(
                        icon: kOpenPoIcon,
                        optionTitle: "Open PO",
                        onPress: () => Get.to(() => OpenPOHomeScreen())),
                    MenuOption(
                        icon: kEnrollIcon,
                        optionTitle: "Enroll",
                        onPress: () => Get.to(() => EnrollHomeScreen())),
                    MenuOption(
                        icon: kOrderEntryIcon,
                        optionTitle: "Order Entry",
                        onPress: () => Get.to(() => OrderEntryHomeScreen())),
                    MenuOption(
                        icon: kInventoryIcon,
                        optionTitle: "Inventory",
                        onPress: () => Get.to(() => InventoryHomeScreen())),
                    MenuOption(
                        icon: kSalesReportIcon,
                        optionTitle: "Sales Report",
                        onPress: () => Get.to(() => SalesReportsHomeScreen())),
                    MenuOption(
                        icon: kEasyShipMenuIcon,
                        optionTitle: "Easyship Report",
                        onPress: () => Get.to(() => EasyShipHomePage())),
                    MenuOption(
                        icon: kBarcodeIcon,
                        optionTitle: "Barcode",
                        onPress: () => Get.to(() => BarcodeHomeScreen())),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: SignOutButton(
                    title: "Sign Out",
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
