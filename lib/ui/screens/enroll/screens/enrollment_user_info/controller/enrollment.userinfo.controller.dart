import 'package:dsc_tools/api/config/api_service.dart';
import 'package:dsc_tools/models/guest_user_info.dart';
import 'package:dsc_tools/models/provience_item.dart';
import 'package:dsc_tools/ui/screens/enroll/screens/enrollment_summary/main_screen.dart';
import 'package:dsc_tools/ui/screens/enroll/screens/enrollment_user_info/components/enroll_textfield.dart';
import 'package:dsc_tools/ui/screens/enroll/screens/enrollment_user_info/components/modal_picker.dart';
import 'package:dsc_tools/ui/screens/order_entry/screens/home/components/white_search_field.dart';
import 'package:dsc_tools/utilities/images.dart';
import 'package:dsc_tools/utilities/keyboard.dart';
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

  @override
  void onInit() {
    super.onInit();
    final dynamic data = Get.arguments as Map<String, dynamic>;
    if (data != null) {
      final GuestUserInfoList enroler =
          data["enrolerProfile"] as GuestUserInfoList;
      final GuestUserInfoList sponsor =
          data["sponsorProfile"] as GuestUserInfoList;
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
                      onPress: searchAddress,
                      hintText: "Search Address",
                      isFetching: false.obs),
                ),
                const SizedBox(height: 5),
                Expanded(
                  child: ListView.builder(
                    controller: ctrl,
                    itemCount: addresses.length,
                    itemBuilder: (BuildContext ctxt, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
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
                                  child: Text("Hi",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle2!
                                          .copyWith(
                                              color: const Color(0xFF384250))),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        );
      },
    ).whenComplete(() => addressSearchController.text = "");
  }

  Future<void> searchAddress() async{
    
  }

  void onPressContinue() {
    Get.to(() => EnrollmentSummaryScreen());
  }
}
