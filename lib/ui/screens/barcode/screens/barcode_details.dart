import 'package:dsc_tools/models/barcode_item_response.dart';
import 'package:dsc_tools/ui/global/widgets/plain_button.dart';
import 'package:dsc_tools/ui/screens/barcode/components/barcode_product_item.dart';
import 'package:dsc_tools/ui/screens/open_po/home/components/loader.dart';
import 'package:dsc_tools/ui/screens/sales_reports/controller/salesreport.details.controller.dart';
import 'package:dsc_tools/utilities/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

class BarCodeDetails extends StatelessWidget {
  final SalesReportDetailsController controller =
      Get.put(SalesReportDetailsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Obx(() => Text("Order Number: ${controller.orderNumber.value}",
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: const Color(0xFF000000))))),
      body: Obx(
        () => LoadingOverlay(
          isLoading: controller.isLoading.value,
          progressIndicator: const Loader(),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 94,
                  color: const Color(0xFF5297A6),
                  child: Container(
                    margin: const EdgeInsets.all(20.0),
                    color: Colors.white,
                    height: 54,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text("Scan Barcode",
                              style: Theme.of(context).textTheme.subtitle2),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: SvgPicture.asset(kBarcodePlainIcon,
                              height: 20,
                              width: 30,
                              semanticsLabel: 'barcode icon'),
                        ),
                      ],
                    ),
                  ),
                ),
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (BuildContext ctxt, int index) {
                      final BarcodeItem item = BarcodeItem(
                          code: '000000',
                          desc: 'Hardcoded',
                          isExpanded: false,
                          qty: 0,
                          remain: 0,
                          require: false,
                          scan: 0);
                      return BarcodeProductItem(item: item);
                    }),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Obx(
        () => controller.isLoading.value
            ? const SizedBox()
            : Container(
                height: 90,
                color: const Color(0xFFE3E8ED),
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: <Widget>[
                    Flexible(
                      child: PlainButton(
                        buttonColor: const Color(0xFFFFBF3A),
                        title: 'Cancel',
                        titleColor: const Color(0xFF000000),
                        onTap: () => null,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      child: PlainButton(
                        title: 'Save',
                        onTap: () => null,
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
