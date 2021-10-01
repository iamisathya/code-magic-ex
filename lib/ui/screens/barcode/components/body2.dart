import 'package:dsc_tools/models/barcode_item_response.dart';
import 'package:dsc_tools/ui/screens/barcode/controller/barcode.scan.controller.dart';
import 'package:dsc_tools/ui/screens/inventory/component/page_title.dart';
import 'package:dsc_tools/utilities/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'alarm_info.dart';
import 'barcode_list_item.dart';
import 'db.dart';

class Body extends StatelessWidget {
  final BarcodeScannerController controller =
      Get.put(BarcodeScannerController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        const PageTitle(title: "Barcode Tracker"),
        Container(
          height: 104,
          color: const Color(0xFF5297A6),
          child: Container(
            margin: const EdgeInsets.all(20),
            height: 64,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              color: const Color(0xFFFFFFFF),
            ),
            child: TextField(
              controller: controller.bardcodeTextField,
              onSubmitted: (val) => controller.getBarcodePath(context, val),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                labelText: 'Order Number',
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFFFFFFF), width: 0),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFFFFFFF), width: 0),
                ),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFFFFFFF), width: 0),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                suffixIconConstraints:
                    const BoxConstraints(minHeight: 20, minWidth: 20),
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: GestureDetector(
                      onTap: () => controller.scanBarcode(context),
                      child: SvgPicture.asset(kBarcodeScanIcon,
                          width: 20, height: 20)),
                ),
              ),
            ),
          ),
        ),
        Container(
            padding: const EdgeInsets.all(20),
            child:
                (!controller.isLoading.value && controller.barcodeItems != null)
                    ? ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.barcodeItems?.items.length,
                        itemBuilder: (BuildContext ctxt, int index) {
                          final BarcodeItem item =
                              controller.barcodeItems!.items[index];
                          return BarcodeListItem(item: item, index: index);
                        })
                    : SvgPicture.asset(kScanBarcodeIllustration,
                        width: 254, height: 252))
      ]),
    );
  }
}
