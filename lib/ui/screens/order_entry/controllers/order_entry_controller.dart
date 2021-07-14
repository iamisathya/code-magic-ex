import 'package:code_magic_ex/api/config/member_class.dart';
import 'package:code_magic_ex/models/order_entry_product_item.dart';
import 'package:code_magic_ex/models/order_entry_product_info.dart';
import 'package:code_magic_ex/utilities/constants.dart';
import 'package:code_magic_ex/utilities/function.dart';
import 'package:dio/dio.dart';

import 'package:get/get.dart';
import 'package:code_magic_ex/utilities/Logger/logger.dart';

class OrderEntryTableController extends GetxController {
  RxList<String> cartProducts = <String>[].obs;
  RxList<OrderEntryItem> allProductList = <OrderEntryItem>[].obs;  
  OrderEntryProductInfo orderEntryProductInfo = OrderEntryProductInfo();  
  RxString errorMessage = "".obs;
  RxBool isSearching = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  Future<void> getOrderEntryProductList(String itemCode) async {
    const String warehouse = "https://hydra.unicity.net/v5a/warehouses/9e41f330617aa2801b45620f8ffc5615306328fa0bd2255b0d42d7746560d24c";
    try {
      // * search for users by user id(search key)
      allProductList.value = await MemberCallsService.init().getOrderEntryProductList(
          kOrderEntryProductList, "6e4234c7-fee7-4160-9e17-c029415a6b4f", warehouse);
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

  Future<void> getOrderEntryProductInfo(String itemCode) async {
    const String selectname = "itemcode190";
    try {
      // * search for users by user id(search key)
      var response = await MemberCallsService.init().getOrderEntryProductInfo(
          kOrderEntryProductInfo, itemCode, selectname);
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
}
