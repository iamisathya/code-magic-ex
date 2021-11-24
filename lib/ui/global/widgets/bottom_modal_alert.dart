import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/colors.dart';
import '../../../utilities/enums.dart';
import '../../screens/order_entry/orderentry.screen.dart';
import '../theme/text_view.dart';

class BottomModalAlert extends StatelessWidget {
  const BottomModalAlert(
      {Key? key,
      required this.negetiveTitle,
      required this.positiveTitle,
      required this.onPositiveTap,
      required this.onNegetiveTap,
      required this.title,
      this.showTitle = false,
      required this.subTitle,
      required this.assetPath})
      : super(key: key);

  final String negetiveTitle;
  final String positiveTitle;
  final VoidCallback onPositiveTap;
  final VoidCallback onNegetiveTap;
  final String title;
  final bool showTitle;
  final String subTitle;
  final String assetPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 448,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3), color: Colors.white),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            SvgPicture.asset(assetPath, height: 198, width: 234),
            if (showTitle)
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: AppText(
                  text: title,
                  style: TextTypes.headline6,
                  color: AppColor.charcoal,
                ),
              ),
            AppText(
              align: TextAlign.center,
              text: subTitle,
              style: TextTypes.subtitle2,
              color: AppColor.charcoal,
            ),
            SizedBox(
              height: 50,
              child: Row(
                children: <Widget>[
                  Flexible(
                    child: NegetiveButton(
                        title: negetiveTitle, onTap: onNegetiveTap),
                  ),
                  Flexible(
                    child: PositiveButton(
                        title: positiveTitle, onTap: onPositiveTap),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
