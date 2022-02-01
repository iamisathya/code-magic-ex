import 'package:dsc_tools/constants/colors.dart';
import 'package:dsc_tools/ui/global/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoConnectionScreen extends StatelessWidget {
  const NoConnectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: PrimaryButton(
            press: () {}, text: "try_again".tr, color: AppColor.ateneoBlue));
  }
}
