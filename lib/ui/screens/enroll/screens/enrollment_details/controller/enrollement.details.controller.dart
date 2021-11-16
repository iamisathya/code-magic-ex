import 'package:dio/dio.dart';
import 'package:dsc_tools/api/config/api_service.dart';
import 'package:dsc_tools/models/govt_id_verify.dart';
import 'package:dsc_tools/models/guest_user_info.dart';
import 'package:dsc_tools/ui/screens/enroll/screens/enrollement_condition/controller/enrollment.terms.controller.dart';
import 'package:dsc_tools/ui/screens/enroll/screens/enrollment_user_info/main_screen.dart';
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

  RxBool isGovtIdVerifying = false.obs;
  RxBool isSponsorVerifying = false.obs;
  RxBool isEnrolerVerifying = false.obs;

  // 0 unverified, 1 verification succuss, 2 verification failed
  RxInt isValidGovtId = 0.obs;
  RxInt isValidEnrolerId = 0.obs;
  RxInt isValidSponsorId = 0.obs;

  void navigateToTermsPage() {
    Get.to(() => EnrollmentTermsController());
  }

  Future<void> verifyUserInfo() async {
    var isEnrolerIdVerified = false;
    var isSponsorIdVerified = false;
    if (idNumberTextController.text.isEmpty) {
      SnackbarUtil.showError(message: "Please enter valid governament ID!");
    } else if (enrollerIdTextController.text.isEmpty) {
      SnackbarUtil.showError(message: "Enroller ID shouldn't be empty");
    } else if (sponsorIdTextController.text.isEmpty) {
      SnackbarUtil.showError(message: "Sponsor ID shouldn't be empty");
    } else {
      isLoading.toggle();
      final isGovtIdVerified = await verifyGovtIdNumber();
      if (enrollerIdTextController.text == sponsorIdTextController.text) {
        isEnrolerIdVerified = await verifyEnrollerSponsor();
        isSponsorIdVerified = isEnrolerIdVerified;
      } else {
        isEnrolerIdVerified = await verifyEnroller();
        isSponsorIdVerified = await verifySponsor();
      }
      isLoading.toggle();
      if (isGovtIdVerified && isEnrolerIdVerified && isSponsorIdVerified) {
        Get.to(() => EnrollmentUserInfoScreen());
      }
    }
  }

  Future<bool> verifyGovtIdNumber() async {
    try {
      govtIdVerification = await MemberCallsService.init()
          .validateIdCard(idNumberTextController.text);
      if (govtIdVerification.success == "Yes") {
        isValidGovtId.value = 1;
        return true;
      } else {
        isValidGovtId.value = 2;
      }
      return false;
    } catch (err, s) {
      isValidGovtId.value = 2;
      debugPrint(s.toString());
      LoggerService.instance.e(err.toString());
      return false;
    }
  }

  Future<bool> verifySponsor() async {
    try {
      // * Calling enroller validation
      sponserProfile = await ApiService.shared().getCustomerInfo(
          Parsing.intFrom(sponsorIdTextController.text)!, "customer");
      sponsorName = enrollerProfile.items[0].humanName.fullName;
      if (sponsorName != "") {
        isValidSponsorId.value = 1;
        return true;
      }
      return false;
    } on DioError catch (e) {
      SnackbarUtil.showError(message: "Error! ${e.response}");
      isValidSponsorId.value = 2;
      return false;
    } catch (err, e) {
      isValidSponsorId.value = 2;
      debugPrint(e.toString());
      LoggerService.instance.e(err.toString());
      return false;
    }
  }

  Future<bool> verifyEnroller() async {
    try {
      // * Calling enroller validation
      enrollerProfile = await ApiService.shared().getCustomerInfo(
          Parsing.intFrom(enrollerIdTextController.text)!, "customer");
      enrollerName = enrollerProfile.items[0].humanName.fullName;
      if (enrollerName != "") {
        isValidEnrolerId.value = 1;
        return true;
      }
      return false;
    } on DioError catch (e) {
      SnackbarUtil.showError(message: "Error! ${e.response}");
      isValidEnrolerId.value = 2;
      return false;
    } catch (err, e) {
      isValidEnrolerId.value = 2;
      debugPrint(e.toString());
      LoggerService.instance.e(err.toString());
      return false;
    }
  }

  Future<bool> verifyEnrollerSponsor() async {
    try {
      // * if sponsor & enroller are same
      enrollerProfile = await ApiService.shared().getCustomerInfo(
          Parsing.intFrom(enrollerIdTextController.text)!, "customer");
      sponserProfile = enrollerProfile;
      enrollerName = enrollerProfile.items[0].humanName.fullName;
      sponsorName = enrollerProfile.items[0].humanName.fullName;
      if (sponsorName != "") {
        isValidSponsorId.value = 1;
        isValidEnrolerId.value = 1;
        return true;
      }
      return false;
    } on DioError catch (e) {
      SnackbarUtil.showError(message: "Error! ${e.response}");
      return false;
    } catch (err, e) {
      debugPrint(e.toString());
      LoggerService.instance.e(err.toString());
      return false;
    }
  }

  Color getActiveColor(int value) {
    return value == 0
        ? const Color(0xFFFFFFFF)
        : value == 1
            ? const Color(0xFFF5F5F5)
            : const Color(0xFFFFE7EB);
  }
}
