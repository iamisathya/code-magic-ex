import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../constants/colors.dart';
import '../../../../utilities/images.dart';

class NoRecordFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(kNoRecordFoundImage,
              width: 255, height: 225, semanticsLabel: 'no records found'),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Text(
              "no_matching_record_found".tr,
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: AppColor.darkLiver),
            ),
          )
        ],
      ),
    );
  }
}
