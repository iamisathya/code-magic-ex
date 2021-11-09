import 'dart:typed_data';

import 'package:dsc_tools/ui/global/theme/text_view.dart';
import 'package:dsc_tools/ui/screens/easy_ship/controller/easyshiphome.controller.dart';
import 'package:dsc_tools/utilities/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ScreenShotPreview extends StatelessWidget {
  final EasyShipHomeController controller = Get.put(EasyShipHomeController());
  ScreenShotPreview({required this.image, Key? key}) : super(key: key);

  final Uint8List image;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.6),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(54),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: const BorderSide(color: Color(0xFFFFBF3A)))),
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xFFFFBF3A))),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const AppText(text: "Cancel", style: TextTypes.caption),
              ),
              TextButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: const BorderSide(color: Color(0xFF1C9CFC)))),
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xFF1C9CFC))),
                onPressed: () => controller.saveImage(context),
                child: const AppText(
                  text: "Save",
                  style: TextTypes.caption,
                  color: Color(0xFFFFFFFF),
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
