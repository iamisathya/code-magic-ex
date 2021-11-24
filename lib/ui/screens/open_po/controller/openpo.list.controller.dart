import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:popover/popover.dart';

import '../../../../api/api_address.dart';
import '../../../../api/config/api_service.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/globals.dart';
import '../../../../models/general_models.dart';
import '../../../../models/open_po.dart';
import '../../../../utilities/enums.dart';
import '../../../../utilities/logger.dart';
import '../../../global/theme/text_view.dart';
import '../../../global/widgets/unordered_list.dart';

class OpenPoListController extends GetxController
    with StateMixin<List<OpenPO>> {
  RxInt currentTab = 0.obs;
  RxList<NameValueType> availableMonthSlots = [
    NameValueType(name: "All", value: "all"), //! 1 Hardcoded
    NameValueType(name: "6 Month", value: "6"), //! 1 Hardcoded
    NameValueType(name: "12 Month", value: "12") //! 1 Hardcoded
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
              tightMode: true,
              imageProvider: NetworkImage(url),
              heroAttributes: PhotoViewHeroAttributes(tag: url),
            ),
          );
        },
      );

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
            openPlaceOrders.where((item) => item.orderStatus == "4").toList();
        break;
      case 3: //APPROVED
        tempOpenPlaceOrders.value =
            openPlaceOrders.where((item) => item.orderStatus == "3").toList();
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
        context: ctx,
        builder: (_) => Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  height: 48,
                  color: Colors.white,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: Get.back,
                          child: AppText(
                              text: "cancel".tr,
                              style: TextTypes.bodyText1,
                              color: AppColor.darkLiver),
                        ),
                        GestureDetector(
                          onTap: onSelectFilter,
                          child: AppText(
                            text: "done".tr,
                            style: TextTypes.headline6,
                            color: AppColor.blueCrayola,
                          ),
                        )
                      ]),
                ),
                SizedBox(
                  height: 250,
                  child: CupertinoPicker(
                    backgroundColor: AppColor.ghostWhite,
                    scrollController: FixedExtentScrollController(
                        initialItem: selectedFilterIndex.value),
                    magnification: 1.2,
                    useMagnifier: true,
                    itemExtent: 50.0,
                    onSelectedItemChanged: (val) {
                      selectedFilterIndex.value = val;
                    },
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 100,
                        child: const Text(
                          'Show All', //! 1 Hardcoded
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 100,
                        child: const Text(
                          'Wating Approval', //! 1 Hardcoded
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 100,
                        child: const Text(
                          'Inventory Transferred', //! 1 Hardcoded
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 100,
                        child: const Text(
                          'Approved', //! 1 Hardcoded
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 100,
                        child: const Text(
                          'Deleted', //! 1 Hardcoded
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ));
  }

  Widget getStatusIcon(String orderStatus) {
    switch (orderStatus) {
      case "0":
        return Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 5),
            height: 20,
            color: AppColor.sunglow,
            child: const AppText(
                text: "WAITING FOR APPROVAL", //! 1 Hardcoded
                style: TextTypes.bodyText2,
                color: Colors.white));
      case "1":
        return Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 5),
            height: 20,
            color: AppColor.red,
            child: const AppText(
                text: "DELETED", //! 1 Hardcoded
                style: TextTypes.bodyText2,
                color: Colors.white));
      case "2":
        return Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 5),
            height: 20,
            color: AppColor.paleViolet,
            child: const AppText(
                text: "INVENTORY TRANSFERRED", //! 1 Hardcoded
                style: TextTypes.bodyText2,
                color: Colors.white));
      case "3":
        return Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 5),
            height: 20,
            color: AppColor.sunglow,
            child: const AppText(
                text: "WAITING FOR APPROVAL", //! 1 Hardcoded
                style: TextTypes.bodyText2,
                color: Colors.white));
      case "4":
        return Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 5),
            height: 20,
            color: AppColor.mediumAquamarine,
            child: const AppText(
                text: "APPROVED", //! 1 Hardcoded
                style: TextTypes.bodyText2,
                color: Colors.white)); //Approved
      default:
        return Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 5),
            height: 20,
            color: AppColor.sunglow,
            child: const AppText(
                text: "WAITING FOR APPROVAL", //! 1 Hardcoded
                style: TextTypes.bodyText2,
                color: Colors.white));
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
