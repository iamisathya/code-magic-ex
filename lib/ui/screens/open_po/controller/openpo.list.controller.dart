import 'package:dsc_tools/api/api_address.dart';
import 'package:dsc_tools/api/config/api_service.dart';
import 'package:dsc_tools/constants/globals.dart';
import 'package:dsc_tools/models/general_models.dart';
import 'package:dsc_tools/models/open_po.dart';
import 'package:dsc_tools/utilities/images.dart';
import 'package:dsc_tools/utilities/logger.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

class OpenPoListController extends GetxController
    with StateMixin<List<OpenPO>> {
  RxInt currentTab = 0.obs;
  RxList<NameValueType> availableMonthSlots = [
    NameValueType(name: "All", value: "all"),
    NameValueType(name: "6 Month", value: "6"),
    NameValueType(name: "12 Month", value: "12")
  ].obs;
  RxString filterMethod = "all".obs;
  RxBool isLoading = false.obs;

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

  String getStatusIcon(String orderStatus) {
    switch (orderStatus) {
      case "0":
        return kPendingImage;
      case "1":
        return kPendingImage; // Deleted
      case "2":
        return kWarningImage;
      case "3":
        return kWarningImage; //Processing
      case "4":
        return kApprovalImage;
      default:
        return kWarningImage;
    }
  }
}
