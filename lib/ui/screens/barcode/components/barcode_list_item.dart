import 'package:dsc_tools/models/barcode_item_response.dart';
import 'package:dsc_tools/ui/screens/barcode/controller/barcode.scan.result.controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../utilities/images.dart';

class BarcodeListItem extends StatelessWidget {


  final BarcodeItem item;
  final int index;
  const BarcodeListItem({required this.item, required this.index});

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<BarcodeScannResultController>(
        builder: (controller) => GestureDetector(
        onTap: () => controller.toggleItem(index),
        child: AnimatedContainer(
          margin: const EdgeInsets.symmetric(vertical: 5),
          duration: const Duration(milliseconds: 160),
          // height: controller.isExpanded.value ? 246 : 66,
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
                        Text(item.desc,
                            style: Theme.of(context).textTheme.bodyText1),
                        Text("Scanned: ${item.scan}",
                            style: Theme.of(context).textTheme.bodyText2)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SvgPicture.asset(
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
                          BarcodeItemChip(text: "Code: ${item.code}"),
                          BarcodeItemChip(text: "Qty: ${item.qty}"),
                          BarcodeItemChip(text: "Remains: ${item.remain}"),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 3,
                          itemBuilder: (BuildContext ctxt, int index) {
                            return const BarcodeTextItem();
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
            color: const Color(0xFFF1F8FC),
            border: Border.all(width: 0.5, color: const Color(0xFFEAEAEA))),
        alignment: Alignment.center,
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .bodyText2!
              .copyWith(color: const Color(0xFF505050)),
        ));
  }
}

class BarcodeTextItem extends StatelessWidget {
  const BarcodeTextItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Barcode: 2573500222478",
              style: Theme.of(context).textTheme.bodyText1),
          GestureDetector(
            child: SvgPicture.asset(kTrashIcon,
                height: 15, width: 15, semanticsLabel: 'trash icon'),
          ),
        ],
      ),
    );
  }
}
