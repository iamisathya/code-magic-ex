import 'package:code_magic_ex/api/config/api_service.dart';
import 'package:code_magic_ex/api/config/member_class.dart';
import 'package:code_magic_ex/models/amphur_item.dart';
import 'package:code_magic_ex/models/district_item.dart';
import 'package:code_magic_ex/models/govt_id_verify.dart';
import 'package:code_magic_ex/models/guest_user_info.dart';
import 'package:code_magic_ex/models/provience_item.dart';
import 'package:code_magic_ex/models/zip_code_response.dart';
import 'package:code_magic_ex/utilities/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:code_magic_ex/utilities/extensions.dart';
import 'package:get/get.dart';
import 'package:code_magic_ex/utilities/Logger/logger.dart';

class EnrollController extends GetxController {
  TextEditingController enrollIdController = TextEditingController();
  TextEditingController sponsorIdController = TextEditingController();
  TextEditingController idCardNumberController = TextEditingController();

  TextEditingController firstNameEnController = TextEditingController();
  TextEditingController lastNameEnController = TextEditingController();
  TextEditingController firstNameThController = TextEditingController();
  TextEditingController lastNameThController = TextEditingController();
  RxString userGender = "".obs;
  RxString maritalStatus = "".obs;
  TextEditingController birthDateController = TextEditingController();
  RxString provience = "".obs;
  TextEditingController mainAddressController = TextEditingController();
  RxString area = "".obs;
  RxString subArea = "".obs;
  RxString country = "th".obs;
  TextEditingController zipCodeController = TextEditingController();
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();

  GuestUserInfoList enrollerProfile = GuestUserInfoList(items: []);
  GuestUserInfoList sponserProfile = GuestUserInfoList(items: []);
  GovtIdVerify govtIdVerification = GovtIdVerify(message: null, success: '');
  Rx<bool> isSubmitting = false.obs;
  RxBool loading = false.obs;
  RxString errorMessage = "".obs;
  RxBool isUnderAgeLimit = false.obs;

  List<DropdownMenuItem<String>> genderDropdownItems = [
    const DropdownMenuItem(value: "", child: Text("Select Gender")),
    const DropdownMenuItem(value: "male", child: Text("Male")),
    const DropdownMenuItem(value: "female", child: Text("Female")),
  ];

  List<DropdownMenuItem<String>> statusDropdownItems = [
    const DropdownMenuItem(value: "", child: Text("Select Status")),
    const DropdownMenuItem(value: "single", child: Text("Single")),
    const DropdownMenuItem(value: "married", child: Text("Married")),
  ];

  RxList<DropdownMenuItem<String>> provinceDropdownItems = [
    const DropdownMenuItem(value: "", child: Text("Select Province")),
  ].obs;

  RxList<DropdownMenuItem<String>> areaDropdownItems = [
    const DropdownMenuItem(value: "", child: Text("Select Area")),
  ].obs;

  RxList<DropdownMenuItem<String>> subAreaDropdownItems = [
    const DropdownMenuItem(value: "", child: Text("Select Sub-Area")),
  ].obs;

  List<DropdownMenuItem<String>> countryDropdownItems = [
    const DropdownMenuItem(value: "th", child: Text("Thailand")),
  ];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    idCardNumberController.text =
        "1981156516516"; // valid: 4568767867811 invalid: 1981156516516
    enrollIdController.text = "108357166";
    sponsorIdController.text = "108357166";
    zipCodeController.text = "AAAAA";
  }

  void onChangeBirthDay(DateTime date) {
    final String selectedDate = DateFormat('yyyy-MM-dd').format(date);
    if (!date.isAdult(date)) {
      isUnderAgeLimit = true.obs;
    }
    birthDateController.text = selectedDate.toString();
  }

  Future<void> verifyEnrollerSponsor() async {
    if (enrollIdController.text.isEmpty) {
      _renderErrorSnackBar();
      return;
    }
    isSubmitting(true);
    update();
    try {
      sponserProfile =
          await ApiService.shared().getCustomerInfo(108357166, "customer");
      enrollerProfile =
          await ApiService.shared().getCustomerInfo(108357166, "customer");

      isSubmitting(false);
      update();
    } catch (err) {
      isSubmitting(false);
      errorMessage(err.toString());
      LoggerService.instance.e(err.toString());
      update();
    }
  }

  Future<void> verifyGovtIdNumber() async {
    if (idCardNumberController.text.isEmpty) {
      _renderErrorSnackBar();
      return;
    }
    isSubmitting(true);
    update();
    try {
      // govtIdVerification = await MemberCallsService.init()
      //     .validateIdCard(idCardNumberController.text);
      final List<ProvinceItem> allProvince =
          await MemberCallsService.init().getAllProvince("getAllProvince");
      for (final province in allProvince) {
        provinceDropdownItems.add(DropdownMenuItem(
            value: province.provienceId,
            child: Text(province.provienceNameEn)));
      }
      isSubmitting(false);
      update();
    } catch (err) {
      isSubmitting(false);
      errorMessage(err.toString());
      LoggerService.instance.e(err.toString());
      update();
    }
  }

  Future<void> getAmphuresByProvince() async {
    if (provience.isEmpty) {
      _renderErrorSnackBar();
      return;
    }
    try {
      final List<AmphurItem> allAmphures = await MemberCallsService.init()
          .getAmphuresByProvince("getAmphuresByProvince", provience.value);
      for (final amphure in allAmphures) {
        areaDropdownItems.add(DropdownMenuItem(
            value: amphure.amphurId, child: Text(amphure.amphurNameEn)));
      }
      update();
    } catch (err) {
      errorMessage(err.toString());
      LoggerService.instance.e(err.toString());
    }
  }

  Future<void> getDistrictsByAmphur() async {
    if (area.value.isEmpty) {
      _renderErrorSnackBar();
      return;
    }
    try {
      final List<DisctrictItem> allDistricts = await MemberCallsService.init()
          .getDistrictsByAmphur("getDistrictsByAmphur", area.value);
      for (final district in allDistricts) {
        subAreaDropdownItems.add(DropdownMenuItem(
            value: district.districtCode, child: Text(district.districtNameEn)));
      }
      update();
    } catch (err) {
      errorMessage(err.toString());
      LoggerService.instance.e(err.toString());
    }
  }

  Future<void> getZipcodeByDistricts() async {
    if (subArea.value.isEmpty) {
      _renderErrorSnackBar();
      return;
    }
    try {
      final List<ZipCodeResponse> zipResponse = await MemberCallsService.init()
          .getZipcodeByDistricts("getZipcodeByDistricts", subArea.value);
      zipCodeController.text = zipResponse[0].zipCode;
      update();
    } catch (err) {
      errorMessage(err.toString());
      LoggerService.instance.e(err.toString());
    }
  }

  void _renderErrorSnackBar() {
    return Get.snackbar(
      "Search field empty!",
      "Please enter user id to search.",
      titleText: const Text("Search field empty!",
          style: TextStyle(color: kPrimaryColor, fontSize: 16)),
      messageText: const Text("Please enter user id to search.",
          style: TextStyle(color: kPrimaryColor, fontSize: 14)),
      backgroundColor: Colors.white,
      borderColor: kPrimaryLightColor,
      animationDuration: const Duration(milliseconds: 300),
      snackPosition: SnackPosition.BOTTOM,
      borderRadius: 10.0,
      borderWidth: 2,
      icon: const Icon(
        Icons.error_outline,
        color: kPrimaryColor,
      ),
    );
  }
}
