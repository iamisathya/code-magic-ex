import 'package:dsc_tools/constants/colors.dart';
import 'package:dsc_tools/ui/global/theme/text_view.dart';
import 'package:dsc_tools/utilities/enums.dart';
import 'package:dsc_tools/utilities/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
                    style: TextTypes.subtitle2, color: AppColor.charcoal),
                contentPadding: const EdgeInsets.all(12),
              );
            })
      ]),
    );
  }
}
