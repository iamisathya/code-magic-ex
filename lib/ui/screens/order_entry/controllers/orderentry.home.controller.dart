import 'package:dsc_tools/models/general_models.dart';
import 'package:dsc_tools/ui/screens/order_entry/screens/order_entry_list/home.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderEntryUserListController extends GetxController {
  TextEditingController searchUserTextController = TextEditingController();
  RxInt currentTab = 0.obs;
  RxList<NameValueType> searchOptions = [
    NameValueType(name: "With BA Number", value: "baId"),
    NameValueType(name: "with Govt ID, Name", value: "govtIdOrName"),
  ].obs;
  RxString filterMethod = "baId".obs;
  RxBool isLoading = false.obs;
  RxList<String> searchedUsers = <String>["Hi", "Sathya"].obs;
  final selecteduserIndex = Rxn<int>();

  @override
  void onInit() {
    FirebaseAnalytics().setCurrentScreen(screenName: "order_entry");
    super.onInit();
  }

  void onChangeMonthType(int index) {
    currentTab.value = index;
    filterMethod.value = searchOptions[index].value;
    // getAllOpenPo();
  }

  void onSelectUser(int idx) {
    searchUserTextController.text = searchedUsers[idx];
    selecteduserIndex.value = idx;
    searchedUsers.refresh();
  }

  void onSearchPressed() {}

  void onCancel() {}

  void onProceedNext() {
    Get.to(() => OrderEntryList());
  }
}
