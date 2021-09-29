import 'package:dsc_tools/ui/screens/barcode/components/barcode_list_item.dart';
import 'package:dsc_tools/ui/screens/barcode/controller/barcode.scan.result.controller.dart';
import 'package:dsc_tools/ui/screens/open_po/home/components/loader.dart';
import 'package:dsc_tools/utilities/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

class BarcodeCheckResult extends StatelessWidget {
  final BarcodeScannResultController controller = Get.put(BarcodeScannResultController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Obx(() => Text("Order Number: ",
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: const Color(0xFF000000))))),
      body: LoadingOverlay(
          isLoading: false,
          progressIndicator: const Loader(),
          child: SingleChildScrollView(
            child: Column(children: [
              Container(
                height: 152,
                width: Get.width,
                color: const Color(0xFF5297A6),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => controller.showWarningMessage(),
                      child: SvgPicture.asset(kCheckSuccessIcon,
                          height: 45,
                          width: 45,
                          semanticsLabel: 'barcode check icon'),
                    ),
                    const SizedBox(height: 15),
                    Text("Check Successfully",
                        style: Theme.of(context).textTheme.headline6),
                    const SizedBox(height: 7),
                    Text("Order Number: 423154182",
                        style: Theme.of(context).textTheme.bodyText2)
                  ],
                ),
              ),
               Container(
                 padding: const EdgeInsets.all(20),
                 child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 10,
                      itemBuilder: (BuildContext ctxt, int index) {
                        return BarcodeListItem();
                      }),
               ),
            ]),
          ),
        ),
      
    );
  }
}
