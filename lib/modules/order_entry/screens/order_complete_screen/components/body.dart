import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../../data/enums.dart';
import '../../../../../../widgets/text_view.dart';
import '../../../../../core/values/colors.dart';
import '../../../../../utils/extensions.dart';
import '../../../../../utils/images.dart';
import '../../../../open_po/order_list/components/app_button.dart';
import '../../../controllers/ordercomplete.controller.dart';

class Body extends StatelessWidget {
  final OrderCompleteController _controller =
      Get.put(OrderCompleteController());
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              AppText(text: "thank_you".tr, style: TextTypes.headline4),
              const SizedBox(height: 10),
              AppText(
                  text: "order_place_success_msg".tr,
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
                child: AppButton(
                    title: "go_to_home".tr, onTap: _controller.gotoHome),
              )
            ],
          ),
        ],
      ),
    );
  }
}
