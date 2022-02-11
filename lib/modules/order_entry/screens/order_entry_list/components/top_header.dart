import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../../data/enums.dart';
import '../../../../../../data/provider/globals.dart';
import '../../../../../../widgets/text_view.dart';
import '../../../../../core/styles/border.dart';
import '../../../../../core/values/colors.dart';
import '../../../../../utils/images.dart';
import '../../../controllers/orderentry.product.list.controller.dart';

class TopHeader extends StatelessWidget {
  final OrderEntryProductListController controller =
      Get.put(OrderEntryProductListController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText(text: "categories".tr, style: TextTypes.headline4),
            renderCart()
          ],
        ),
      ),
    );
  }

  Row renderCart() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          width: 20,
          height: 20,
          decoration:
              borderRadiusWithColor(bgColor: AppColor.lightCrimson, radius: 10),
          child: Obx(() => AppText(
              text: controller.cartProducts.length.toString(),
              color: Colors.white,
              align: TextAlign.center,
              style: TextTypes.caption)),
        ),
        SvgPicture.asset(
          kOrderEntryCartIcon,
          width: 20,
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() => AppText(
                  text: "${controller.totalCartPv.toString()} ${"pv".tr}",
                  style: TextTypes.caption)),
              Obx(() => AppText(
                  text:
                      "${controller.totalCartPrice.toString()} ${Globals.currency}",
                  style: TextTypes.caption)),
            ],
          ),
        ),
      ],
    );
  }
}
