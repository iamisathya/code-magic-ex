import 'package:dsc_tools/utilities/function.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../utilities/user_session.dart';
import '../../login/login.screen.dart';

class DashboardController extends GetxController {
  RxBool isReportOptionShown = false.obs;
  final ImagePicker _picker = ImagePicker();
  RxString selectedFileName = "".obs;
  String? selectedImageBaes64 = "";
  XFile uploadFile = XFile("");

  set showReportOptions(bool value) =>
      isReportOptionShown.value = !!isReportOptionShown.value;

  bool get showReportOptions => isReportOptionShown.value;

  void onLogout(BuildContext context) {
    FirebaseAnalytics()
        .logEvent(name: 'log_out', parameters: {'type': "normal_signout"});
    UserSessionManager.shared.removeUserInfoFromDB();
    Get.offAll(() => LoginScreen());
  }

  Future<void> onImageOptionSelect(ImageSource source) async {
    try {
      final _pickedImage = (await _picker.pickImage(
        source: source,
      ))!;
      selectedImageBaes64 = await readFileByte(_pickedImage.path);
      uploadFile = _pickedImage;
      debugPrint(_pickedImage.path.split('/').last);
      selectedFileName.value = _pickedImage.path.split('/').last;
       Navigator.of(Get.context!).pop();
    } catch (e) {
      debugPrint(e.toString());
      Navigator.of(Get.context!).pop();
    }
  }

  void changeProfilePicture(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        message: const Text("Select/Take photo"), //! hardcoded
        actions: <Widget>[
          CupertinoActionSheetAction(
            onPressed: () => onImageOptionSelect(ImageSource.camera),
            child: Text("camera".tr),
          ),
          CupertinoActionSheetAction(
            onPressed: () => onImageOptionSelect(ImageSource.gallery),
            child: Text("photo_library".tr),
          )
        ],
        cancelButton: CupertinoActionSheetAction(
          isDestructiveAction: true,
          isDefaultAction: true,
          onPressed: Navigator.of(context).pop,
          child: Text("cancel".tr),
        ),
      ),
    );
  }
}
