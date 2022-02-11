import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../../data/enums.dart';
import '../../../../../../data/provider/globals.dart';
import '../../../../../../widgets/text_view.dart';
import '../../../../../core/values/colors.dart';
import '../../../../../data/model/cart_products.dart';
import '../../../../../utils/images.dart';
import '../../../../../widgets/cart_counter_view.dart';
import '../../../controllers/enroll.controller.dart';

class EnrollCartItem extends StatelessWidget {
  final EnrollHomeController controller = Get.put(EnrollHomeController());
  final CartProductsItem item;
  final int idx;

  EnrollCartItem({required this.item, required this.idx, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      color: AppColor.kWhiteColor,
      padding: const EdgeInsets.all(20),
      height: 180,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 32),
              height: 158,
              width: 128,
              child: (item.imageUrl.isNotEmpty)
                  ? CachedNetworkImage(
                      imageUrl: item.imageUrl, height: 55, width: 70)
                  : SvgPicture.asset(kProductPlaceholderImage,
                      height: 158, width: 128)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AppText(
                  text: item.productName,
                  style: TextTypes.subtitle1,
                ),
                AppText(
                  text: "${"code".tr}: ${item.itemCode}",
                  style: TextTypes.caption,
                  color: AppColor.metallicSilver,
                ),
                AppText(
                  text:
                      "${item.itemPv} ${"pv".tr} | ${item.itemPrice} ${Globals.currency}",
                  style: TextTypes.subtitle1,
                  color: AppColor.charcoal,
                ),
                CartCounterView(
                    itemCode: item.itemCode,
                    onPress: controller.onUpdateQuantity,
                    quantity: item.quantity)
              ],
            ),
          )
        ],
      ),
    );
  }
}
