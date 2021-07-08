import 'package:code_magic_ex/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProgressBar {
  late OverlayEntry _progressOverlayEntry;

  void show(BuildContext context) {
    _progressOverlayEntry = _createdProgressEntry(context);
    Overlay.of(context)!.insert(_progressOverlayEntry);
  }

  void hide() {
    _progressOverlayEntry.remove();
  }

  OverlayEntry _createdProgressEntry(BuildContext context) => OverlayEntry(
      builder: (BuildContext context) => Stack(
            children: <Widget>[
              Container(
                color: Colors.white.withOpacity(0.2),
              ),
              Positioned(
                top: Get.height / 2,
                left: Get.width / 2,
                child: const CircularProgressIndicator(color: kPrimaryColor),
              )
            ],
          ));
}
