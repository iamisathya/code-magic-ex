import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../global/widgets/common_widgets.dart';
import '../../../../global/widgets/primary_button.dart';
import '../../controller/open_po_table_controller.dart';

void renderBottomSheet(BuildContext context) {
  final OpenPoTableController controller = Get.put(OpenPoTableController());
  Get.bottomSheet(
    Container(
      margin: const EdgeInsets.all(16),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              'Extra info',
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          renderTextField(
              ctlr: controller.commentController,
              helperText: "Add your comments here",
              maxLines: 5,
              label: "Comment"),
          const SizedBox(height: 30),
          GestureDetector(
            onTap: controller.selectSource,
            child: Stack(children: [
              renderTextField(
                ctlr: controller.selectedFileController,
                label: "Browse file",
                minLines: 1,
                enabled: false,
              ),
              Positioned(
                  left: 0,
                  top: 40,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 0.5),
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10))),
                    alignment: Alignment.center,
                    width: 80,
                    height: 63,
                    child: Icon(
                      Icons.image,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ))
            ]),
          ),
          const SizedBox(height: 30),
          PrimaryButton(
            press: () => controller.confirmOrder(context),
            text: 'Confirm order',
          )
        ],
      ),
    ),
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30))),
    backgroundColor: Colors.white,
  );
}

