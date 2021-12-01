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
              AppText(text: "Thank You", style: TextTypes.headline4),
              SizedBox(height: 10),
              AppText(
                  text: "Your order has been placed successfully!",
                  style: TextTypes.subtitle2,
                  color: AppColor.cadet),
            ],
          ),
          SvgPicture.asset(kOrderEntrySuccessImage, height: 224),
          Column(
            children: [
              AppText(
                  text:
                      "Distributor ID : ${_controller.orderResponse.customer.id.unicity}",
                  style: TextTypes.subtitle2,
                  color: AppColor.cadet),
              const SizedBox(height: 10),
              AppText(
                  text:
                      "Order Number: ${_controller.orderResponse.id.unicity.retrieveOrderId()}",
                  style: TextTypes.subtitle2,
                  color: AppColor.cadet),
            ],
          ),
          Column(
            children: [
              const AppText(text: "Scan Order", style: TextTypes.subtitle1),
              const SizedBox(height: 10),
              SvgPicture.asset(kOrderEntryBarcodeImage, height: 60, width: 100),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 20.0),
                      child: Text("Go to Home"),
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
