import 'package:dsc_tools/ui/global/theme/text_view.dart';
import 'package:dsc_tools/utilities/constants.dart';
import 'package:dsc_tools/utilities/enums.dart';
import 'package:dsc_tools/utilities/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../orderentry.screen.dart';

class DiscardAlert extends StatelessWidget {
  const DiscardAlert({Key? key}) : super(key: key);

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
            SvgPicture.asset(kTrashImage, height: 198, width: 234),
            const AppText(
              text: "“Your current changes will not be saved”",
              style: TextTypes.headline6,
              color: Color(0xFF384250),
            ),
            SizedBox(
              height: 50,
              child: Row(
                children: <Widget>[
                  Flexible(
                    child: NegetiveButton(onTap: () => Navigator.pop(context)),
                  ),
                  Flexible(
                    child: PositiveButton(onTap: () {}),
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
