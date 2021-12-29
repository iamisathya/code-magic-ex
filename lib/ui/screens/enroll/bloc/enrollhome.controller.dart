import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart'
    hide StringTranslateExtension;
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';

import '../../../../api/config/api_service.dart';
import '../../../../models/amphur_item.dart';
import '../../../../models/district_item.dart';
import '../../../../models/enroll_response.dart';
import '../../../../models/enrollee_user_data.dart';
import '../../../../models/govt_id_verify.dart';
import '../../../../models/guest_user_info.dart';
import '../../../../models/provience_item.dart';
import '../../../../models/zip_code_response.dart';
import '../../../../utilities/constants.dart';
import '../../../../utilities/extensions.dart';
import '../../../../utilities/function.dart';
import '../../../../utilities/logger.dart';
import '../../../../utilities/parsing.dart';
import '../../../global/widgets/overlay_progress.dart';
import '../screens/enroll_confirmation/enrollconfirmation.screen.dart';

class EnrollController extends GetxController {
  ScrollController scrollController = ScrollController();

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
  Rx<bool> isEnrollerIdSuccess = false.obs;
  Rx<bool> isGovtIdSuccess = false.obs;
  RxBool loading = false.obs;
  RxString errorMessage = "".obs;
  RxBool isUnderAgeLimit = false.obs;
  RxList<String> errorMessages = <String>[].obs;
  RxBool isEnrollerSponsorVerified = false.obs;
  RxBool isGovtIdVerified = false.obs;
  RxString enrollerSponsorVerifyButton = "verify_enroller".tr.obs;
  RxString govtIdVerifyButton = "verify_id".tr.obs;
  String enrollerName = "";
  String sponsorName = "";

  List<DropdownMenuItem<String>> genderDropdownItems = [
    DropdownMenuItem(value: "", child: Text("select_gender".tr)),
    DropdownMenuItem(value: "male", child: Text("male".tr)),
    DropdownMenuItem(value: "female", child: Text("female".tr)),
  ];

  List<DropdownMenuItem<String>> statusDropdownItems = [
    DropdownMenuItem(value: "", child: Text("select_status".tr)),
    DropdownMenuItem(value: "Single", child: Text("single".tr)),
    DropdownMenuItem(value: "Married", child: Text("married".tr)),
  ];

  RxList<DropdownMenuItem<String>> provinceDropdownItems = [
    DropdownMenuItem(value: "", child: Text("select_province".tr)),
  ].obs;

  RxList<DropdownMenuItem<String>> areaDropdownItems = [
    DropdownMenuItem(value: "", child: Text("select_province".tr)),
  ].obs;

  RxList<DropdownMenuItem<String>> subAreaDropdownItems = [
    const DropdownMenuItem(value: "", child: Text("Select Sub-Area")),
  ].obs;

  List<DropdownMenuItem<String>> countryDropdownItems = [
    const DropdownMenuItem(value: "th", child: Text("Thailand")),
  ];

  late EnrolleeUserData enroleeData;

  final ProgressBar _sendingMsgProgressBar = ProgressBar();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    idCardNumberController.text =
        "1981156516516"; // valid: 5994200922960 invalid: 1981156516516
    enrollIdController.text = "108357166";
    sponsorIdController.text = "108357166";
    firstNameThController.text = "ทดสอบ";
    lastNameThController.text = "สาธยา";
    firstNameEnController.text = "test".tr;
    lastNameEnController.text = "account".tr;
    // userGender.value = "Male";
    // maritalStatus.value = "Married";
    mainAddressController.text = "main_address".tr;
    zipCodeController.text = "14000";
    emailAddressController.text = "nomail@unicity.com";
    phoneNumberController.text = "990099009";
    mobileNumberController.text = "9900990099";
  }

  Future<DateTime?> renderDatePicker(BuildContext context) {
    final DateTime selectedDate;
    final DateTime currentDate = DateTime.now();
    final DateTime mimimumDate =
        DateTime(currentDate.year - 18, currentDate.month, currentDate.day - 1);
    if (birthDateController.text != "") {
      final selcted = DateFormat("yyyy-MM-dd").parse(birthDateController.text);
      selectedDate = DateTime(selcted.year, selcted.month, selcted.day);
    } else {
      selectedDate = mimimumDate;
    }
    return DatePicker.showDatePicker(context,
        maxTime: mimimumDate,
        currentTime: selectedDate,
        onConfirm: (date) => onChangeBirthDay(date));
  }

  void onChangeBirthDay(DateTime date) {
    final String selectedDate = DateFormat('yyyy-MM-dd').format(date);
    if (!date.isAdult(date)) {
      isUnderAgeLimit = true.obs;
    }
    birthDateController.text = selectedDate.toString();
  }

  Future<void> verifyEnrollerSponsor(BuildContext context) async {
    if (enrollIdController.text.isEmpty) {
      _renderErrorSnackBar("enroller_id_empty".tr, "enter_valid_enroller".tr);
      return;
    }
    enrollerSponsorVerifyButton.value = "verifying".tr;
    isSubmitting(true);
    errorMessages.clear();
    isGovtIdSuccess.value = false;
    isEnrollerIdSuccess.value = false;
    update();
    try {
      _sendingMsgProgressBar.show(context);
      // * if sponsor & enroller are same
      if (enrollIdController.text == sponsorIdController.text) {
        enrollerProfile = await ApiService.shared().getCustomerInfo(
            Parsing.intFrom(enrollIdController.text)!, "customer");
        sponserProfile = enrollerProfile;
        enrollerName = enrollerProfile.items[0].humanName.fullName;
        sponsorName = enrollerProfile.items[0].humanName.fullName;
      } else {
        // * Calling sponser validation
        sponserProfile = await ApiService.shared().getCustomerInfo(
            Parsing.intFrom(enrollIdController.text)!, "customer");
        enrollerName = sponserProfile.items[0].humanName.fullName;

        // * Calling enroller validation
        enrollerProfile = await ApiService.shared().getCustomerInfo(
            Parsing.intFrom(sponsorIdController.text)!, "customer");
        sponsorName = enrollerProfile.items[0].humanName.fullName;
      }
      enrollerSponsorVerifyButton.value = "verified".tr;
      isEnrollerIdSuccess.value = true;
      _sendingMsgProgressBar.hide();
      isSubmitting(false);
      update();
    } on DioError catch (e) {
      _sendingMsgProgressBar.hide();
      enrollerSponsorVerifyButton.value = "verify_enroller".tr;
      isSubmitting(false);
      _renderErrorSnackBar("error!", e.error.toString());
      returnResponse(e.response!);
    } catch (err) {
      _sendingMsgProgressBar.hide();
      enrollerSponsorVerifyButton.value = "verify_enroller".tr;
      isSubmitting(false);
      errorMessage(err.toString());
      LoggerService.instance.e(err.toString());
      update();
    }
  }

  void onProvienceChange(String value) {
    if (provience.value != value) {
      area.value = "";
      subArea.value = "";
      provience.value = value;
      getAmphuresByProvince();
    }
  }

  void onAreaChange(String value) {
    if (area.value != value) {
      subArea.value = "";
      area.value = value;
      getDistrictsByAmphur();
    }
  }

  void onSubAreaChange(String value) {
    if (subArea.value != value) {
      subArea.value = value;
      getZipcodeByDistricts();
    }
  }

  Future<void> verifyGovtIdNumber(BuildContext context) async {
    if (idCardNumberController.text.isEmpty) {
      _renderErrorSnackBar("empty".tr, "enter_valid_govt_id".tr);
      return;
    }
    govtIdVerifyButton.value = "verifying".tr;
    isSubmitting(true);
    update();
    try {
      _sendingMsgProgressBar.show(context);
      govtIdVerification = await MemberCallsService.init()
          .validateIdCard(idCardNumberController.text);
      final List<ProvinceItem> allProvince =
          await MemberCallsService.init().getAllProvince("getAllProvince");
      for (final province in allProvince) {
        provinceDropdownItems.add(DropdownMenuItem(
            value: province.provienceId,
            child: Text(province.provienceNameEn)));
      }
      govtIdVerifyButton.value = "verified".tr;
      isGovtIdSuccess.value = true;
      isSubmitting(false);
      Timer(const Duration(milliseconds: 20), () {
        scrollController.animateTo(
          750,
          curve: Curves.easeOut,
          duration: const Duration(milliseconds: 500),
        );
      });
      _sendingMsgProgressBar.hide();
      update();
    } catch (err) {
      _sendingMsgProgressBar.hide();
      govtIdVerifyButton.value = "verified_id".tr; //!hardcoded
      isSubmitting(false);
      errorMessage(err.toString());
      LoggerService.instance.e(err.toString());
      update();
    }
  }

  Future<void> getAmphuresByProvince() async {
    if (provience.isEmpty) {
      _renderErrorSnackBar("select_province".tr, "select_province_msg".tr);
      return;
    }
    try {
      final List<AmphurItem> allAmphures = await MemberCallsService.init()
          .getAmphuresByProvince("getAmphuresByProvince", provience.value);
      areaDropdownItems.clear();
      areaDropdownItems.add(DropdownMenuItem(
          value: "", child: Text("select_area".tr)));
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
      _renderErrorSnackBar("select_amphur".tr,
          "select_amphur_to_proceed".tr);
      return;
    }
    try {
      final List<DisctrictItem> allDistricts = await MemberCallsService.init()
          .getDistrictsByAmphur("getDistrictsByAmphur", area.value);
      subAreaDropdownItems.clear();
      subAreaDropdownItems.add(const DropdownMenuItem(
          value: "", child: Text("Select Sub-Area"))); //!hardcoded
      for (final district in allDistricts) {
        subAreaDropdownItems.add(DropdownMenuItem(
            value: district.districtCode,
            child: Text(district.districtNameEn)));
      }
      update();
    } catch (err) {
      errorMessage(err.toString());
      LoggerService.instance.e(err.toString());
    }
  }

  Future<void> getZipcodeByDistricts() async {
    if (subArea.value.isEmpty) {
      _renderErrorSnackBar("select_disctrict".tr, "select_disctrict_msg".tr);
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

  Future<void> verifyEnrollForm(BuildContext context) async {
    enroleeData = EnrolleeUserData(
        enrollerId: enrollIdController.text,
        enrollerName: enrollerName,
        sponsorId: sponsorIdController.text,
        sponsorName: sponsorName,
        firstName: firstNameEnController.text,
        lastName: lastNameEnController.text,
        firstNameTh: firstNameThController.text,
        lastNameTh: lastNameThController.text,
        gender: userGender.value,
        maritalStatus: maritalStatus.value,
        dateOfBirth: birthDateController.text,
        mainAddress1: mainAddressController.text,
        mainAddress2: "${area.value} ${subArea.value}",
        city: "city",
        country: country.value,
        zipCode: zipCodeController.text,
        email: emailAddressController.text,
        mobileNumber: mobileNumberController.text,
        phoneNumber: phoneNumberController.text,
        taxId: idCardNumberController.text,
        password: idCardNumberController.text);
    try {
      _sendingMsgProgressBar.show(context);
      final response = await MemberCallsService.init().verifyEnrollForm(
          "English",
          firstNameEnController.text,
          lastNameEnController.text,
          firstNameThController.text,
          lastNameThController.text,
          userGender.value,
          maritalStatus.value,
          birthDateController.text,
          mainAddressController.text,
          "${area.value} ${subArea.value}",
          area.value,
          country.value,
          zipCodeController.text,
          emailAddressController.text,
          mobileNumberController.text,
          phoneNumberController.text,
          "22222");
      final body = json.decode(response.toString());
      final enrollResponse =
          EnrollResponse.fromJson(body as Map<String, dynamic>);
      if (enrollResponse.success == "No" && enrollResponse.message.isNotEmpty) {
        // * Scroll to bottom to see error
        Timer(const Duration(milliseconds: 20), () {
          scrollController.animateTo(
            scrollController.position.maxScrollExtent,
            curve: Curves.easeOut,
            duration: const Duration(milliseconds: 300),
          );
        });
        errorMessages.clear();
        errorMessages.addAll(enrollResponse.message);
      } else {
        errorMessages.clear();
        Get.to(() => EnrollConfirmation(),
            transition: Transition.cupertino, arguments: enroleeData);
      }
      _sendingMsgProgressBar.hide();
      update();
    } catch (err) {
      _sendingMsgProgressBar.hide();
      errorMessage(err.toString());
      LoggerService.instance.e(err.toString());
    }
  }

  void _renderErrorSnackBar(String title, String message) {
    return Get.snackbar(
      title,
      message,
      titleText: Text(title,
          style: TextStyle(
              color: Theme.of(Get.context!).colorScheme.primary, fontSize: 16)),
      messageText: Text(message,
          style: TextStyle(
              color: Theme.of(Get.context!).colorScheme.primary, fontSize: 14)),
      backgroundColor: Colors.white,
      borderColor: kPrimaryLightColor,
      animationDuration: const Duration(milliseconds: 300),
      snackPosition: SnackPosition.BOTTOM,
      borderRadius: 10.0,
      borderWidth: 2,
      icon: Icon(
        Icons.error_outline,
        color: Theme.of(Get.context!).colorScheme.primary,
      ),
    );
  }
}
