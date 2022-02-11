import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/values/colors.dart';
import '../../../../../data/model/govt_id_verify.dart';
import '../../../../../data/model/guest_user_info.dart';
import '../../../../../data/services/api_service.dart';
import '../../../../../routes/app_pages.dart';
import '../../../../../utils/logger.dart';
import '../../../../../utils/parsing.dart';
import '../../../../../utils/snackbar.dart';

class EnrollmentDetailsHomeController extends GetxController {
  GuestUserInfoList enrolerProfile = GuestUserInfoList(items: []);
  GuestUserInfoList sponsorProfile = GuestUserInfoList(items: []);
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
    Get.toNamed(Routes.ENROLL_TERMS);
  }

  Future<void> verifyUserInfo() async {
    var isEnrolerIdVerified = false;
    var isSponsorIdVerified = false;
    if (idNumberTextController.text.isEmpty) {
      SnackbarUtil.showError(message: "enter_valid_govt_id".tr);
    } else if (enrollerIdTextController.text.isEmpty) {
      SnackbarUtil.showError(message: "enroller_idshould_not_empty".tr);
    } else if (sponsorIdTextController.text.isEmpty) {
      SnackbarUtil.showError(message: "sponsor_idshould_not_empty".tr);
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
        final Map<String, dynamic> args = {
          "enrolerProfile": enrolerProfile,
          "sponsorProfile": sponsorProfile,
          "govtId": idNumberTextController.text,
        };
        Get.toNamed(Routes.ENROLL_USER_INFO, arguments: args);
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
      sponsorProfile = await ApiService.shared().getCustomerInfo(
          Parsing.intFrom(sponsorIdTextController.text)!, "customer");
      sponsorName = enrolerProfile.items[0].humanName.fullName;
      if (sponsorName != "") {
        isValidSponsorId.value = 1;
        return true;
      }
      return false;
    } on DioError catch (e) {
      SnackbarUtil.showError(message: "${"error".tr}! ${e.response}");
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
      enrolerProfile = await ApiService.shared().getCustomerInfo(
          Parsing.intFrom(enrollerIdTextController.text)!, "customer");
      enrollerName = enrolerProfile.items[0].humanName.fullName;
      if (enrollerName != "") {
        isValidEnrolerId.value = 1;
        return true;
      }
      return false;
    } on DioError catch (e) {
      SnackbarUtil.showError(message: "${"error".tr}! ${e.response}");
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
      enrolerProfile = await ApiService.shared().getCustomerInfo(
          Parsing.intFrom(enrollerIdTextController.text)!, "customer");
      sponsorProfile = enrolerProfile;
      enrollerName = enrolerProfile.items[0].humanName.fullName;
      sponsorName = enrolerProfile.items[0].humanName.fullName;
      if (sponsorName != "") {
        isValidSponsorId.value = 1;
        isValidEnrolerId.value = 1;
        return true;
      }
      return false;
    } on DioError catch (e) {
      SnackbarUtil.showError(message: "${"error".tr}! ${e.response}");
      return false;
    } catch (err, e) {
      debugPrint(e.toString());
      LoggerService.instance.e(err.toString());
      return false;
    }
  }

  Color getActiveColor(int value) {
    return value == 0
        ? AppColor.kWhiteColor
        : value == 1
            ? AppColor.kWhiteSmokeColor
            : AppColor.mistyRose;
  }
}
