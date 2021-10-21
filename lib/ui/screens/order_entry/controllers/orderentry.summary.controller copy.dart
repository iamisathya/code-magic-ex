import 'package:dsc_tools/models/general_models.dart';
import 'package:dsc_tools/ui/screens/order_entry/screens/order_entry_summary/components/discard_alert.dart';
import 'package:dsc_tools/utilities/enums.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderEntryCheckoutSummaryController extends GetxController {
  TextEditingController searchUserTextController = TextEditingController();
  RxInt currentTab = 0.obs;
  RxList<NameValueType> searchOptions = [
    NameValueType(name: "My Cart", value: "myCart"),
    NameValueType(name: "Payment Type", value: "paymentType"),
  ].obs;
  RxString filterMethod = "myCart".obs;
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

  void onCancel(BuildContext context) {
    showModalBottomSheet<void>(
        context: context,
          backgroundColor: Colors.transparent,
        builder: (BuildContext context) {
          return const DiscardAlert();
        });
  }

  void onProceedNext() {}

  void onTabChange(OrderEntrySummaryFilters type) {
    filterMethod.value =
        type == OrderEntrySummaryFilters.myCart ? "myCart" : "paymentType";
  }
}
