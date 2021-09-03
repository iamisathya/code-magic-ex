import 'package:dsc_tools/ui/global/widgets/sign_out_button.dart';
import 'package:dsc_tools/ui/screens/open_po/controller/openpo.details.controller.dart';
import 'package:dsc_tools/utilities/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'po_ordered_item.dart';
import 'total_price_container.dart';

class OpenPODetailsPage extends StatelessWidget {
  final OpenPoDetailsController controller = Get.put(OpenPoDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(controller.openPlaceOrderId.orderOpid,
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: const Color(0xFF000000)))),
      body: SingleChildScrollView(
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
                                controller.openPlaceOrderId.orderDscid,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(color: const Color(0xFF9999A4)),
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
                                controller.openPlaceOrderId.orderDate,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(color: const Color(0xFF9999A4)),
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
                          controller.openPlaceOrderId.createBy,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2!
                              .copyWith(color: const Color(0xFF9999A4)),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return PoOrderedItem();
                  }),
              const SizedBox(
                height: 34,
              ),
              TotalPrice(
                  totalPrice: controller.openPlaceOrderId.orderTotalPrice,
                  totalPv: controller.openPlaceOrderId.orderTotalPv),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 10, left: 20, right: 20, bottom: 5),
                child: SignOutButton(
                    title: "Image S__46776363.png",
                    onPress: () {},
                    icon: kFileIcon),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 5, left: 20, right: 20, bottom: 10),
                child: SignOutButton(
                  title: "Print PO List",
                  onPress: () {},
                  bgColor: const Color(0xFF1C9CFC),
                  fgColor: const Color(0xFFFFFFFF),
                  icon: kPrintIcon,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
