import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../models/cart_products.dart';
import '../../../../../../utilities/images.dart';
import '../../../../../../utilities/size_config.dart';

class CartCard extends StatelessWidget {
  const CartCard({required this.item});

  final CartProductsItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 88,
              child: AspectRatio(
                aspectRatio: 0.88,
                child: Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                  decoration: const BoxDecoration(
                    color: Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15)),
                  ),
                  child: SvgPicture.asset(kIconProduct),
                ),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.productName,
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                    maxLines: 2,
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Price: ${item.itemPrice}"),
                        Text("PV: ${item.itemPv}"),
                        Text("Qty: ${item.quantity}"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text.rich(
                    TextSpan(
                      text: "\$${item.itemPrice}",
                      style: TextStyle(
                          fontWeight: FontWeight.w600, color: Theme.of(context).colorScheme.primary),
                      children: [
                        TextSpan(
                            text: " x${item.quantity}",
                            style: Theme.of(context).textTheme.bodyText1),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
