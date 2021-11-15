import 'package:dsc_tools/models/cart_products.dart';
import 'package:dsc_tools/ui/screens/enroll/controllers/enroll.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'components/enroll_cart_item.dart';

class Body extends StatelessWidget {
  final EnrollHomeController controller = Get.put(EnrollHomeController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(minHeight: Get.height - 284),
              child: Column(
                children: [
                  Obx(
                    () => ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.cartProducts.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        final CartProductsItem item =
                            controller.cartProducts[index];
                        return Slidable(
                          actionPane: const SlidableDrawerActionPane(),
                          actionExtentRatio: 0.5,
                          secondaryActions: <Widget>[
                            IconSlideAction(
                              caption: 'Delete',
                              color: const Color(0xFFFA758E),
                              icon: Icons.delete,
                              foregroundColor: Colors.white,
                              onTap: () => controller.removeItem(item.itemCode),
                            ),
                          ],
                          child: EnrollCartItem(item: item, idx: index),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
