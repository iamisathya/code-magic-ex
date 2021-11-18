import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dsc_tools/api/api_address.dart';
import 'package:dsc_tools/api/config/api_service.dart';
import 'package:dsc_tools/constants/globals.dart';
import 'package:dsc_tools/models/complete_addres.dart';
import 'package:dsc_tools/models/country_details.dart';
import 'package:dsc_tools/models/enroll_response.dart';
import 'package:dsc_tools/models/enrollee_user_data.dart';
import 'package:dsc_tools/models/guest_user_info.dart';
import 'package:dsc_tools/models/provience_item.dart';
import 'package:dsc_tools/ui/global/theme/text_view.dart';
import 'package:dsc_tools/ui/screens/enroll/screens/enrollment_summary/main_screen.dart';
import 'package:dsc_tools/ui/screens/enroll/screens/enrollment_user_info/components/modal_picker.dart';
import 'package:dsc_tools/ui/screens/order_entry/screens/home/components/white_search_field.dart';
import 'package:dsc_tools/utilities/enums.dart';
import 'package:dsc_tools/utilities/function.dart';
import 'package:dsc_tools/utilities/images.dart';
import 'package:dsc_tools/utilities/logger.dart';
import 'package:dsc_tools/utilities/snackbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

import '../../../../../../utilities/extensions.dart';

class EnrollmentUserInfoController extends GetxController {
  final FocusNode nodeText2 = FocusNode();
  RxBool isLoading = false.obs;
  RxBool isSearchingAddres = false.obs;
  RxBool isScrolButtonVisible = false.obs;
  ScrollController hideButtonController = ScrollController();
  RxInt selectedGenderIndex = 0.obs;
  RxInt selectedMaritalStatusIndex = 0.obs;
  RxInt birthDate = 0.obs;
  RxBool isUnderAgeLimit = false.obs;
  RxInt selectedProvience = 0.obs;
  final RxList<ProvinceItem> allProvince = <ProvinceItem>[].obs;
  final RxList<String> enrolmentErrorMessages = <String>[].obs;
  RxList<CompleteAddress> searchedAddresses = <CompleteAddress>[].obs;
  Rx<String> countryCode = "".obs;
  Rx<String> govtId = "".obs;

  List<String> genderOptions = ["Male", "Female"];
  List<String> maritalStatusOptions = ["Single", "Married"];
  List<String> addresses = ["Bangalore", "Mysore"];
  List<String> provienceOptions = [];

  TextEditingController addressSearchController = TextEditingController();

  TextEditingController nativeFirstNameController = TextEditingController();
  TextEditingController nativeLastNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  TextEditingController genderController = TextEditingController();
  TextEditingController maritalStatusController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();

  TextEditingController provienceController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  late GuestUserInfo enrolerProfile;
  late GuestUserInfo sponsorProfile;

  late EnrolleeUserData enroleeData;

  @override
  void onInit() {
    super.onInit();
    final dynamic data = Get.arguments as Map<String, dynamic>;
    if (data != null) {
      final GuestUserInfoList enroler =
          data["enrolerProfile"] as GuestUserInfoList;
      final GuestUserInfoList sponsor =
          data["sponsorProfile"] as GuestUserInfoList;
      govtId.value = data["govtId"] as String;
      enrolerProfile = enroler.items[0];
      sponsorProfile = sponsor.items[0];
    } else {
      Get.back();
    }
    getAllProvince();
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

  Future<void> getAllProvince() async {
    allProvince.value =
        await MemberCallsService.init().getAllProvince("getAllProvince");
    provienceOptions =
        List.from(allProvince.map((element) => element.proNameEn));
  }

  Future<void> getAddresByZipcode() async {
    if (addressSearchController.text.isEmpty) {
      SnackbarUtil.showWarning(message: "Search field shouldn't be empty");
      return;
    }
    try {
      searchedAddresses.clear();
      isSearchingAddres.toggle();
      final addressResponse = await MemberCalls2Service.init()
          .getAddressByZipcode("THA", addressSearchController.text);
      if (addressResponse.success) {
        searchedAddresses.value = addressResponse.data;
      }
      isSearchingAddres.toggle();
      update();
    } on DioError catch (e) {
      isSearchingAddres.toggle();
      SnackbarUtil.showError(message: "Error! ${e.response}");
    } catch (err, e) {
      isSearchingAddres.toggle();
      debugPrint(e.toString());
      LoggerService.instance.e(err.toString());
    }
  }

  void onTapScrollToTop() {
    isScrolButtonVisible.value = true;
    hideButtonController.animateTo(
      0.0,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 200),
    );
  }

  void onSelectFilter() {
    // onFilterChange(selectedFilterIndex.value);
    Get.back();
  }

  void showPicker(BuildContext ctx, RxInt selectedIndex, List<String> options,
      TextEditingController textCtrl) {
    showCupertinoModalPopup(
      context: ctx,
      builder: (_) => ModalPicker(
        onSelectedItemChanged: (int? val) {
          selectedIndex.value = val!;
          textCtrl.text = options[val];
        },
        onSelectFilter: () {
          Get.back();
          textCtrl.text = options[selectedIndex.value];
        },
        options: options,
        selectedIndex: selectedIndex.value,
      ),
    );
  }

  Future<DateTime?> renderDatePicker(BuildContext context) {
    final DateTime selectedDate;
    final DateTime currentDate = DateTime.now();
    final DateTime mimimumDate =
        DateTime(currentDate.year - 18, currentDate.month, currentDate.day - 1);
    if (birthdayController.text != "") {
      final selcted = DateFormat("yyyy-MM-dd").parse(birthdayController.text);
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
    birthdayController.text = selectedDate.toString();
  }

  void openAddressSearchDialog(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: const Color(0xFFF5F5F5),
      context: context,
      isDismissible: true,
      builder: (context) {
        return DraggableScrollableSheet(
          minChildSize: 0.2,
          maxChildSize: 0.75,
          expand: false,
          builder: (_, ctrl) => Container(
            color: const Color(0xFFE3E8ED),
            padding: const EdgeInsets.all(8),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 4, right: 4, top: 4),
                  child: WhiteSearchField(
                      controller: addressSearchController,
                      onPress: getAddresByZipcode,
                      hintText: "Search Address",
                      isFetching: isSearchingAddres),
                ),
                const SizedBox(height: 5),
                if (searchedAddresses.isNotEmpty)
                  Obx(() => Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                            'Found ${searchedAddresses.length} item(s) matched with "${addressSearchController.text}".'),
                      )),
                Expanded(
                  child: Obx(
                    () => ListView.builder(
                      controller: ctrl,
                      itemCount: searchedAddresses.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        final CompleteAddress item = searchedAddresses[index];
                        if (searchedAddresses.isEmpty) {
                          return const Center(
                              child: AppText(
                                  text: "Sorry no addres found!",
                                  style: TextTypes.bodyText2));
                        }
                        return GestureDetector(
                          onTap: () => _onSelectAddress(item),
                          child: Card(
                            child: Container(
                              height: 50,
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: SvgPicture.asset(kLocationIcon,
                                        width: 20),
                                  ),
                                  Expanded(
                                    child: Text(item.searchAddressRoman!,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2!
                                            .copyWith(
                                                color:
                                                    const Color(0xFF384250))),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    ).whenComplete(clearAddress);
  }

  void _onSelectAddress(CompleteAddress address) {
    Navigator.pop(Get.context!);
    districtController.text = address.returnAddressRoman!;
    provienceController.text = address.cityRoman!;
    zipCodeController.text = address.zip!;
    countryCode.value = address.countryCode!;
  }

  Future<void> verifyEnrollForm() async {
    try {
      final alpha2Code =
          countryCode.value != "" ? countryCode.value : Globals.countryCode;
      final CountryDetails item = await getCountryCode(alpha2Code);
      final phoneNumber = mobileNumberController.text.length > 9
          ? mobileNumberController.text.substring(0, 9)
          : mobileNumberController.text;

      enroleeData = EnrolleeUserData(
          enrollerId: enrolerProfile.id.unicity.toString(),
          enrollerName: enrolerProfile.humanName.fullName,
          sponsorId: sponsorProfile.id.unicity.toString(),
          sponsorName: sponsorProfile.humanName.fullName,
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          firstNameTh: nativeFirstNameController.text,
          lastNameTh: nativeLastNameController.text,
          gender: genderController.text,
          maritalStatus: maritalStatusController.text,
          dateOfBirth: birthdayController.text,
          mainAddress1: districtController.text,
          mainAddress2: streetController.text,
          city: provienceController.text,
          country: item.code!,
          zipCode: zipCodeController.text,
          email: emailController.text,
          mobileNumber: mobileNumberController.text,
          phoneNumber: phoneNumber,
          taxId: govtId.value,
          password: "1234");

      isLoading.toggle();
      final response = await MemberCallsService.init().verifyEnrollForm(
          "English",
          firstNameController.text,
          lastNameController.text,
          nativeFirstNameController.text,
          nativeLastNameController.text,
          genderController.text.toLowerCase(),
          maritalStatusController.text,
          birthdayController.text,
          districtController.text,
          streetController.text,
          streetController.text,
          item.code!,
          zipCodeController.text,
          emailController.text,
          mobileNumberController.text,
          phoneNumber,
          "22222");
      final body = json.decode(response.toString());
      final enrollResponse =
          EnrollResponse.fromJson(body as Map<String, dynamic>);
      if (enrollResponse.success == "No" && enrollResponse.message.isNotEmpty) {
        enrolmentErrorMessages.clear();
        enrolmentErrorMessages.addAll(enrollResponse.message);
      } else {
        enrolmentErrorMessages.clear();
        Get.to(() => EnrollmentSummaryScreen(), arguments: enroleeData);
      }
      isLoading.toggle();
    } catch (err, s) {
      isLoading.toggle();
      debugPrint(s.toString());
      LoggerService.instance.e(err.toString());
    }
  }

  void clearAddress() {
    addressSearchController.text = "";
    searchedAddresses.clear();
  }

  void onPressContinue() {
    Get.to(() => EnrollmentSummaryScreen());
  }
}
