import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

class EnrollmentUserInfoController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isScrolButtonVisible = false.obs;
  ScrollController hideButtonController = ScrollController();

  TextEditingController nativeFirstNameController = TextEditingController();
  TextEditingController nativeLastNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    hideButtonController.addListener(() {
      if (hideButtonController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (isScrolButtonVisible.value == true) {
          isScrolButtonVisible.value = false;
        }
      } else {
        if (hideButtonController.position.userScrollDirection ==
            ScrollDirection.forward) {
          if (isScrolButtonVisible.value == false) {
            isScrolButtonVisible.value = true;
          }
        }
      }
    });
  }

  void onTapScrollToTop() {
    isScrolButtonVisible.value = true;
    hideButtonController.animateTo(
      0.0,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 200),
    );
  }
}
