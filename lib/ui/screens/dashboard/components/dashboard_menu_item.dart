import 'package:dsc_tools/ui/global/theme/text_view.dart';
import 'package:dsc_tools/ui/screens/login/login.screen.dart';
import 'package:dsc_tools/utilities/enums.dart';
import 'package:dsc_tools/utilities/user_session.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class DashboardMenuItem extends StatelessWidget {
  // final DashboardController controller = Get.put(DashboardController());
  const DashboardMenuItem(
      {Key? key,
      required this.title,
      required this.color,
      required this.page,
      required this.icon})
      : super(key: key);

  final String title;
  final Color color;
  final String icon;
  final String page;

  void onLogout() {
    FirebaseAnalytics()
        .logEvent(name: 'log_out', parameters: {'type': "normal_signout"});
    UserSessionManager.shared.removeUserInfoFromDB();
    Get.offAll(() => LoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => page == "onLogout" ? onLogout() : Get.toNamed(page),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25), color: Colors.white),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(shape: BoxShape.circle, color: color),
                child: SizedBox(
                    child: SvgPicture.asset(icon,
                        height: 10, width: 10, fit: BoxFit.scaleDown)),
              ),
            ),
            AppText(
                text: title, style: TextTypes.bodyText1, align: TextAlign.end)
          ],
        ),
      ),
    );
  }
}
