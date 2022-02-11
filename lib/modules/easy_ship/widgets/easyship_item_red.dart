import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../data/enums.dart';
import '../../../../widgets/text_view.dart';
import '../../../core/values/colors.dart';
import '../../../utils/extensions.dart';
import '../../../utils/images.dart';

class EasyshipItemColored extends StatelessWidget {
  const EasyshipItemColored({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 85),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColor.mistyRose,
        ),
        child: Stack(children: [
          Positioned(
              left: 70,
              top: 34,
              child: SvgPicture.asset(kCheckErrorIcon, width: 20)),
          Row(children: [
            SizedBox(
              width: 80,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(children: [
                  AppText(text: "index".toString(), style: TextTypes.headline6),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: AppText(
                      text: "date".asMMM,
                      style: TextTypes.headline4,
                      color: AppColor.sunglow,
                    ),
                  ),
                  AppText(
                    text: "date".asYYYY,
                    style: TextTypes.caption,
                    color: AppColor.darkLiver,
                  ),
                ]),
              ),
            ),
            Expanded(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Column(
                  children: const [
                    AppText(
                        text: "Promotion Easyship Set",
                        style: TextTypes.bodyText1,
                        color: AppColor.darkLiver), //! hardcoded
                    SizedBox(height: 10),
                    AppText(
                        text: "None - Reset",
                        style: TextTypes.headline6), //! hardcoded
                  ],
                ),
              ),
            ),
          ]),
        ]),
      ),
    );
  }
}
