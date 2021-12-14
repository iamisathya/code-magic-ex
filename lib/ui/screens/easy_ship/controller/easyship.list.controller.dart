import 'dart:typed_data';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:screenshot/screenshot.dart';

import '../../../../api/config/api_service.dart';
import '../../../../constants/colors.dart';
import '../../../../models/easy_ship_reports.dart';
import '../../../../utilities/constants.dart';
import '../../../../utilities/logger.dart';
import '../../../../utilities/snackbar.dart';
import '../../../../utilities/user_session.dart';
import '../components/image.preview.dart';

class EasyShipListController extends GetxController {
  String userId = "";
  RxBool isLoading = false.obs;
  Uint8List capturedImage = Uint8List(1000000);
  RxList<EasyShipReports> allEasyShipOrders = <EasyShipReports>[].obs;
  RxMap<String, List<EasyShipReports>> orderedEasyShipOrders =
      RxMap<String, List<EasyShipReports>>();
  ScreenshotController screenshotController = ScreenshotController();

  @override
  void onInit() {
    final dynamic data = Get.arguments;
    if (data != null) {
      userId = data as String;
      onSearchEasyShipReport();
    } else {
      Get.back();
    }
    super.onInit();
  }

  Future<void> onSearchEasyShipReport() async {
    isLoading.toggle();
    try {
      allEasyShipOrders.value = await MemberCallsService.init()
          .getEasyShipReports(kEasyShipReports, userId,
              UserSessionManager.shared.customerToken.token);
      orderedEasyShipOrders.value =
          groupBy(allEasyShipOrders, (EasyShipReports obj) => obj.pvDate);
      isLoading.toggle();
    } catch (err, s) {
      LoggerService.instance.e(s.toString());
      isLoading.toggle();
    }
  }

  void onCaptureScreenShot(BuildContext context) {
    if (orderedEasyShipOrders.isEmpty) {
      return;
    }
    Get.rawSnackbar(
        message: "Capturing Screenshot..", //! hardcoded
        snackStyle: SnackStyle.GROUNDED,
        icon: const Icon(Icons.screenshot, color: Colors.white),
        backgroundColor: Colors.black,
        showProgressIndicator: true,
        progressIndicatorBackgroundColor: AppColor.kWhiteColor);
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
