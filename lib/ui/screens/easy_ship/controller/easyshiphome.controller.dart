import 'dart:io';
import 'dart:typed_data';

import 'package:collection/collection.dart';
import 'package:dsc_tools/ui/screens/easy_ship/components/easyship.item.dart';
import 'package:dsc_tools/ui/screens/easy_ship/components/image.preview.dart';
import 'package:dsc_tools/utilities/images.dart';
import 'package:dsc_tools/utilities/snackbar.dart';
import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:open_file/open_file.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';

import '../../../../api/config/api_service.dart';
import '../../../../models/easy_ship_reports.dart';
import '../../../../utilities/constants.dart';
import '../../../../utilities/enums.dart';
import '../../../../utilities/function.dart';
import '../../../../utilities/logger.dart';
import '../../../../utilities/user_session.dart';

class EasyShipHomeController extends GetxController {
  RxBool loading = false.obs;
  RxBool isLoading = false.obs;
  RxString errorMessage = "".obs;
  Uint8List capturedImage = Uint8List(1000000);

  TextEditingController baNumberTextField = TextEditingController();
  RxList<EasyShipReports> allEasyShipOrders = <EasyShipReports>[].obs;
  RxMap<String, List<EasyShipReports>> orderedEasyShipOrders =
      RxMap<String, List<EasyShipReports>>();
  ScreenshotController screenshotController = ScreenshotController();

  static int sortName = 0;
  static int sortStatus = 1;
  bool isAscending = true;
  EasyShipTypes currentType = EasyShipTypes.orderNumber;

  List<EasyShipReports> get getEasyShipReports => allEasyShipOrders;
  int get easyShipReportsCount => allEasyShipOrders.length;
  bool get isEasyShipReportsEmpty => allEasyShipOrders.isEmpty;

  Future<void> onSearchEasyShipReport() async {
    if (baNumberTextField.text.isEmpty) {
      SnackbarUtil.showWarning(message: "Please enter user id!");
      return;
    }
    isLoading.toggle();
    try {
      allEasyShipOrders.value = await MemberCallsService.init()
          .getEasyShipReports(kEasyShipReports, baNumberTextField.text,
              UserSessionManager.shared.customerToken.token);
      orderedEasyShipOrders.value =
          groupBy(allEasyShipOrders, (EasyShipReports obj) => obj.pvDate);
      print(orderedEasyShipOrders.toString());
      isLoading.toggle();
    } catch (err, s) {
      errorMessage(err.toString());
      LoggerService.instance.e(s.toString());
      isLoading.toggle();
    }
  }

  Future onTapExportExcellSheet() async {
    if (allEasyShipOrders.isEmpty) {
      renderGetSnackbar(
          title: "Empty table!",
          message: "No data found in table.",
          type: SnackBarType.error);
      return;
    }
    if (await Permission.storage.request().isGranted) {
      // Either the permission was already granted before or the user just granted it.
      final Directory appDocDirectory =
          await getApplicationDocumentsDirectory();

      Directory('${appDocDirectory.path}/dir').create(recursive: true)
          // The created directory is returned as a Future.
          .then((Directory directory) async {
        final excel = Excel.createExcel();
        final Sheet sheetObject = excel["Sheet1"];

        final CellStyle headerCellStyle = CellStyle(
            backgroundColorHex: "#e0e2e5",
            horizontalAlign: HorizontalAlign.Center,
            verticalAlign: VerticalAlign.Center,
            bold: true,
            fontFamily: getFontFamily(FontFamily.Calibri));

        final CellStyle dataCellStyle = CellStyle(
            horizontalAlign: HorizontalAlign.Center,
            verticalAlign: VerticalAlign.Center,
            fontFamily: getFontFamily(FontFamily.Calibri));

        for (int i = 0; i < allEasyShipOrders.length; i++) {
          final EasyShipReports currentItem = allEasyShipOrders[i];
          final emptyA = sheetObject.cell(CellIndex.indexByString("A${i + 1}"));

          emptyA.cellStyle = headerCellStyle;
          final b = sheetObject.cell(CellIndex.indexByString("B${i + 1}"));
          final c = sheetObject.cell(CellIndex.indexByString("C${i + 1}"));
          final d = sheetObject.cell(CellIndex.indexByString("D${i + 1}"));
          final e = sheetObject.cell(CellIndex.indexByString("E${i + 1}"));
          final f = sheetObject.cell(CellIndex.indexByString("F${i + 1}"));
          final g = sheetObject.cell(CellIndex.indexByString("G${i + 1}"));
          if (i == 0) {
            emptyA.cellStyle = headerCellStyle;
            b.cellStyle = headerCellStyle;
            c.cellStyle = headerCellStyle;
            d.cellStyle = headerCellStyle;
            e.cellStyle = headerCellStyle;
            f.cellStyle = headerCellStyle;
            g.cellStyle = headerCellStyle;
          }
          if (i == 0) {
            emptyA.value = "SL No.";
            b.value = "Order Number";
            c.value = "Period";
            d.value = "Product Name";
            e.value = "Item Code";
            f.value = "PV";
            g.value = "Price";
            emptyA.cellStyle = headerCellStyle;
            b.cellStyle = headerCellStyle;
            c.cellStyle = headerCellStyle;
            d.cellStyle = headerCellStyle;
            e.cellStyle = headerCellStyle;
            f.cellStyle = headerCellStyle;
            g.cellStyle = headerCellStyle;
          } else {
            emptyA.cellStyle = headerCellStyle;
            b.cellStyle = dataCellStyle;
            c.cellStyle = dataCellStyle;
            d.cellStyle = dataCellStyle;
            e.cellStyle = dataCellStyle;
            f.cellStyle = dataCellStyle;
            g.cellStyle = dataCellStyle;
            emptyA.value = "$i";
            b.value = currentItem.orderNumber;
            c.value = currentItem.pvDate;
            d.value = currentItem.name;
            e.value = currentItem.itemName;
            f.value = currentItem.pv;
            g.value = currentItem.price;
          }
        }

        final String filePath =
            '${directory.path}/easyship_${DateTime.now().millisecondsSinceEpoch}.xlsx';

        final encoded = excel.encode();
        final file = File(join(filePath))
          ..createSync(recursive: true)
          ..writeAsBytesSync(encoded!);
        OpenFile.open(file.path, type: "xlsx/vnd.ms-excel", uti: ".xlsx");
      });
    }
  }

  void onCaptureScreenShot(BuildContext context) {
    Get.rawSnackbar(
        message: "Capturing Screenshot..",
        snackStyle: SnackStyle.GROUNDED,
        icon: const Icon(Icons.screenshot, color: Colors.white),
        backgroundColor: Colors.black,
        showProgressIndicator: true,
        progressIndicatorBackgroundColor: const Color(0xFFFFFFFF));
    screenshotController.capture().then((image) {
      debugPrint("Captured");
       ScaffoldMessenger.of(context).clearSnackBars();
      capturedImage = image!;
      showDialog(
          context: context,
          useSafeArea: false,
          barrierDismissible: true,
          barrierColor: Colors.black.withOpacity(0.8),
          builder: (BuildContext context) {
            return ScreenShotPreview(image: image);
          });
    }).catchError((err) {
      debugPrint("Capture error!");
      debugPrint(err.toString());
    });
  }

  Future<void> saveImage(BuildContext context) async {
    final result = await ImageGallerySaver.saveImage(capturedImage,
        quality: 60, name: "easyship_${DateTime.now().millisecondsSinceEpoch}");
    if (result["isSuccess"] == true) {
      Navigator.of(context).pop();
      SnackbarUtil.showSuccess(message: "Image saved successfully!");
    } else {
      Navigator.of(context).pop();
      SnackbarUtil.showError(message: "Error while saving image!");
    }
  }
}
