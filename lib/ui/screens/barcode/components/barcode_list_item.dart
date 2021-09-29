import 'package:dsc_tools/ui/screens/barcode/controller/barcode.scan.result.controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../utilities/images.dart';

class BarcodeListItem extends StatelessWidget {
  final BarcodeScannResultController controller =
      Get.put(BarcodeScannResultController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: () => controller.isExpanded.toggle(),
        child: AnimatedContainer(
          margin: const EdgeInsets.symmetric(vertical: 5),
          duration: const Duration(milliseconds: 120),
          height: controller.isExpanded.value ? 246 : 66,
          decoration: BoxDecoration(
              color: const Color(0xFFFFFFFF),
              border: Border.all(color: const Color(0xFFD0D0CF), width: 0.5),
              borderRadius: const BorderRadius.all(Radius.circular(3.0))),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SvgPicture.asset(kSuccessIcon,
                        height: 25, width: 25, semanticsLabel: 'success icon'),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Promo Free Sanitizer Spray TH",
                            style: Theme.of(context).textTheme.bodyText1),
                        Text("Scanned:1",
                            style: Theme.of(context).textTheme.bodyText2)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SvgPicture.asset(kPlusIcon,
                        height: 15, width: 15, semanticsLabel: 'add icon'),
                  ),
                ],
              ),
              if(controller.isExpanded.value)  
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                              width: 105,
                              height: 35,
                              color: const Color(0xFFF1F8FC),
                              child: const Text("Code: 19236"),
                              alignment: Alignment.center),
                          Container(
                              width: 105,
                              height: 35,
                              color: const Color(0xFFF1F8FC),
                              child: const Text("Code: 19236"),
                              alignment: Alignment.center),
                          Container(
                              width: 105,
                              height: 35,
                              color: const Color(0xFFF1F8FC),
                              child: const Text("Code: 19236"),
                              alignment: Alignment.center),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Barcode: 2573500222478", style: Theme.of(context).textTheme.bodyText1),
                          SvgPicture.asset(kTrashIcon,
                              height: 15, width: 15, semanticsLabel: 'trash icon'),
                        ],
                      ),
                    )
                  ],
                ),
              ) else SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
