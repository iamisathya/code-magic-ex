import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dsc_tools/api/config/api_service.dart';
import 'package:dsc_tools/models/error_error_message.dart';
import 'package:dsc_tools/models/profile_picture.dart';
import 'package:dsc_tools/navigation/router.dart';
import 'package:dsc_tools/utilities/function.dart';
import 'package:dsc_tools/utilities/snackbar.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide FormData, MultipartFile;
import 'package:image_picker/image_picker.dart';

class UserProfileController extends GetxController {
  final ImagePicker _picker = ImagePicker();
  RxString errorMessages = ''.obs;
  RxBool isLoading = false.obs;
  XFile uploadFile = XFile("");

  RxBool notificationStatus = true.obs;

  void onPressUpdateEmail() {
    Get.toNamed(ScreenPaths.updateEmail);
  }

  void onPressUpdatePassword() {
    Get.toNamed(ScreenPaths.updatePassword);
  }

  void changeProfilePicture() {
    showModalBottomSheet(
      context: Get.context!,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text('Upload profile picture',
                  style: TextStyle(fontSize: 18)),
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt_outlined),
              title: const Text('Take photo'),
              onTap: () => onImageOptionSelect(ImageSource.camera),
            ),
            ListTile(
              leading: const Icon(Icons.photo_album),
              title: const Text('Choose image'),
              onTap: () => onImageOptionSelect(ImageSource.gallery),
            ),
            ListTile(
              leading: const Icon(Icons.close),
              title: const Text('Cancel'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 35),
          ],
        );
      },
    );
  }

  Future<void> onImageOptionSelect(ImageSource source) async {
    try {
      Navigator.of(Get.context!).pop();
      isLoading.toggle();
      final _pickedImage = await _picker.pickImage(
        source: source,
      );
      if (_pickedImage != null) {
        final file = File(_pickedImage.path);
        final ProfilePicture response =
            await ApiService.shared().updateProfilePicture(file);
        if (response.sizes.isNotEmpty) {
          SnackbarUtil.showSuccess(
              message: "Profile picture updated successfully"); //! hardcoded
        }
      }
      isLoading.toggle();
    } on DioError catch (e) {
      isLoading.toggle();
      if (e.response != null) {
        final ErrorMessage error =
            ErrorMessage.fromJson(e.response!.data as Map<String, dynamic>);
        if (error.error.message!.isNotEmpty) {
          errorMessages.value = error.error.message!;
        }
        returnResponse(e.response!);
      }
    } catch (err, stack) {
      isLoading.toggle();
      debugPrint(err.toString());
      debugPrint(stack.toString());
    }
  }

  Future<void> onNotificationSwitchChange(bool value) async {
    notificationStatus.value = value;
    if (value) {
      await FirebaseMessaging.instance.subscribeToTopic("topup");
    } else {
      await FirebaseMessaging.instance.unsubscribeFromTopic("topup");
    }
  }

  Future<void> uploadProfilePicture() async {}
}
