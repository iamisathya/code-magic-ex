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
import '../../../../../utilities/logger.dart';
import '../../../../global/widgets/unordered_list.dart';
import '../components/openpo_list_filter_dropdown.dart';
import '../components/order_status_item.dart';

class OpenPoListController extends GetxController
    with StateMixin<List<OpenPO>> {
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

  @override
  void onInit() {
    FirebaseAnalytics().setCurrentScreen(screenName: "open_po");
    getAllOpenPo();
    super.onInit();
  }

  void onChangeMonthType(int index) {
    currentTab.value = index;
    filterMethod.value = availableMonthSlots[index].value;
    getAllOpenPo();
  }

  Future<void> getAllOpenPo() async {
    isLoading.toggle();
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
      isLoading.toggle();
    } catch (err) {
      isLoading.toggle();
      change(null, status: RxStatus.error(err.toString()));
      LoggerService.instance.e(err.toString());
    }
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
