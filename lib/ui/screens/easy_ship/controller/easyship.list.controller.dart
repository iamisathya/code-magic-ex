import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:screenshot/screenshot.dart';

import '../../../../constants/colors.dart';
import '../../../../models/easy_ship_report_with_total.dart';
import '../../../../models/easy_ship_reports.dart';
import '../../../../utilities/snackbar.dart';
import '../components/image.preview.dart';

class EasyShipListController extends GetxController {
  RxString userId = "".obs;
  RxBool isLoading = false.obs;
  Uint8List capturedImage = Uint8List(1000000);
  RxList<EasyShipReports> allEasyShipOrders = <EasyShipReports>[].obs;
  RxList<EasyShipReportsWithTotal> allFormattedEasyShipOrders =
      <EasyShipReportsWithTotal>[].obs;
  RxMap<String, List<EasyShipReports>> orderedEasyShipOrders =
      RxMap<String, List<EasyShipReports>>();
  ScreenshotController screenshotController = ScreenshotController();

  @override
  void onInit() {
    final dynamic data = Get.arguments;
    if (data != null) {
      final Map<String, dynamic> args = data as Map<String, dynamic>;
      // orderedEasyShipOrders.value = args["orders"] as RxMap<String, List<EasyShipReports>>;
      allFormattedEasyShipOrders.value =
          args["orders"] as RxList<EasyShipReportsWithTotal>;
      userId.value = args["userId"] as String;
      // onSearchEasyShipReport();
    } else {
      Get.back();
    }
    super.onInit();
  }

  void onCaptureScreenShot(BuildContext context) {
    if (orderedEasyShipOrders.isEmpty) {
      return;
    }
    Get.rawSnackbar(
        message: "capturing_screenshot".tr,
        snackStyle: SnackStyle.GROUNDED,
        icon: const Icon(Icons.screenshot, color: Colors.white),
        backgroundColor: Colors.black,
        showProgressIndicator: true,
        progressIndicatorBackgroundColor: AppColor.kWhiteColor);
    Future.delayed(
      const Duration(milliseconds: 2000),
      () => captureScreenShot(context),
    );
  }

  void captureScreenShot(BuildContext context) {
    screenshotController.capture().then((image) {
      debugPrint("Captured");
      ScaffoldMessenger.of(context).clearSnackBars();
      capturedImage = image!;
      showDialog(
          context: context,
          useSafeArea: false,
          barrierDismissible: true,
          barrierColor: Colors.black.withOpacity(0.8),
          builder: (BuildContext context) {
            return ScreenShotPreview(image: image);
          });
    }).catchError((err) {
      debugPrint("Capture error!");
      debugPrint(err.toString());
    });
  }

  Future<void> saveImage(BuildContext context) async {
    final result = await ImageGallerySaver.saveImage(capturedImage,
        quality: 60, name: "easyship_${DateTime.now().millisecondsSinceEpoch}");
    if (result["isSuccess"] == true) {
      Navigator.of(context).pop();
      SnackbarUtil.showSuccess(message: "image_saved_success".tr);
    } else {
      Navigator.of(context).pop();
      SnackbarUtil.showError(message: "error_saving_image".tr);
    }
  }
}
