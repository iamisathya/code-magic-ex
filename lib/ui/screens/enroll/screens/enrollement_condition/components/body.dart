import 'package:dsc_tools/ui/global/theme/text_view.dart';
import 'package:dsc_tools/ui/screens/enroll/screens/enrollement_condition/controller/enrollment.terms.controller.dart';
import 'package:dsc_tools/utilities/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../inventory/component/page_title.dart';

class Body extends StatelessWidget {
  final EnrollmentTermsController controller = Get.put(EnrollmentTermsController());

  Body({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
          child: Column(
        children: [
          const PageTitle(title: "Terms & conditions"),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: controller.getTermsConditions()
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
