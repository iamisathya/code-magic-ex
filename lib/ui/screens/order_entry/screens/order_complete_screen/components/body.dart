import 'package:dsc_tools/ui/screens/order_entry/controllers/ordercomplete.controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../../constants/colors.dart';
import '../../../../../../utilities/enums.dart';
import '../../../../../../utilities/extensions.dart';
import '../../../../../../utilities/images.dart';
import '../../../../../global/theme/text_view.dart';

class Body extends StatelessWidget {
  final OrderCompleteController _controller = Get.put(OrderCompleteController());
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: const [
              AppText(text: "Thank You", style: TextTypes.headline4), //!hardcoded
              SizedBox(height: 10),
              AppText(
                  text: "Your order has been placed successfully!", //!hardcoded
                  style: TextTypes.subtitle2,
                  color: AppColor.cadet),
            ],
          ),
          SvgPicture.asset(kOrderEntrySuccessImage, height: 224),
          Column(
            children: [
              AppText(
                  text:
                      "${"distributor_id".tr} : ${_controller.orderResponse.customer.id.unicity}",
                  style: TextTypes.subtitle2,
                  color: AppColor.cadet),
              const SizedBox(height: 10),
              AppText(
                  text:
                      "${"order_number".tr}: ${_controller.orderResponse.id.unicity.retrieveOrderId()}",
                  style: TextTypes.subtitle2,
                  color: AppColor.cadet),
            ],
          ),
          Column(
            children: [
              AppText(text: "scan_order".tr, style: TextTypes.subtitle1),
              const SizedBox(height: 10),
              SvgPicture.asset(kOrderEntryBarcodeImage, height: 60, width: 100),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Text("go_to_home".tr),
                    ),
                    GestureDetector(
                        onTap: _controller.gotoHome,
                        child: SvgPicture.asset(kBottomTabHomeIcon, width: 36)),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
