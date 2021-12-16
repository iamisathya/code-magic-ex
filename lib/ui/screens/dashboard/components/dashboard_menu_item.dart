import 'package:dsc_tools/ui/global/theme/text_view.dart';
import 'package:dsc_tools/utilities/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class DashboardMenuItem extends StatelessWidget {
  const DashboardMenuItem(
      {Key? key,
      required this.title,
      // required this.onPress,
      required this.color,
      required this.page,
      required this.icon})
      : super(key: key);

  final String title;
  // final VoidCallback onPress;
  final Color color;
  final String icon;
  final dynamic page;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => page()),
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
