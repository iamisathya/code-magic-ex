import 'package:dsc_tools/constants/colors.dart';
import 'package:dsc_tools/ui/screens/barcode/barcode.screen.dart';
import 'package:dsc_tools/ui/screens/dashboard/components/dashboard_menu_item.dart';
import 'package:dsc_tools/ui/screens/easy_ship/easyship.screen.dart';
import 'package:dsc_tools/ui/screens/enroll/enrollhome.screen.dart';
import 'package:dsc_tools/ui/screens/inventory/inventory.screen.dart';
import 'package:dsc_tools/ui/screens/open_po/order_list/home_screen.dart';
import 'package:dsc_tools/ui/screens/order_entry/orderentry.screen.dart';
import 'package:dsc_tools/ui/screens/sales_reports/salesreports.screen.dart';
import 'package:dsc_tools/ui/screens/settings/settings.screen.dart';
import 'package:dsc_tools/utilities/function.dart';
import 'package:dsc_tools/utilities/images.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../utilities/user_session.dart';
import '../../login/login.screen.dart';

class DashboardController extends GetxController {
  RxBool isReportOptionShown = false.obs;
  final ImagePicker _picker = ImagePicker();
  RxString selectedFileName = "".obs;
  RxInt currentActiveImage = 0.obs;
  String? selectedImageBaes64 = "";
  XFile uploadFile = XFile("");

  List<DashboardMenuItem> items = [
    DashboardMenuItem(
      color: AppColor.juneBud,
      title: "open_po".tr,
      icon: kOpenPoDashboardIcon,
      page: OpenPoHomeScreen.routeName,
    ),
    DashboardMenuItem(
      color: AppColor.darkTangerine,
      title: "enroll".tr,
      icon: kEnrollDashboardIcon,
      page: EnrollHomeScreen.routeName,
    ),
    DashboardMenuItem(
      color: AppColor.maximumBluePurple,
      title: "order_entry".tr,
      icon: kOrderEntryDashboardIcon,
      page: OrderEntryHomeScreen.routeName,
    ),
    DashboardMenuItem(
      color: AppColor.pictonBlue,
      title: "inventory".tr,
      icon: kInventoryDashboardIcon,
      page: InventoryHomeScreen.routeName,
    ),
    DashboardMenuItem(
      color: AppColor.rosePink,
      title: "sales_report".tr,
      icon: kSalesReportDashboardIcon,
      page: SalesReportsHomeScreen.routeName,
    ),
    DashboardMenuItem(
      color: AppColor.paleCyan,
      title: "easyship_report".tr,
      icon: kEasyshipReportDashboardIcon,
      page: EasyShipHomeScreen.routeName,
    ),
    DashboardMenuItem(
      color: AppColor.middleBlueGreen,
      title: "barcode".tr,
      icon: kBarcodeDashboardIcon,
      page: BarcodeHomeScreen.routeName,
    ),
    DashboardMenuItem(
      color: AppColor.pastelBlue,
      title: "sign_out".tr,
      icon: kSignOutDashboardIcon,
      page: "onLogout",
    ),
  ];

  void onPresssMenuItem(String param) {
    if (param != "onLogout") {
      onLogout(Get.context!);
    } else {
      Get.to(() => BarcodeHomeScreen());
    }
  }

  set showReportOptions(bool value) =>
      isReportOptionShown.value = !!isReportOptionShown.value;

  bool get showReportOptions => isReportOptionShown.value;

  void onLogout(BuildContext context) {
    FirebaseAnalytics()
        .logEvent(name: 'log_out', parameters: {'type': "normal_signout"});
    UserSessionManager.shared.removeUserInfoFromDB();
    Get.offAll(() => LoginScreen());
  }

  Future<void> onImageOptionSelect(ImageSource source) async {
    try {
      final _pickedImage = (await _picker.pickImage(
        source: source,
      ))!;
      selectedImageBaes64 = await readFileByte(_pickedImage.path);
      uploadFile = _pickedImage;
      debugPrint(_pickedImage.path.split('/').last);
      selectedFileName.value = _pickedImage.path.split('/').last;
      Navigator.of(Get.context!).pop();
    } catch (e) {
      debugPrint(e.toString());
      Navigator.of(Get.context!).pop();
    }
  }

  void changeProfilePicture(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        message: const Text("Select/Take photo"), //! hardcoded
        actions: <Widget>[
          CupertinoActionSheetAction(
            onPressed: () => onImageOptionSelect(ImageSource.camera),
            child: Text("camera".tr),
          ),
          CupertinoActionSheetAction(
            onPressed: () => onImageOptionSelect(ImageSource.gallery),
            child: Text("photo_library".tr),
          )
        ],
        cancelButton: CupertinoActionSheetAction(
          isDestructiveAction: true,
          isDefaultAction: true,
          onPressed: Navigator.of(context).pop,
          child: Text("cancel".tr),
        ),
      ),
    );
  }

  void openSettingsPage() {
    Get.to(() => SettingsPage());
  }
}
