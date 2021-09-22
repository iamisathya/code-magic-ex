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
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          Row(
            children: [
              Flexible(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border:
                        Border.all(width: 0.5, color: const Color(0xFFD0D0CF)),
                    color: const Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.circular(2),
                  ),
                  height: 40,
                  child: Center(
                      child: Text(
                    "Item ${idx + 1}",
                    style:
                        const TextStyle(color: Color(0xFF384250), fontSize: 14),
                  )),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Flexible(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border:
                        Border.all(width: 0.5, color: const Color(0xFFD0D0CF)),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(2),
                  ),
                  height: 40,
                  child: Center(
                      child: Text(
                    item.itemCode,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(color: const Color(0xFF384250)),
                  )),
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Flexible(
                child: Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    border:
                        Border.all(width: 0.5, color: const Color(0xFFD0D0CF)),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        item.productName,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2!
                            .copyWith(color: const Color(0xFF384250)),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Flexible(
                child: Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    border:
                        Border.all(width: 0.5, color: const Color(0xFFD0D0CF)),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: Center(
                      child: Text(
                    "${item.itemPv} PV | ${item.itemPrice}  ${Globals.currency}",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(color: const Color(0xFF384250)),
                  )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SvgPicture.asset(kMultiplyIcon,
                    height: 10, width: 10, semanticsLabel: "multiply_icon"),
              ),
              Flexible(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border:
                        Border.all(width: 0.5, color: const Color(0xFFD0D0CF)),
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: SvgPicture.asset(kMinusIcon,
                                height: 10,
                                width: 10,
                                semanticsLabel: "minus_icon"),
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: SvgPicture.asset(kPlusIcon,
                                height: 10,
                                width: 10,
                                semanticsLabel: "plus_icon"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
