import 'package:dsc_tools/ui/screens/enroll/screens/enrollement_condition/controller/enrollment.terms.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class EnrollmentDetailsHomeController extends GetxController {
  TextEditingController idNumberTextController = TextEditingController();
  TextEditingController enrollerIdTextController = TextEditingController();
  TextEditingController sponsorIdTextController = TextEditingController();
  RxBool isLoading = false.obs;


  void navigateToTermsPage() {
    Get.to(() => EnrollmentTermsController());
  }
}