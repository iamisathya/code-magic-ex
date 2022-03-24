import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/model/find_customer.dart';
import '../../../data/model/search_customer.dart';
import '../../../data/model/search_reponse_by_href.dart';
import '../../../data/model/user_minimal_data.dart';
import '../../../data/services/api_service.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/function.dart';
import '../../../utils/logger.dart';
import '../../../utils/parsing.dart';
import '../../../widgets/overlay_progress.dart';

class OrderEntryController extends GetxController {
  RxInt selectedTab = 0.obs;

  RxList<OrderEntryRadioButton> searchRadioOptions = [
    OrderEntryRadioButton(
      index: 0,
      name: "ba_s_id".tr,
    ),
    OrderEntryRadioButton(
      index: 1,
      name: "govt_id_name".tr,
    ),
  ].obs;

  RxString errorMessage = "".obs;

  Rx<OrderEntryRadioButton> seletedOption =
      OrderEntryRadioButton(index: 0, name: "ba_s_id".tr).obs;

  TextEditingController searchIdTextController = TextEditingController();
  SearchCustomer searchedResultsOfHref = SearchCustomer(items: []);
  FindCustomer searchedGuestUserInfo = FindCustomer(items: []);
  RxList<SearchedUserInfo> searchResultsOfUserInfo = <SearchedUserInfo>[].obs;

  final ProgressBar _sendingMsgProgressBar = ProgressBar();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    searchIdTextController.text = "2970466";
    // controller.getOrderEntryProductList("userId");
  }

  void onChangedSearchType(OrderEntryRadioButton data) {
    seletedOption.value = searchRadioOptions[data.index];
    searchResultsOfUserInfo.clear();
    update();
  }

  Future<void> searchUserBySearchQuery(BuildContext context) async {
    if (searchIdTextController.text.isEmpty) {
      renderErrorSnackBar(
          title: "enroller_id_empty".tr, subTitle: "enter_valid_enroller".tr);
      return;
    }
    if (seletedOption.value.index == 0) {
      searchUserById(context);
    } else {
      searchUserBySearchKey(context);
    }
    update();
  }

  Future<void> searchUserById(BuildContext context) async {
    _sendingMsgProgressBar.show(context);
    try {
      // * search for users by user id(search key)
      searchedGuestUserInfo = await ApiService.shared().findCustomer(
          Parsing.intFrom(searchIdTextController.text)!, "customer");
      if (searchedGuestUserInfo.items.isNotEmpty) {
        // Move to details page
        final UserMinimalData user = UserMinimalData(
            fullName: searchedGuestUserInfo.items[0].humanName.fullName,
            email: searchedGuestUserInfo.items[0].email,
            userId: searchedGuestUserInfo.items[0].id.unicity);
        Get.toNamed(Routes.ORDER_ENTRY_TABLE, arguments: user);
      }
      _sendingMsgProgressBar.hide();
    } on DioError catch (e) {
      _onDioError(e);
    } catch (err) {
      _onCatchError(err);
    }
  }

  Future<void> searchUserBySearchKey(BuildContext context) async {
    _sendingMsgProgressBar.show(context);
    try {
      // * search for users by user id(search key)
      searchedResultsOfHref = await ApiService.shared()
          .searchCustomer(searchIdTextController.text, 1);
      if (searchedResultsOfHref.items.isNotEmpty) {
        final List<String> data =
            searchedResultsOfHref.items.map((e) => e.href).toList();
        final firstSet = data.length > 10 ?  data.take(10).toList() : data;
        searchUsersByHref(firstSet);
      }
    } on DioError catch (e) {
      _onDioError(e);
    } catch (err) {
      _onCatchError(err);
    }
  }

  Future<void> searchUsersByHref(List<String> results) async {
    try {
      // * search for users by user id(search key)
      searchResultsOfUserInfo.value = await MemberCallsService.init()
          .searchUsersByHref("getBAInfo", results);
      _sendingMsgProgressBar.hide();
    } on DioError catch (e) {
      _onDioError(e);
    } catch (err) {
      _onCatchError(err);
    } finally {
      update();
    }
  }

  void _onDioError(DioError e) {
    _sendingMsgProgressBar.hide();
    errorMessage(e.error.toString());
    final message = _getErrorMessage(e.response!.data);
    renderErrorSnackBar(
        title: "${e.response!.statusCode} Error!", subTitle: message);
    returnResponse(e.response!);
  }

  void _onCatchError(Object err) {
    errorMessage(err.toString());
    renderErrorSnackBar(
        title: "error!".tr, subTitle: "error_getting_user_details".tr);
    LoggerService.instance.e(err.toString());
    _sendingMsgProgressBar.hide();
  }

  void onClickOpenOrderEntry(SearchedUserInfo user) {
    final UserMinimalData userData = UserMinimalData(
        fullName: user.humanName.fullName,
        email: user.email,
        userId: user.id.unicity.toString());
    Get.toNamed(Routes.ORDER_ENTRY_TABLE, arguments: userData);
  }

  String _getErrorMessage(dynamic error) {
    // final errorObj = jsonDecode(error.toString());
    final mappedObj = error as Map<String, dynamic>;
    return mappedObj["error"]["error_message"].toString();
  }
}

class OrderEntryRadioButton {
  String name;
  int index;
  OrderEntryRadioButton({required this.name, required this.index});
}
