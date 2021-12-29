import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../constants/colors.dart';
import '../../../../utilities/enums.dart';
import '../../../global/theme/text_view.dart';
import '../controller/easyship.list.controller.dart';

class ScreenShotPreview extends StatelessWidget {
  final EasyShipListController controller = Get.put(EasyShipListController());
  ScreenShotPreview({required this.image, Key? key}) : super(key: key);

  final Uint8List image;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.6),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(54),
        child: Container(
          margin: const EdgeInsets.only(top: 34),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: const BorderSide(color: AppColor.sunglow))),
                    backgroundColor:
                        MaterialStateProperty.all(AppColor.sunglow)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: AppText(text: "cancel".tr, style: TextTypes.caption),
              ),
              TextButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side:
                                const BorderSide(color: AppColor.dodgerBlue))),
                    backgroundColor:
                        MaterialStateProperty.all(AppColor.dodgerBlue)),
                onPressed: () => controller.saveImage(context),
                child: AppText(
                  text: "save".tr,
                  style: TextTypes.caption,
                  color: AppColor.kWhiteColor,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Container(
              padding: const EdgeInsetsDirectional.all(20),
              child: Column(
                children: [
                  Image.memory(image),
                ],
              ))),
    );
  }
}
