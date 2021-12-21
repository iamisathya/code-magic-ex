import 'package:dsc_tools/ui/screens/open_po/order_list/components/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../constants/colors.dart';
import '../../../../../utilities/images.dart';
import '../controller/openpo_order_success.controller.dart';

class Body extends StatelessWidget {
  Body({
    Key? key,
  }) : super(key: key);

  final OpenPoOrderResultController _controller =
      Get.put(OpenPoOrderResultController());

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Text(
              "thank_you".tr,
              style: const TextStyle(fontSize: 24, color: AppColor.kBlackColor),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Text(
              "order_place_success_msg".tr,
              style: const TextStyle(
                  fontSize: 14, color: AppColor.kWhiteSmokeColor),
            ),
          ),
          const SizedBox(height: 55),
          SvgPicture.asset(
              _controller.result.isSuccess
                  ? kOrderSuccessImage
                  : kOrderWaringImage,
              height: 232,
              semanticsLabel: "add_po".tr),
          const SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Text(
              "${"distributor_id".tr} : ${_controller.result.distributorId}",
              style: const TextStyle(fontSize: 14, color: AppColor.charcoal),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Text(
              "${"po_number".tr} : ${_controller.result.poNumber}",
              style: const TextStyle(fontSize: 14, color: AppColor.charcoal),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            child:
                AppButton(title: "go_to_home".tr, onTap: _controller.gotoHome),
          )
        ],
      ),
    );
  }
}
