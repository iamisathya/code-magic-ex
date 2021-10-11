import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../../../models/barcode_item_response.dart';
import '../../../../utilities/images.dart';
import '../../../global/widgets/plain_button.dart';
import '../../open_po/home/components/loader.dart';
import '../components/barcode_list_item.dart';
import '../components/barcode_product_item.dart';
import '../controller/barcode.scan.result.controller.dart';

class BarCodeDetails extends StatelessWidget {
  static const String routeName = '/barCodeDetailsPage';
  final BarcodeScannResultController controller =
      Get.put(BarcodeScannResultController());
  @override
  Widget build(BuildContext context) {
    print(controller.checkIfAnyPandingBarcodeScanLeft().value);
    return Scaffold(
      body: Obx(
        () => SafeArea(
          top: false,
          child: LoadingOverlay(
            isLoading: controller.isLoading.value,
            progressIndicator: const Loader(),
            child: SingleChildScrollView(
              child: controller.barcodeItems == null
                  ? const Center()
                  : Column(
                      children: [
                        Spacer(controller: controller),
                        if (controller.checkIfAnyPandingBarcodeScanLeft().value)
                          Column(
                            children: [
                              CustomAppBar(controller: controller),
                              BarcodeScanner(controller: controller),
                            ],
                          )
                        else
                          CompleteBarcodeScanSuccess(controller: controller),
                        BarcodeItemList(controller: controller)
                      ],
                    ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomButtonBar(controller: controller),
    );
  }
}

class BottomButtonBar extends StatelessWidget {
  const BottomButtonBar({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final BarcodeScannResultController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.value || !controller.hasAnyChangesMade.value
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
                      onTap: () => controller.showWarningMessage(),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Flexible(
                    child: PlainButton(
                      title: 'Save',
                      onTap: () => controller.saveBarcodeDetails(),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

class BarcodeItemList extends StatelessWidget {
  const BarcodeItemList({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final BarcodeScannResultController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: controller.barcodeItems?.items.length,
          itemBuilder: (BuildContext ctxt, int index) {
            final BarcodeItem item = controller.barcodeItems!.items[index];
            if (item.require) {
              return BarcodeListItem(item: item, mainIndex: index);
            }
            return BarcodeProductItem(item: item);
          }),
    );
  }
}

class CompleteBarcodeScanSuccess extends StatelessWidget {
  const CompleteBarcodeScanSuccess({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final BarcodeScannResultController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 152,
      width: Get.width,
      color: const Color(0xFF5297A6),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(kCheckSuccessIcon,
              height: 45, width: 45, semanticsLabel: 'barcode check icon'),
          const SizedBox(height: 15),
          Text("Check Successfully",
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: const Color(0xFFFFFFFF))),
          const SizedBox(height: 7),
          Text("Order Number: ${controller.orderNumber.value}",
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(color: const Color(0xFFFFFFFF))),
        ],
      ),
    );
  }
}

class BarcodeScanner extends StatelessWidget {
  const BarcodeScanner({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final BarcodeScannResultController controller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => controller.scanBarcode(context),
      child: Container(
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
                    height: 20, width: 30, semanticsLabel: 'barcode icon'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Spacer extends StatelessWidget {
  const Spacer({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final BarcodeScannResultController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 45,
        color: controller.checkIfAnyPandingBarcodeScanLeft().value
            ? const Color(0xFFFFFFFF)
            : const Color(0xFF5297A6));
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final BarcodeScannResultController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: controller.checkIfAnyPandingBarcodeScanLeft().value
          ? const Color(0xFFFFFFFF)
          : const Color(0xFF5297A6),
      height: 60,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 0,
            height: 60,
            child: IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(Icons.arrow_back_ios_new),
                iconSize: 25),
          ),
          Align(
            child: Text(
              "Order Number: ${controller.orderNumber.value}",
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    color: const Color(0xFF000000),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
