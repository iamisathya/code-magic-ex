import 'package:code_magic_ex/api/config/api_service.dart';
import 'package:code_magic_ex/api/config/member_class.dart';
import 'package:code_magic_ex/models/find_customer.dart';
import 'package:code_magic_ex/models/search_customer.dart';
import 'package:code_magic_ex/models/search_reponse_by_href.dart';
import 'package:code_magic_ex/ui/screens/order_entry/controllers/order_entry_controller.dart';
import 'package:code_magic_ex/ui/screens/order_entry/screens/order_entry.dart';
import 'package:code_magic_ex/utilities/core/parsing.dart';
import 'package:code_magic_ex/utilities/function.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:code_magic_ex/utilities/Logger/logger.dart';

class OrderEntryController extends GetxController {
  final OrderEntryTableController controller = Get.put(OrderEntryTableController());
  RxInt selectedTab = 0.obs;

  RxList<OrderEntryRadioButton> searchRadioOptions = [
    OrderEntryRadioButton(
      index: 0,
      name: "BA's ID",
    ),
    OrderEntryRadioButton(
      index: 1,
      name: "Govt ID, Name..",
    ),
  ].obs;

  RxBool isSearching = false.obs;
  RxString errorMessage = "".obs;

  Rx<OrderEntryRadioButton> seletedOption =
      OrderEntryRadioButton(index: 0, name: "BA's ID").obs;

  TextEditingController searchIdTextController = TextEditingController();
  SearchCustomer searchedResultsOfHref = SearchCustomer(items: []);
  FindCustomer searchedGuestUserInfo = FindCustomer(items: []);
  RxList<SearchedUserInfo> searchResultsOfUserInfo = <SearchedUserInfo>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    searchIdTextController.text = "3011266";
    // controller.getOrderEntryProductList("userId");
  }

  void onChangedSearchType(OrderEntryRadioButton data) {
    seletedOption.value = searchRadioOptions[data.index];
    update();
  }

  Future<void> searchUserBySearchQuery() async {
    if (searchIdTextController.text.isEmpty) {
      renderErrorSnackBar(
          title: "Enroller ID empty", subTitle: "Please enter valid enroller");
      return;
    }
    isSearching.value = true;
    if (seletedOption.value.index == 0) {
      searchUserById();
    } else {
      searchUserBySearchKey();
    }
    update();
  }

  Future<void> searchUserById() async {
    try {
      // * search for users by user id(search key)
      searchedGuestUserInfo = await ApiService.shared().findCustomer(
          Parsing.intFrom(searchIdTextController.text)!, "customer");
      if (searchedResultsOfHref.items.isNotEmpty) {
        // Move to details page
      }
      isSearching(false);
    } on DioError catch (e) {
      renderErrorSnackBar(title: "Error!", subTitle: e.error.toString());
      returnResponse(e.response!);
      errorMessage( e.error.toString());
    } catch (err) {
      errorMessage(err.toString());
      LoggerService.instance.e(err.toString());
    } finally {
      isSearching(false);
    }
  }

  Future<void> searchUserBySearchKey() async {
    try {
      // * search for users by user id(search key)
      searchedResultsOfHref = await ApiService.shared()
          .searchCustomer(searchIdTextController.text, 1);
      if (searchedResultsOfHref.items.isNotEmpty) {
        final List<String> data =
            searchedResultsOfHref.items.map((e) => e.href).toList();
        searchUsersByHref(data);
      }
    } on DioError catch (e) {
      errorMessage(e.error.toString());
      renderErrorSnackBar(title: "Error!", subTitle: e.error.toString());
      returnResponse(e.response!);
    } catch (err) {
      errorMessage(err.toString());
      LoggerService.instance.e(err.toString());
    }
  }

  Future<void> searchUsersByHref(List<String> results) async {
    try {
      // * search for users by user id(search key)
      searchResultsOfUserInfo.value = await MemberCallsService.init()
          .searchUsersByHref("getBAInfo", results);
    } on DioError catch (e) {
      errorMessage(e.error.toString());
      renderErrorSnackBar(title: "Error!", subTitle: e.error.toString());
      returnResponse(e.response!);
    } catch (err) {
      errorMessage(err.toString());
      LoggerService.instance.e(err.toString());
    } finally {
      update();
      isSearching(false);
    }
  }

  void onClickOpenOrderEntry(String userId) {
    Get.to(() => OrderEntryTable(), arguments: userId);
  }
}

class OrderEntryRadioButton {
  String name;
  int index;
  OrderEntryRadioButton({required this.name, required this.index});
}
