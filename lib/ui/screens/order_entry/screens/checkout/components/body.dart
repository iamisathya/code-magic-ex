import 'package:code_magic_ex/ui/global/widgets/primary_button.dart';
import 'package:code_magic_ex/ui/screens/order_entry/controllers/order_entry_controller.dart';
import 'package:code_magic_ex/utilities/constants.dart';
import 'package:code_magic_ex/utilities/extensions.dart';
import 'package:code_magic_ex/utilities/images.dart';
import 'package:code_magic_ex/utilities/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'cart_card.dart';

class Body extends StatelessWidget {
  final OrderEntryTableController controller =
      Get.put(OrderEntryTableController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.checkoutProducts.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Dismissible(
                  key: Key(controller.checkoutProducts[index].itemCode),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    controller.checkoutProducts.removeAt(index);
                  },
                  background: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFE6E6),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        const Spacer(),
                        SvgPicture.asset(kIconTrash),
                      ],
                    ),
                  ),
                  child: CartCard(item: controller.checkoutProducts[index]),
                ),
              ),
            ),
            const SizedBox(height: 10),
            _renderUserDetails(context),
            const SizedBox(height: 20),
            Container(
              decoration: kCheckoutDecoration(),
              child: Padding(
                padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                child: Column(
                  children: [
                    _renderUserInfo(context, "Payment with", ""),
                    _renderPayementOptions(),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: kCheckoutDecoration(),
              child: Padding(
                padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                child: Column(
                  children: [
                    _renderUserInfo(context, "Order Summary", ""),
                    const Divider(
                      color: Colors.black,
                    ),
                    _renderUserInfo(context, "Total PV",
                        controller.totalCartPv.value.toString()),
                    _renderUserInfo(context, "Total Price",
                        controller.totalCartPrice.value.toString()),
                    Obx(() => (controller.seletedOption.value.index != 0)
                        ? _renderUserInfo(context, "Credit Amount",
                            controller.availableCreditAmount.value.toString())
                        : const SizedBox()),
                    const SizedBox(height: 10),
                    Obx(() => _renderTotal(context, "Total",
                        controller.totalCheckoutAmount.value.toString())),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
            PrimaryButton(
              press: () {},
              text: 'Checkout',
            )
          ],
        ),
      ),
    );
  }

  Widget _renderUserDetails(BuildContext context) {
    return Container(
        decoration: kCheckoutDecoration(),
        child: Padding(
          padding: EdgeInsets.all(getProportionateScreenWidth(10)),
          child: Column(
            children: [
              _renderUserInfo(
                  context, "BA Number", controller.passedUser.userId),
              _renderUserInfo(context, "Name", controller.passedUser.fullName),
              _renderUserInfo(context, "Email", controller.passedUser.email),
            ],
          ),
        ));
  }

  Widget _renderPayementOptions() {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: controller.paymentOptions
              .map((data) => Obx(
                    () => Container(
                      margin: kEdgeA8(),
                      decoration: BoxDecoration(
                          color: kBackground,
                          borderRadius: kBorderRadius(w: 15)),
                      child: SizedBox(
                        width: 140,
                        child: RadioListTile(
                          contentPadding: const EdgeInsets.all(0),
                          title: Text(
                            data.name,
                            style: const TextStyle(fontSize: 15),
                          ),
                          activeColor: kMainColor,
                          groupValue: controller.seletedOption.value.index,
                          value: data.index,
                          onChanged: (val) =>
                              controller.onChangedSearchType(data),
                        ),
                      ),
                    ),
                  ))
              .toList(),
        ));
  }

  Padding _renderUserInfo(BuildContext context, String title, String value) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 2,
            child: Text(
              title,
              style: Theme.of(context).textTheme.commonText,
            ),
          ),
          Flexible(
            flex: 2,
            child: Text(
              value,
              textAlign: TextAlign.end,
              maxLines: 2,
              style: Theme.of(context).textTheme.commonText,
            ),
          ),
        ],
      ),
    );
  }

  Padding _renderTotal(BuildContext context, String title, String value) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.checkoutText,
          ),
          Text(
            value,
            style: Theme.of(context).textTheme.checkoutText,
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}
