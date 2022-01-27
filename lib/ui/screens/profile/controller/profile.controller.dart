import 'package:dsc_tools/navigation/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserProfileController extends GetxController {
  void onPressUpdateEmail() {
    Get.toNamed(ScreenPaths.updateEmail);
  }

  void onPressUpdatePassword() {
    Get.toNamed(ScreenPaths.updatePassword);
  }

  void pickImage() {
    final action = CupertinoActionSheet(
      title: Text(
        "Proto Coders Point",
        style: TextStyle(fontSize: 30),
      ),
      message: Text(
        "Select any action ",
        style: TextStyle(fontSize: 15.0),
      ),
      actions: <Widget>[
        CupertinoActionSheetAction(
          child: Text("Action 1"),
          isDefaultAction: true,
          onPressed: () {
            print("Action 1 is been clicked");
          },
        ),
        CupertinoActionSheetAction(
          child: Text("Action 2"),
          isDestructiveAction: true,
          onPressed: () {
            print("Action 2 is been clicked");
          },
        )
      ],
      cancelButton: CupertinoActionSheetAction(
        child: Text("Cancel"),
        onPressed: () {
          Get.back();
        },
      ),
    );

    showCupertinoModalPopup(
        context: Get.context!, builder: (context) => action);
  }
}
