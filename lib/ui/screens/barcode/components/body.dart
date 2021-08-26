import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utilities/constants.dart';
import '../controller/barcode.controller.dart';

class Body extends StatelessWidget {
  final BarcodeController controller = Get.put(BarcodeController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(36.0),
      child: _createSearchView(context),
    );
  }

  //Create a SearchView
  Widget _createSearchView(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: Container(
            margin: const EdgeInsets.all(8),
            child: TextField(
              controller: controller.bardcodeTextField,
              decoration: const InputDecoration(
                hintText: "Search",
                helperText: "Please enter order number",
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
        ),
        const SizedBox(height: 30),
        SizedBox(
          width: 100,
          height: 50,
          child: Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Container(
              decoration: kCircular8,
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_forward_outlined,
                  color: Colors.white,
                ),
                tooltip: 'Find easy ship',
                onPressed: () => controller.getBarcodePath(context),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
