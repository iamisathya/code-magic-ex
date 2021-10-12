import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../../../../constants/globals.dart';
import '../../../../../models/cart_products.dart';
import '../../../../../models/inventory_records.dart';
import '../../../../../styles/input_decorations.dart';
import '../../../../../utilities/images.dart';
import '../../../../global/widgets/sign_out_button.dart';
import '../../controller/add.openpo.controller.dart';
import 'loader.dart';
import 'po_cart_item.dart';
import 'total_price_container.dart';

class CreateOpenPoOrder extends GetView<CreateOpenPoOrderController> {
  static const String routeName = '/createOpenPoOrder';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        "New PO",
        style: TextStyle(fontSize: 24, color: Color(0xFF000000)),
      )),
      body: Obx(
        () => LoadingOverlay(
          isLoading: controller.isLoading.value,
          progressIndicator: const Loader(),
          child: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  Container(
                    height: 130,
                    color: const Color(0xFF4D7483),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20, left: 30, bottom: 10, right: 30),
                          child: Row(
                            children: [
                              Flexible(
                                child: Container(
                                  width: double.infinity,
                                  color: Colors.white,
                                  height: 40,
                                  child: Center(
                                      child: Text(
                                    Globals.userId,
                                    style: const TextStyle(
                                        color: Color(0xFF9999A4), fontSize: 14),
                                  )),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Flexible(
                                child: Container(
                                  width: double.infinity,
                                  color: Colors.white,
                                  height: 40,
                                  child: Center(
                                      child: Text(
                                    DateFormat('dd-MM-yyyy')
                                        .format(DateTime.now())
                                        .toString(),
                                    style: const TextStyle(
                                        color: Color(0xFF9999A4), fontSize: 14),
                                  )),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 30, bottom: 20, right: 30),
                          child: Container(
                            width: double.infinity,
                            color: Colors.white,
                            height: 40,
                            child: Center(
                                child: Text(
                              Globals.userInfo.humanName.fullName,
                              style: const TextStyle(
                                  color: Color(0xFF9999A4), fontSize: 14),
                            )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Obx(() => ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.cartProducts.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        final CartProductsItem item =
                            controller.cartProducts[index];
                        return PoCartItem(item: item, idx: index);
                      })),
                  GestureDetector(
                    onTap: () => showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: const Color(0xFFF5F5F5),
                      context: context,
                      isDismissible: true,
                      builder: (context) {
                        return DraggableScrollableSheet(
                          initialChildSize: 0.4,
                          minChildSize: 0.2,
                          maxChildSize: 0.75,
                          expand: false,
                          builder: (_, ctrl) => Column(
                            children: <Widget>[
                              Container(
                                height: 60,
                                color: const Color(0xFFEAEAEA),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: TextField(
                                    controller:
                                        controller.searchProductTextController,
                                    cursorHeight: 15,
                                    onChanged: (val) =>
                                        controller.onSearchTextChange(val),
                                    autofocus: true,
                                    decoration: kSearchInventoryTextFieldDec,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Expanded(
                                child: Obx(
                                  () => ListView.builder(
                                    controller: ctrl,
                                    itemCount: controller
                                        .searchResult.value.items.length,
                                    itemBuilder:
                                        (BuildContext ctxt, int index) {
                                      final InventoryRecordItems item =
                                          controller
                                              .searchResult.value.items[index];
                                      return GestureDetector(
                                        onTap: () {
                                          controller.addItemToCart(item);
                                          Navigator.pop(context);
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 30, vertical: 10),
                                          child: Text(
                                            "${item.item.id.unicity}  ${item.catalogSlideContent.content.description}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle1!
                                                .copyWith(
                                                    color:
                                                        const Color(0xFF000000),
                                                    fontWeight:
                                                        FontWeight.w600),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ).whenComplete(
                        () => controller.searchProductTextController.text = ""),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: SvgPicture.asset(kAddMoreProductsImage,
                          height: 40, semanticsLabel: "Add more products"),
                    ),
                  ),
                  const SizedBox(height: 34),
                  Obx(() => TotalPrice(
                      totalPrice: controller.totalCartPrice.value.toString(),
                      totalPv: controller.totalCartPv.value.toString(),
                      bgColor: const Color(0xFFECFBF2))),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 10, left: 20, right: 20, bottom: 5),
                    child: Obx(() => SignOutButton(
                        title: controller.selectedFileName.value.isNotEmpty
                            ? controller.selectedFileName.value
                            : "Attach",
                        onPress: () => controller.selectSource(),
                        bgColor: const Color(0xFFFFFFFF),
                        icon: kFileIcon)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 5, left: 20, right: 20, bottom: 10),
                    child: SignOutButton(
                      title: "Place Order",
                      onPress: () => controller.validateOrder(context),
                      bgColor: const Color(0xFF1C9CFC),
                      fgColor: const Color(0xFFFFFFFF),
                      icon: kForwardIcon,
                      iconColor: const Color(0xFFFFFFFF),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
