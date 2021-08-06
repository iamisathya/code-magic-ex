import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utilities/constants.dart';
import '../../../../utilities/images.dart';
import '../../../global/widgets/custom_empty_widget.dart';
import '../../../global/widgets/custom_error_widget.dart';
import '../../../global/widgets/custom_loading_widget.dart';
import '../controller/controller.dart';

class Body extends StatelessWidget {
  final BarcodeController controller = Get.put(BarcodeController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _createSearchView(context),
        Expanded(child: _buildChild(context))
      ],
    );
  }

  Widget _buildChild(BuildContext context) {
    if (controller.bardcodeTextField.text.isEmpty) {
      return const CustomErrorWidget(
        svgIcon: kImageThinking,
        showMessage: false,
      );
    } else if (controller.loading.value) {
      return const CustomLoadingWidget(
        svgIcon: kImageSearch,
      );
    } else if (controller.errorMessage.value.isNotEmpty) {
      return const CustomErrorWidget(
        svgIcon: kImageServerDown,
      );
    }
    if (!controller.isInvalidOrderId.value) {
      return const CustomEmptyWidget(
        svgIcon: kImageNotFound,
      );
    } else {
      return const CustomEmptyWidget(
        svgIcon: kImageBlankPage,
      );
    }
  }

  //Create a SearchView
  Widget _createSearchView(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                border: Border.all(width: 2, color: kMainColor),
                borderRadius: const BorderRadius.all(Radius.circular(8.0))),
            child: TextField(
              controller: controller.bardcodeTextField,
              cursorColor: kMainColor,
              decoration: InputDecoration(
                hoverColor: kMainColor,
                hintText: "Search",
                focusedBorder: InputBorder.none,
                prefixIcon: const Icon(Icons.search, color: kMainColor),
                hintStyle: TextStyle(color: Colors.grey[300]),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 66,
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
