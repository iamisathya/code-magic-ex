import 'dart:io';
import 'dart:typed_data';

import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';

import '../../../../models/easy_ship_reports.dart';
import '../../../../utilities/enums.dart';
import '../../../../utilities/function.dart';
import '../../../../utilities/snackbar.dart';
import '../components/easyship.orders.list.dart';

class EasyShipHomeController extends GetxController {
  RxBool isLoading = false.obs;

  Uint8List capturedImage = Uint8List(1000000);

  TextEditingController baNumberTextField = TextEditingController();
  RxList<EasyShipReports> allEasyShipOrders = <EasyShipReports>[].obs;
  RxMap<String, List<EasyShipReports>> orderedEasyShipOrders =
      RxMap<String, List<EasyShipReports>>();
  ScreenshotController screenshotController = ScreenshotController();

  Future<void> onSearchEasyShipReport() async {
    if (baNumberTextField.text.isEmpty) {
      SnackbarUtil.showWarning(message: "Please enter user id!"); //! hardcoded
      return;
    }
    Get.to(() => EasyShipOrdersList(), arguments: baNumberTextField.text);
  }

  Future onTapExportExcellSheet() async {
    if (allEasyShipOrders.isEmpty) {
      renderGetSnackbar(
          title: "Empty table!", //! hardcoded
          message: "no_data_found_in_table".tr,
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
            emptyA.value = "SL No."; //! hardcoded
            b.value = "order_number".tr;
            c.value = "period".tr;
            d.value = "product_name".tr;
            e.value = "item_code".tr;
            f.value = "pv".tr;
            g.value = "price".tr;
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
}
