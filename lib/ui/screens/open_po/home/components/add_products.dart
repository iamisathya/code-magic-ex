import 'package:dsc_tools/ui/global/widgets/sign_out_button.dart';
import 'package:dsc_tools/utilities/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'po_ordered_item.dart';
import 'total_price_container.dart';

class AddProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        "New PO",
        style: TextStyle(fontSize: 24, color: Color(0xFF000000)),
      )),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
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
                                child: const Center(
                                    child: Text(
                                  "0001",
                                  style: TextStyle(
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
                                child: const Center(
                                    child: Text(
                                  "2021-11-16",
                                  style: TextStyle(
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
                          child: const Center(
                              child: Text(
                            "Thailand TEST DSC",
                            style:
                                TextStyle(color: Color(0xFF9999A4), fontSize: 14),
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (BuildContext ctxt, int index) {
                      return PoOrderedItem();
                    }),
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
                            builder: (_, controller) => Column(
                                  children: <Widget>[
                                    Container(
                                      height: 60,
                                      color: const Color(0xFFEAEAEA),
                                      child: const Padding(
                                        padding: EdgeInsets.all(10.0),
                                        child: TextField(
                                          cursorHeight: 15,
                                          autofocus: true,
                                          decoration: InputDecoration(
                                              hintText: "Search Products",
                                              hintStyle: TextStyle(
                                                  fontSize: 12,
                                                  color: Color(0xFF9EA9B9)),
                                              suffixIcon:
                                                  Icon(Icons.keyboard_arrow_down),
                                              fillColor: Color(0xFFFFFFFF),
                                              filled: true,
                                              border: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                              enabledBorder: InputBorder.none,
                                              errorBorder: InputBorder.none,
                                              disabledBorder: InputBorder.none,
                                              contentPadding: EdgeInsets.only(
                                                  left: 15, top: 5, right: 15)),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    Expanded(
                                      child: ListView.builder(
                                          controller: controller,
                                          itemCount: 20,
                                          itemBuilder:
                                              (BuildContext ctxt, int index) {
                                            return const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 30, vertical: 10),
                                              child: Text(
                                                "17532 Pre-filter Catridge Ultra",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Color(0xFF000000),
                                                    fontWeight: FontWeight.w500),
                                              ),
                                            );
                                          }),
                                    )
                                  ],
                                ));
                      }),
                  child: SvgPicture.asset(kAddMoreProductsImage,
                      height: 40, semanticsLabel: "Add more products"),
                ),
                const SizedBox(height: 34),
                const TotalPrice(bgColor: Color(0xFFECFBF2)),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10, left: 20, right: 20, bottom: 5),
                  child: SignOutButton(
                      title: "Image S__46776363.png",
                      onPress: () {},
                      bgColor: const Color(0xFFFFFFFF),
                      icon: kFileIcon),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 5, left: 20, right: 20, bottom: 10),
                  child: SignOutButton(
                    title: "Place Order",
                    onPress: () {},
                    bgColor: const Color(0xFF1C9CFC),
                    fgColor: const Color(0xFFFFFFFF),
                    icon: kForwardIcon,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
