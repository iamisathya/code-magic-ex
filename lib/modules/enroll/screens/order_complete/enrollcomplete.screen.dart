import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/values/colors.dart';
import '../../../../widgets/transparent_app_bar.dart';
import '../../bloc/enrollcomplete.controller.dart';
import 'components/body.dart';

class EnrollComplete extends StatelessWidget {
  final EnrollCompleteController controller =
      Get.put(EnrollCompleteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kBackground,
      appBar: TransAppBar(title: "enroll_complete".tr),
      body: SafeArea(child: Body()),
    );
  }
}
