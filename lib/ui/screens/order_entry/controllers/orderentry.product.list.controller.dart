import 'package:dsc_tools/models/general_models.dart';
import 'package:dsc_tools/utilities/enums.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderEntryProductListController extends GetxController {
  TextEditingController searchUserTextController = TextEditingController();
  RxInt currentTab = 0.obs;
  RxList<NameValueType> searchOptions = [
    NameValueType(name: "All Product", value: "all"),
    NameValueType(name: "Easyship Set", value: "easyShip"),
  ].obs;
  RxString filterMethod = "all".obs;
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

  void onProceedNext() {}

  void onTabChange(OrderEntryItemFilters type) {
    filterMethod.value = type == OrderEntryItemFilters.allProduct ? "all" : "easyShip";
  }
}
