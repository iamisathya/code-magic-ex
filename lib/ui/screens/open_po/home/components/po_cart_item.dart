import 'package:dsc_tools/ui/global/theme/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../constants/globals.dart';
import '../../../../../models/cart_products.dart';
import '../../../../../utilities/enums.dart';
import '../../../../../utilities/images.dart';
import '../../controller/add.openpo.controller.dart';

class PoCartItem extends StatelessWidget {
  final CreateOpenPoOrderController controller =
      Get.put(CreateOpenPoOrderController());
  final CartProductsItem item;
  final int idx;
  PoCartItem({required this.item, required this.idx});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFFFFFF),
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            children: [
              Flexible(
                child: BoxContainer(text: "Item ${idx + 1}"),
              ),
              const SizedBox(
                width: 10,
              ),
              Flexible(
                  child: BoxContainer(
                text: item.itemCode,
                bgColor: const Color(0xFFFFFFFF),
              ))
            ],
          ),
          const SizedBox(height: 10),
          BoxContainer(text: item.productName, bgColor: Colors.white),
          const SizedBox(height: 10),
          Row(
            children: [
              Flexible(
                child: BoxContainer(
                    text:
                        "${item.itemPv} PV | ${item.itemPrice}  ${Globals.currency}",
                    bgColor: Colors.white),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SvgPicture.asset(kMultiplyIcon,
                    height: 10, width: 10, semanticsLabel: "multiply_icon"),
              ),
              CounterView(controller: controller, item: item)
            ],
          )
        ],
      ),
    );
  }
}

class CounterView extends StatelessWidget {
  const CounterView({
    Key? key,
    required this.controller,
    required this.item,
  }) : super(key: key);

  final CreateOpenPoOrderController controller;
  final CartProductsItem item;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(width: 0.5, color: const Color(0xFFD0D0CF)),
          color: Colors.white,
          borderRadius: BorderRadius.circular(2),
        ),
        height: 40,
        child: Row(
          children: [
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () => controller.onUpdateQuantity(
                  CartUpdate.decreament, item.itemCode),
              child: SizedBox(
                width: 50,
                height: 30,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: SvgPicture.asset(kMinusIcon,
                      height: 10, width: 10, semanticsLabel: "minus_icon"),
                ),
              ),
            ),
            Flexible(
              child: Center(
                  child: Text(
                item.quantity.toString(),
                style: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .copyWith(color: const Color(0xFF384250)),
              )),
            ),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () => controller.onUpdateQuantity(
                  CartUpdate.increament, item.itemCode),
              child: SizedBox(
                width: 50,
                height: 30,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: SvgPicture.asset(kPlusIcon,
                      height: 10, width: 10, semanticsLabel: "plus_icon"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BoxContainer extends StatelessWidget {
  const BoxContainer({
    Key? key,
    required this.text,
    this.alignment = Alignment.centerLeft,
    this.bgColor = const Color(0xFFF5F5F5),
  }) : super(key: key);

  final String text;
  final Alignment? alignment;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      alignment: alignment,
      decoration: BoxDecoration(
        border: Border.all(width: 0.5, color: const Color(0xFFD0D0CF)),
        color: bgColor,
        borderRadius: BorderRadius.circular(2),
      ),
      height: 40,
      child: AppText(
          text: text,
          style: TextTypes.bodyText1,
          color: const Color(0xFF384250)),
    );
  }
}
