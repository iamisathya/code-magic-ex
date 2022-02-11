import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../data/enums.dart';
import '../../../../widgets/text_view.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/user_session.dart';
import '../../login/login_home/login_home.dart';

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
        Get.toNamed(Routes.OPEN_PO);
        break;
      case "enroll":
        Get.toNamed(Routes.ENROLL);
        break;
      case "order_entry":
        Get.toNamed(Routes.ORDER_ENTRY);
        break;
      case "inventory":
        Get.toNamed(Routes.INVENTORY);
        break;
      case "sales_report":
        Get.toNamed(Routes.SALES_REPORT);
        break;
      case "easyship_report":
        Get.toNamed(Routes.EASY_SHIP_REPORT);
        break;
      case "barcode":
        Get.toNamed(Routes.BARCODE);
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
