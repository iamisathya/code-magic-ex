import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../global/widgets/primary_button.dart';
import '../controller/barcode.controller.dart';

class Body extends StatelessWidget {
  final BarcodeController controller = Get.put(BarcodeController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
      child: _createSearchView(context),
    );
  }

  //Create a SearchView
  Widget _createSearchView(BuildContext context) {
    return Form(
        key: controller.formKey,
        child: Column(
          children: [
            Flexible(
              child: TextFormField(
                controller: controller.bardcodeTextField,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (!(value!.isNotEmpty && value.length > 3)) {
                    return "Barcode number should not be empty!"; //! hardcoded
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: "search".tr,
                  prefixIcon: const Icon(Icons.search),
                ),
              ),
            ),
            const SizedBox(height: 30),
            PrimaryButton(
              press: () => controller.getBarcodePath(context),
              text: "search".tr,
            ),
          ],
        ));
  }
}
