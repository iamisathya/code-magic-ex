import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class EnrollmentDetailsHomeController extends GetxController {
  TextEditingController idNumberTextController = TextEditingController();
  TextEditingController enrollerIdTextController = TextEditingController();
  TextEditingController sponsorIdTextController = TextEditingController();
  RxBool isLoading = false.obs;

}