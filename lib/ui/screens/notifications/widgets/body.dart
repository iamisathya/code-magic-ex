import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constants/colors.dart';
import '../../../../utilities/enums.dart';
import '../../../../utilities/images.dart';
import '../../../global/theme/text_view.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 20,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: SvgPicture.asset(kCameraIcon, width: 33),
                title: const AppText(
                    text: "This is a notification", style: TextTypes.headline6),
                subtitle: const AppText(
                    text:
                        "Now as our Sectioned ListView is completed, let’s use it into the home screen to get the expected result.",
                    style: TextTypes.subtitle2,
                    color: AppColor.charcoal),
                contentPadding: const EdgeInsets.all(12),
              );
            })
      ]),
    );
  }
}
