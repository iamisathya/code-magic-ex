import 'package:code_magic_ex/ui/screens/enroll/bloc/enroll_complete_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../constants/colors.dart';
import '../../../../../ui/global/widgets/transparent_app_bar.dart';
import '../../../../../utilities/size_config.dart';
import 'components/body.dart';

class EnrollComplete extends StatelessWidget {
  final EnrollCompleteController controller =
      Get.put(EnrollCompleteController());
  static const String routeName = '/enrollComplete';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: AppColor.kBackground,
      appBar: const TransAppBar(title: "Enroll Complete"),
      body: SafeArea(child: Body()),
    );
  }
}
