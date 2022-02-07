import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../utilities/enums.dart';
import '../../../../utilities/user_session.dart';
import '../../../global/theme/text_view.dart';
import '../../barcode/barcode.screen.dart';
import '../../easy_ship/easyship.screen.dart';
import '../../enroll/enrollhome.screen.dart';
import '../../inventory/inventory.dart';
import '../../login/login.screen.dart';
import '../../open_po/order_list/home_screen.dart';
import '../../order_entry/orderentry.screen.dart';
import '../../sales_reports/salesreports.screen.dart';

class DashboardMenuItem extends StatelessWidget {
  // final DashboardController controller = Get.put(DashboardController());
  const DashboardMenuItem({Key? key, required this.item, required this.isLeft})
      : super(key: key);

  final DashboardMenuItemModel item;
  final bool isLeft;

  void onLogout() {
    FirebaseAnalytics()
        .logEvent(name: 'log_out', parameters: {'type': "normal_signout"});
    UserSessionManager.shared.removeUserInfoFromDB();
    Get.offAll(() => LoginScreen());
  }

  void onPressMenu(String option) {
    switch (option) {
      case "sign_out":
        onLogout();
        break;
      case "open_po":
        Get.to(() => OpenPoHomeScreen());
        break;
      case "enroll":
        Get.to(() => EnrollHomeScreen());
        break;
      case "order_entry":
        Get.to(() => OrderEntryHomeScreen());
        break;
      case "inventory":
        Get.to(() => InventoryHomeScreen());
        break;
      case "sales_report":
        Get.to(() => SalesReportsHomeScreen());
        break;
      case "easyship_report":
        Get.to(() => EasyShipHomeScreen());
        break;
      case "barcode":
        Get.to(() => BarcodeHomeScreen());
        break;
      default:
        debugPrint("unknown path");
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressMenu(item.title),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(isLeft ? 25 : 5),
              bottomLeft: Radius.circular(isLeft ? 25 : 5),
              topRight: Radius.circular(isLeft ? 5 : 25),
              bottomRight: Radius.circular(isLeft ? 5 : 25)),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 15),
              child: Container(
                height: 45,
                width: 45,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: item.color),
                child: SizedBox(
                    child: SvgPicture.asset(item.icon,
                        height: 10, width: 10, fit: BoxFit.scaleDown)),
              ),
            ),
            Expanded(
              child: AppText(
                  text: item.title.tr, style: TextTypes.bodyText1, maxLines: 2),
            )
          ],
        ),
      ),
    );
  }
}

class DashboardMenuItemModel {
  // final DashboardController controller = Get.put(DashboardController());
  const DashboardMenuItemModel(
      {required this.title,
      required this.color,
      required this.page,
      required this.icon});

  final String title;
  final Color color;
  final String icon;
  final String page;
}
