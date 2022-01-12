import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../utilities/enums.dart';
import '../../../../../global/theme/text_view.dart';
import '../../../../../global/widgets/page_title.dart';
import '../controller/enrollment.terms.controller.dart';

class Body extends StatelessWidget {
  final EnrollmentTermsController controller =
      Get.put(EnrollmentTermsController());

  Body({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
          child: Column(
        children: [
          PageTitle(title: "terms_and_conditions".tr),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: controller
                    .getTermsConditions()
                    .map((e) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: AppText(text: e, style: TextTypes.bodyText1),
                        ))
                    .toList()),
          ),
        ],
      )),
    );
  }
}
