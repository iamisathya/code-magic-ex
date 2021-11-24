import 'package:dsc_tools/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utilities/enums.dart';
import '../../../utilities/images.dart';

class CartCounterView extends StatelessWidget {
  const CartCounterView({
    Key? key,
    required this.quantity,
    required this.itemCode,
    required this.onPress,
  }) : super(key: key);

  final int quantity;
  final String itemCode;
  final Function(CartUpdate, String) onPress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(width: 0.5, color: AppColor.americanSilver),
          color: Colors.white,
          borderRadius: BorderRadius.circular(2),
        ),
        height: 35,
        child: Row(
          children: [
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () => onPress(CartUpdate.decreament, itemCode),
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
                quantity.toString(),
                style: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .copyWith(color: AppColor.charcoal),
              )),
            ),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () => onPress(CartUpdate.increament, itemCode),
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
