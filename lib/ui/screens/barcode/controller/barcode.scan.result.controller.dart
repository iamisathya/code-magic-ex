import 'package:dsc_tools/ui/global/widgets/plain_button.dart';
import 'package:dsc_tools/utilities/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class BarcodeScannResultController extends GetxController {
  RxBool loading = false.obs;
  RxBool isExpanded = false.obs;

  void showWarningMessage() {
    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
        content: SizedBox(
          height: 415,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(kNotificationBellImage, height: 193, width: 200),
              const SizedBox(height: 30),
              const Text(
                "“Your current changes will not be saved”",
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              PlainButton(
                title: 'OK, Got it',
                onTap: () => Get.back(),
              ),
              const SizedBox(height: 10),
              SizedBox(
                  width: Get.width,
                  height: 50,
                  child: TextButton(
                      onPressed: () => Get.back(),
                      child: Text("Cancel",
                          style: Theme.of(Get.context!)
                              .textTheme
                              .bodyText2!
                              .copyWith(color: const Color(0xFF606975)))))
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }
}
