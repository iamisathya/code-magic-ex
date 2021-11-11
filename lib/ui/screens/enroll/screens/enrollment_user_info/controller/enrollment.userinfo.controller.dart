import 'package:dio/dio.dart';
import 'package:dsc_tools/api/config/api_service.dart';
import 'package:dsc_tools/models/provience_item.dart';
import 'package:dsc_tools/ui/screens/enroll/screens/enrollment_user_info/components/address_search.dart';
import 'package:dsc_tools/ui/screens/enroll/screens/enrollment_user_info/components/enroll_textfield.dart';
import 'package:dsc_tools/ui/screens/enroll/screens/enrollment_user_info/components/modal_picker.dart';
import 'package:dsc_tools/utilities/keyboard.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

import '../../../../../../utilities/extensions.dart';

class EnrollmentUserInfoController extends GetxController {
  final FocusNode nodeText2 = FocusNode();
  RxBool isLoading = false.obs;
  RxBool isScrolButtonVisible = false.obs;
  ScrollController hideButtonController = ScrollController();
  RxInt selectedGenderIndex = 0.obs;
  RxInt selectedMaritalStatusIndex = 0.obs;
  RxInt birthDate = 0.obs;
  RxBool isUnderAgeLimit = false.obs;
  RxInt selectedProvience = 0.obs;
  final RxList<ProvinceItem> allProvince = <ProvinceItem>[].obs;

  List<String> genderOptions = ["Male", "Female"];
  List<String> maritalStatusOptions = ["Single", "Married"];
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

  @override
  void onInit() {
    super.onInit();
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

  void openAddressSearchDialog(BuildContext context) => showDialog(
        context: context,
        barrierDismissible: false,
        barrierColor: Colors.black54,
        builder: (BuildContext context) {
          return Dialog(
            insetPadding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
            child: EnrollTextField(
                controller: addressSearchController,
                isLoading: false,
                label: 'Zip Code',
                showIcon: true,
                onIconTap: () {
                  Get.back();
                  KeyboardUtil.hideKeyboard(context);
                },
                textInputAction: TextInputAction.go),
          );
        },
      );

  // Future<UserModel>? searchAddresByZipCode(String filter) async {
  //   var response = await Dio().get(
  //       "http://5d85ccfb1e61af001471bf60.mockapi.io/user",
  //       queryParameters: {"filter": filter},
  //   );
  //   final models = UserModel.fromJsonList(response.data as List<Map<String, dynamic>>);
  //   return models;
  // }
}
