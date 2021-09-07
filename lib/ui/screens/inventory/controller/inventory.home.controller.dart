import 'package:dio/dio.dart';
import 'package:dsc_tools/api/config/api_service.dart';
import 'package:dsc_tools/models/general_models.dart';
import 'package:dsc_tools/models/inventory_records.dart';
import 'package:dsc_tools/utilities/function.dart';
import 'package:dsc_tools/utilities/logger.dart';
import 'package:dsc_tools/utilities/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InventoryHomeController extends GetxController {
  RxList<NameValueType> viewTypes = [
    NameValueType(name: "Card View", value: "card"),
    NameValueType(name: "Table View", value: "table")
  ].obs;

  RxList<NameValueType> stockOptions = [
    NameValueType(name: "On Hand", value: "onHand"),
    NameValueType(name: "Out Of Stock", value: "outOfStock")
  ].obs;

  Rx<NameValueType> activeStockType =
      NameValueType(name: "On Hand", value: "onHand").obs;
  Rx<NameValueType> currentViewType =
      NameValueType(name: "Card View", value: "card").obs;

  RxBool isLoading = false.obs;

  TextEditingController searchController = TextEditingController();
  Rx<InventoryRecords> inventoryRecords = InventoryRecords(items: []).obs;
  Rx<InventoryRecords> tempInventoryRecords = InventoryRecords(items: []).obs;

  @override
  void onInit() {
    loadInventoryProducts();
    super.onInit();
  }

  Future<void> loadInventoryProducts() async {
    isLoading.toggle();
    const String type = "item";
    const String userId =
        "9e41f330617aa2801b45620f8ffc5615306328fa0bd2255b0d42d7746560d24c";
    try {
      inventoryRecords.value =
          await ApiService.shared().getInventoryRecords(userId, type);
      tempInventoryRecords.value.items =
          List.from(inventoryRecords.value.items);
      isLoading.toggle();
    } on DioError catch (e) {
      isLoading.toggle();
      final String message = getErrorMessage(e.response!.data);
      SnackbarUtil.showError(message: message);
      returnResponse(e.response!);
    } catch (err) {
      isLoading.toggle();
      LoggerService.instance.e(err.toString());
    }
  }

  void onChangeStockType(String value) {
    activeStockType.value =
        stockOptions.firstWhere((element) => element.value == value);
    if (value == "outOfStock") {
      tempInventoryRecords.value.items = tempInventoryRecords.value.items
          .where((item) => item.quantityOnHand != "0")
          .toList();
    } else {
      tempInventoryRecords.value.items =
          List.from(inventoryRecords.value.items);
    }
    tempInventoryRecords.refresh();
  }

  void onChangeViewType(String value) {
    currentViewType.value =
        viewTypes.firstWhere((element) => element.value == value);
  }
}
