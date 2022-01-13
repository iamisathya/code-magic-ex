import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../constants/colors.dart';
import '../../../../utilities/function.dart';
import '../../../../utilities/images.dart';
import '../../barcode/barcode.screen.dart';
import '../../easy_ship/easyship.screen.dart';
import '../../enroll/enrollhome.screen.dart';
import '../../inventory/inventory.dart';
import '../../open_po/order_list/home_screen.dart';
import '../../order_entry/orderentry.screen.dart';
import '../../sales_reports/salesreports.screen.dart';
import '../../settings/settings.screen.dart';
import '../components/dashboard_menu_item.dart';

class DashboardController extends GetxController {
  RxBool isReportOptionShown = false.obs;
  final ImagePicker _picker = ImagePicker();
  RxString selectedFileName = "".obs;
  RxInt currentActiveImage = 0.obs;
  String? selectedImageBaes64 = "";
  XFile uploadFile = XFile("");
  List<String> corouselImages = [
    "https://firebasestorage.googleapis.com/v0/b/dsc-tools.appspot.com/o/promo_0.jpeg?alt=media&token=2d3bda07-0a39-43f6-bb1c-13d7342349db",
    "https://firebasestorage.googleapis.com/v0/b/dsc-tools.appspot.com/o/promo_1.jpeg?alt=media&token=45a9916b-40d1-4b5c-bb1b-e1f9770f7b12",
    "https://firebasestorage.googleapis.com/v0/b/dsc-tools.appspot.com/o/promo_2.jpeg?alt=media&token=e71c13cb-d746-4e6e-9d78-f45e69000c8a",
    "https://firebasestorage.googleapis.com/v0/b/dsc-tools.appspot.com/o/promo_3.jpeg?alt=media&token=2234e7d6-05c2-481b-9d5f-926b432b5b81",
    "https://firebasestorage.googleapis.com/v0/b/dsc-tools.appspot.com/o/promo_4.jpeg?alt=media&token=183cc271-df43-4b7f-8a58-3324c130e42f",
    "https://firebasestorage.googleapis.com/v0/b/dsc-tools.appspot.com/o/promo_5.jpeg?alt=media&token=efbe88b8-d4e4-486b-9c7a-225fe034de7c",
    "https://firebasestorage.googleapis.com/v0/b/dsc-tools.appspot.com/o/promo_6.jpeg?alt=media&token=b24683ec-1748-4189-99cc-21e12e0a343d",
    "https://firebasestorage.googleapis.com/v0/b/dsc-tools.appspot.com/o/promo_6.jpeg?alt=media&token=b24683ec-1748-4189-99cc-21e12e0a343d",
    "https://firebasestorage.googleapis.com/v0/b/dsc-tools.appspot.com/o/promo_8.jpeg?alt=media&token=eb51df57-a1d9-4736-879a-f4843d29004a",
    "https://firebasestorage.googleapis.com/v0/b/dsc-tools.appspot.com/o/promo_9.jpeg?alt=media&token=c541d99e-8257-43bf-8b97-9b98e3cbe2af"
  ];

  RxList<DashboardMenuItemModel> dashboardMenuItems = [
    const DashboardMenuItemModel(
      color: AppColor.juneBud,
      title: "open_po",
      icon: kOpenPoDashboardIcon,
      page: OpenPoHomeScreen.routeName,
    ),
    const DashboardMenuItemModel(
      color: AppColor.darkTangerine,
      title: "enroll",
      icon: kEnrollDashboardIcon,
      page: EnrollHomeScreen.routeName,
    ),
    const DashboardMenuItemModel(
      color: AppColor.maximumBluePurple,
      title: "order_entry",
      icon: kOrderEntryDashboardIcon,
      page: OrderEntryHomeScreen.routeName,
    ),
    const DashboardMenuItemModel(
      color: AppColor.pictonBlue,
      title: "inventory",
      icon: kInventoryDashboardIcon,
      page: InventoryHomeScreen.routeName,
    ),
    const DashboardMenuItemModel(
      color: AppColor.rosePink,
      title: "sales_report",
      icon: kSalesReportDashboardIcon,
      page: SalesReportsHomeScreen.routeName,
    ),
    const DashboardMenuItemModel(
      color: AppColor.paleCyan,
      title: "easyship_report",
      icon: kEasyshipReportDashboardIcon,
      page: EasyShipHomeScreen.routeName,
    ),
    const DashboardMenuItemModel(
      color: AppColor.middleBlueGreen,
      title: "barcode",
      icon: kBarcodeDashboardIcon,
      page: BarcodeHomeScreen.routeName,
    ),
    const DashboardMenuItemModel(
      color: AppColor.pastelBlue,
      title: "sign_out",
      icon: kSignOutDashboardIcon,
      page: "onLogout",
    ),
  ].obs;

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
        message: Text("select_or_take_photo".tr),
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
