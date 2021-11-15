import 'package:dio/dio.dart';
import 'package:dsc_tools/api/config/api_service.dart';
import 'package:dsc_tools/models/govt_id_verify.dart';
import 'package:dsc_tools/models/guest_user_info.dart';
import 'package:dsc_tools/ui/screens/enroll/screens/enrollement_condition/controller/enrollment.terms.controller.dart';
import 'package:dsc_tools/ui/screens/enroll/screens/enrollment_user_info/main_screen.dart';
import 'package:dsc_tools/utilities/function.dart';
import 'package:dsc_tools/utilities/logger.dart';
import 'package:dsc_tools/utilities/parsing.dart';
import 'package:dsc_tools/utilities/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class EnrollmentDetailsHomeController extends GetxController {
  GuestUserInfoList enrollerProfile = GuestUserInfoList(items: []);
  GuestUserInfoList sponserProfile = GuestUserInfoList(items: []);
  String enrollerName = "";
  String sponsorName = "";

  TextEditingController idNumberTextController = TextEditingController();
  TextEditingController enrollerIdTextController = TextEditingController();
  TextEditingController sponsorIdTextController = TextEditingController();
  GovtIdVerify govtIdVerification = GovtIdVerify(message: null, success: '');
  RxBool isLoading = false.obs;
  RxBool isValidGovtId = false.obs;
  RxBool isValidEnrolerId = false.obs;
  RxBool isValidSponsorId = false.obs;

  void navigateToTermsPage() {
    Get.to(() => EnrollmentTermsController());
  }

  Future<void> verifyUserInfo() async {
    if (idNumberTextController.text.isEmpty) {
      SnackbarUtil.showError(message: "Please enter valid governament ID!");
    } else if (enrollerIdTextController.text.isEmpty) {
      SnackbarUtil.showError(message: "Enroller ID shouldn't be empty");
    } else if (sponsorIdTextController.text.isEmpty) {
      SnackbarUtil.showError(message: "Sponsor ID shouldn't be empty");
    } else {
      isLoading.toggle();
      isValidEnrolerId.value = false;
      isValidGovtId.value = false;
      isValidSponsorId.value = false;
      final isGovtIdVerified = await verifyGovtIdNumber();
      final isEnrolerSponsorIdVerified = await verifyEnrollerSponsor();
      isLoading.toggle();
      if (isGovtIdVerified && isEnrolerSponsorIdVerified) {
        Get.to(() => EnrollmentUserInfoScreen());
      }
    }
  }

  Future<bool> verifyGovtIdNumber() async {
    try {
      govtIdVerification = await MemberCallsService.init()
          .validateIdCard(idNumberTextController.text);
          if(govtIdVerification.success == "Yes") {
            isValidGovtId.value = true;
            return true;
          }
      return false;
    } catch (err, s) {
      isValidGovtId.value = false;
      debugPrint(s.toString());
      LoggerService.instance.e(err.toString());
      return false;
    }
  }

  Future<bool> verifyEnrollerSponsor() async {
    try {
      // * if sponsor & enroller are same
      if (enrollerIdTextController.text == sponsorIdTextController.text) {
        enrollerProfile = await ApiService.shared().getCustomerInfo(
            Parsing.intFrom(enrollerIdTextController.text)!, "customer");
        sponserProfile = enrollerProfile;
        enrollerName = enrollerProfile.items[0].humanName.fullName;
        sponsorName = enrollerProfile.items[0].humanName.fullName;
      } else {
        // * Calling sponser validation
        sponserProfile = await ApiService.shared().getCustomerInfo(
            Parsing.intFrom(enrollerIdTextController.text)!, "customer");
        enrollerName = sponserProfile.items[0].humanName.fullName;

        // * Calling enroller validation
        enrollerProfile = await ApiService.shared().getCustomerInfo(
            Parsing.intFrom(sponsorIdTextController.text)!, "customer");
        sponsorName = enrollerProfile.items[0].humanName.fullName;
      }
      isValidEnrolerId.value = true;
      isValidSponsorId.value = true;
      return true;
    } on DioError catch (e) {
      returnResponse(e.response!);
      return false;
    } catch (err, e) {
      debugPrint(e.toString());
      LoggerService.instance.e(err.toString());
      return false;
    }
  }
}
