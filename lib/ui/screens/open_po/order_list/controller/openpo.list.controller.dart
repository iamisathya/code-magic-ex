import 'package:dio/dio.dart';
import 'package:dsc_tools/models/inventory_item_v2.dart' hide Dialog;
import 'package:dsc_tools/services/rest_api/exceptions.dart';
import 'package:dsc_tools/ui/screens/home/controller/home.controller.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:popover/popover.dart';

import '../../../../../api/api_address.dart';
import '../../../../../api/config/api_service.dart';
import '../../../../../constants/colors.dart';
import '../../../../../constants/globals.dart';
import '../../../../../models/general_models.dart';
import '../../../../../models/open_po.dart';
import '../../../../global/widgets/unordered_list.dart';
import '../components/openpo_list_filter_dropdown.dart';
import '../components/order_status_item.dart';

class OpenPoListController extends GetxController
    with StateMixin<List<OpenPO>> {
  HomeController homeCtrl = Get.find();
  RxInt currentTab = 0.obs;
  RxList<NameValueType> availableMonthSlots = [
    NameValueType(name: "all", value: "all"),
    NameValueType(name: "6month", value: "6"),
    NameValueType(name: "12month", value: "12")
  ].obs;
  RxString filterMethod = "all".obs;
  RxBool isLoading = false.obs;
  List<OpenPO> openPlaceOrders = [];
  RxList<OpenPO> tempOpenPlaceOrders = <OpenPO>[].obs;
  RxInt selectedFilterIndex = 0.obs;
  Rx<InventoryItemV2> inventoryRecordsV2 = InventoryItemV2(items: []).obs;

  @override
  void onInit() {
    FirebaseAnalytics().setCurrentScreen(screenName: "open_po");
    initCalls();
    super.onInit();
  }

  Future<void> initCalls() async {
    isLoading.toggle();
    if(Globals.currentMarketWarehouseId.isEmpty) {
      await homeCtrl.getManagedWarehouses();
    }
    try {
      await Future.wait<void>([
        getAllOpenPo(),
        loadInventory(),
      ]);
      isLoading.toggle();
    } on AppException catch (err, stack) {
      isLoading.toggle();
      change(null, status: RxStatus.error(err.toString()));
      err.logError(err, stack);
    }
  }

  Future<void> getAllOpenPo() async {
    try {
      final List<OpenPO> allOpenPlaceOrders = await MemberCallsService.init()
          .getAllOpenPo("106", filterMethod.value, Globals.userId);
      openPlaceOrders = allOpenPlaceOrders;
      tempOpenPlaceOrders.value = RxList.from(allOpenPlaceOrders);
      if (allOpenPlaceOrders.isNotEmpty) {
        change(allOpenPlaceOrders, status: RxStatus.success());
      } else {
        change([], status: RxStatus.empty());
      }
      onFilterChange(selectedFilterIndex.value);
    }on DioError catch (e) {
      debugPrint(e.toString());
      throw "Open PO fetch error: ${e.toString()}";
    } on AppException catch (exception, stack) {
      exception.logError(exception, stack);
      throw "Open PO fetch error: ${exception.toString()}";
    }
  }

  Future<void> loadInventory() async {
    try {
      final InventoryItemV2 records = await MemberCalls2Service.auth()
          .loadInventoryProductsV2(Globals.currentMarketWarehouseId, "item",
              Globals.currentMarket!.isoCode);
      inventoryRecordsV2.value.items = List.from(records.items!);
    } on DioError catch (e) {
      debugPrint(e.toString());
      throw "Inventory error: ${e.toString()}";
    } on AppException catch (exception, stack) {
      exception.logError(exception, stack);
      throw "Inventory error: ${exception.toString()}";
    }
  }

  void onChangeMonthType(int index) {
    currentTab.value = index;
    filterMethod.value = availableMonthSlots[index].value;
    getAllOpenPo();
  }

  void openDialog(BuildContext context, String attchmentName) => showDialog(
        context: context,
        barrierColor: Colors.black87,
        builder: (BuildContext context) {
          final String url = "${Address.resource}$attchmentName";
          return Dialog(
            child: PhotoView(
              loadingBuilder: (context, event) => loadingIndicator(event),
              tightMode: true,
              imageProvider: NetworkImage(url),
              heroAttributes: PhotoViewHeroAttributes(tag: url),
            ),
          );
        },
      );

  Center loadingIndicator(ImageChunkEvent? event) {
    return Center(
      child: SizedBox(
        width: 20.0,
        height: 20.0,
        child: CircularProgressIndicator(
          value: event == null
              ? 0
              : event.cumulativeBytesLoaded / event.expectedTotalBytes!,
        ),
      ),
    );
  }

  void onFilterChange(int index) {
    switch (index) {
      case 0: //ALL
        tempOpenPlaceOrders.value = RxList.from(openPlaceOrders);
        break;
      case 1: //WAITING FOR APPROVAL
        tempOpenPlaceOrders.value =
            openPlaceOrders.where((item) => item.orderStatus == "0").toList();
        break;
      case 2: // INVENTORY TRANSFERRED
        tempOpenPlaceOrders.value =
            openPlaceOrders.where((item) => item.orderStatus == "3").toList();
        break;
      case 3: //APPROVED
        tempOpenPlaceOrders.value =
            openPlaceOrders.where((item) => item.orderStatus == "4").toList();
        break;
      case 4: //DELETED
        tempOpenPlaceOrders.value =
            openPlaceOrders.where((item) => item.orderStatus == "1").toList();
        break;
      default:
        tempOpenPlaceOrders.value = RxList.from(openPlaceOrders);
    }
  }

  void onSelectFilter() {
    onFilterChange(selectedFilterIndex.value);
    Get.back();
  }

  void showPicker(BuildContext ctx) {
    showCupertinoModalPopup(
        context: ctx, builder: (_) => OpenPoListFilterDropdown());
  }

  Widget getStatusIcon(String orderStatus) {
    switch (orderStatus) {
      case "0":
        return OrderStatusItem(
            title: "waiting_for_approval".tr.toUpperCase(),
            color: AppColor.sunglow);
      case "1":
        return OrderStatusItem(
          title: "deleted".tr.toUpperCase(),
          color: AppColor.red,
        );
      case "2":
        return OrderStatusItem(
            title: "inventory_transferred".tr.toUpperCase(),
            color: AppColor.paleViolet);
      case "3":
        return OrderStatusItem(
            title: "waiting_for_approval".tr.toUpperCase(),
            color: AppColor.sunglow);
      case "4":
        return OrderStatusItem(
            title: "approved".tr.toUpperCase(),
            color: AppColor.mediumAquamarine);
      default:
        return OrderStatusItem(
            title: "waiting_for_approval".tr.toUpperCase(),
            color: AppColor.sunglow);
    }
  }

  void showInofPopover(BuildContext context) {
    showPopover(
      context: context,
      backgroundColor: AppColor.pastelBlue,
      transitionDuration: const Duration(milliseconds: 150),
      bodyBuilder: (context) => Container(
        padding: const EdgeInsets.all(13),
        alignment: Alignment.center,
        child: const UnorderedList(
          [
            "Pre-filter Cartridge (Ultra)",
            "Promo 150 PV get Bios E Mini TH"
          ], //! 1 Hardcoded
        ),
      ),
      direction: PopoverDirection.top,
      width: Get.width * 0.8,
      height: 80,
      arrowDxOffset: Get.width / 2 - 50,
      arrowDyOffset: 0,
      arrowHeight: 15,
      arrowWidth: 30,
    );
  }
}
