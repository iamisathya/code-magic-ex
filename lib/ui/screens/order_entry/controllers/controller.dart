import 'package:code_magic_ex/api/api_address.dart';
import 'package:code_magic_ex/api/config/api_service.dart';
import 'package:code_magic_ex/models/find_customer.dart';
import 'package:code_magic_ex/models/search_customer.dart';
import 'package:code_magic_ex/models/search_reponse_by_href.dart';
import 'package:code_magic_ex/utilities/core/parsing.dart';
import 'package:code_magic_ex/utilities/function.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:code_magic_ex/utilities/Logger/logger.dart';

class OrderEntryController extends GetxController {
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

  Rx<OrderEntryRadioButton> seletedOption = OrderEntryRadioButton(index: 0, name: "BA's ID").obs;

  TextEditingController searchIdTextController = TextEditingController();
  SearchCustomer searchedResultsOfHref = SearchCustomer(items: []);
  FindCustomer searchedGuestUserInfo = FindCustomer(items: []);
  List<SearchedUserInfo> searchResultsOfUserInfo = <SearchedUserInfo>[];

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
    if (seletedOption.value.index == 0) {
      searchUserById();
    } else {
      searchUserBySearchKey();
    }
  }

  Future<void> searchUserById() async {
    try {
      // * search for users by user id(search key)
      searchedGuestUserInfo = await ApiService.shared().findCustomer(
          Parsing.intFrom(searchIdTextController.text)!, "customer");
      if (searchedResultsOfHref.items.isNotEmpty) {
        // Move to details page
      }
      update();
    } on DioError catch (e) {
      renderErrorSnackBar(title: "Error!", subTitle: e.error.toString());
      returnResponse(e.response!);
    } catch (err) {
      LoggerService.instance.e(err.toString());
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
      update();
    } on DioError catch (e) {
      renderErrorSnackBar(title: "Error!", subTitle: e.error.toString());
      returnResponse(e.response!);
    } catch (err) {
      LoggerService.instance.e(err.toString());
    }
  }

  Future<void> searchUsersByHref(List<String> results) async {
    try {
      // * search for users by user id(search key)
      final Dio dio = Dio();
      var response = await dio.post(
          "${Address.memberCallsBase + Address.validOrders}?type=getBAInfo",
          data: results);
      update();
    } on DioError catch (e) {
      renderErrorSnackBar(title: "Error!", subTitle: e.error.toString());
      returnResponse(e.response!);
    } catch (err) {
      LoggerService.instance.e(err.toString());
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    searchIdTextController.text = "3011266";
  }
}

class OrderEntryRadioButton {
  String name;
  int index;
  OrderEntryRadioButton({required this.name, required this.index});
}
