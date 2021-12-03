import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../constants/colors.dart';
import '../../../../models/barcode_item_response.dart';
import '../../../../utilities/images.dart';
import '../controller/barcode.scan.result.controller.dart';

class BarcodeListItem extends StatelessWidget {
  final BarcodeItem item;
  final int mainIndex;
  const BarcodeListItem({required this.item, required this.mainIndex});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BarcodeScannResultController>(
      builder: (controller) => GestureDetector(
        onTap: () => controller.toggleItem(mainIndex),
        child: AnimatedContainer(
          margin: const EdgeInsets.symmetric(vertical: 5),
          duration: const Duration(milliseconds: 160),
          // height: controller.isExpanded.value ? 246 : 66,
          decoration: BoxDecoration(
              color: AppColor.kWhiteColor,
              border: Border.all(color: AppColor.americanSilver, width: 0.5),
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
                        Text(item.desc,
                            style: Theme.of(context).textTheme.bodyText1),
                        Text("Scanned: ${item.scan}",  //!hardcoded
                            style: Theme.of(context).textTheme.bodyText2)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: controller.barcodeNumberLoading.value
                        ? Image.asset(kAnimatedSpin, width: 20)
                        : SvgPicture.asset(
                            item.isExpanded ? kMinusIcon : kPlusIcon,
                            width: 15,
                            semanticsLabel: 'add icon'),
                  ),
                ],
              ),
              if (item.isExpanded)
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          BarcodeItemChip(text: "Code: ${item.code}"), //!hardcoded
                          BarcodeItemChip(text: "Qty: ${item.qty}"), //!hardcoded
                          BarcodeItemChip(text: "Remains: ${item.remain}"), //!hardcoded
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: item.barcodes.length,
                          itemBuilder: (BuildContext ctxt, int index) {
                            return BarcodeTextItem(
                                barcode: item.barcodes[index],
                                index: index,
                                mainIndex: mainIndex);
                          }),
                    )
                  ],
                )
              else
                const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}

class BarcodeItemChip extends StatelessWidget {
  final String text;
  const BarcodeItemChip({
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 105,
        height: 35,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            color: AppColor.aliceBlue,
            border: Border.all(width: 0.5, color: AppColor.brightGraySecond)),
        alignment: Alignment.center,
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .bodyText2!
              .copyWith(color: AppColor.darkLiver),
        ));
  }
}

class BarcodeTextItem extends StatelessWidget {
  final BarcodeScannResultController controller =
      Get.put(BarcodeScannResultController());

  BarcodeTextItem({
    Key? key,
    required this.barcode,
    required this.mainIndex,
    required this.index,
  }) : super(key: key);

  final String barcode;
  final int mainIndex;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("${"barcode".tr}: $barcode",
              style: Theme.of(context).textTheme.bodyText1),
          GestureDetector(
            onTap: () => controller.removeBarcodeNumber(mainIndex, index),
            child: SvgPicture.asset(kTrashIcon,
                height: 15, width: 15, semanticsLabel: 'trash icon'),
          ),
        ],
      ),
    );
  }
}
