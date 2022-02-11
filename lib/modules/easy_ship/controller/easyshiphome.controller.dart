import 'dart:io';
import 'dart:typed_data';

import 'package:collection/collection.dart';
import 'package:dsc_tools/routes/app_pages.dart';
import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';

import '../../../../data/enums.dart';
import '../../../data/model/easy_ship_report_with_total.dart';
import '../../../data/model/easy_ship_reports.dart';
import '../../../data/services/api_service.dart';
import '../../../utils/constants.dart';
import '../../../utils/function.dart';
import '../../../utils/logger.dart';
import '../../../utils/snackbar.dart';
import '../../../utils/user_session.dart';

class EasyShipHomeController extends GetxController {
  RxBool isLoading = false.obs;

  Uint8List capturedImage = Uint8List(1000000);

  TextEditingController baNumberTextField = TextEditingController();
  RxList<EasyShipReports> allEasyShipOrders = <EasyShipReports>[].obs;
  RxMap<String, List<EasyShipReports>> orderedEasyShipOrders =
      RxMap<String, List<EasyShipReports>>();
  RxList<EasyShipReportsWithTotal> formattedEasyShipList =
      <EasyShipReportsWithTotal>[].obs;
  ScreenshotController screenshotController = ScreenshotController();

  Future<void> onSearchEasyShipReport() async {
    if (baNumberTextField.text.isEmpty) {
      SnackbarUtil.showWarning(message: "please_enter_user_id".tr);
      return;
    }
    onSearchEasyShip(userId: baNumberTextField.text);
  }

  Future<void> onSearchEasyShip({required String userId}) async {
    isLoading.toggle();
    try {
      formattedEasyShipList.value = <EasyShipReportsWithTotal>[];
      allEasyShipOrders.value = await MemberCallsService.init()
          .getEasyShipReports(kEasyShipReports, userId,
              UserSessionManager.shared.customerToken.token);
      final Map<String, List<EasyShipReports>> listWithMonths =
          groupBy(allEasyShipOrders, (EasyShipReports obj) => obj.pvDate);
      orderedEasyShipOrders.value = Map.from(listWithMonths);
      for (final k in listWithMonths.keys) {
        final ls = listWithMonths[k] ?? <EasyShipReports>[];
        final totalPrice =
            ls.map((e) => NumberFormat().parse(e.totalPrice)).toList().sum;
        final totalPv = ls.map((e) => e.pv).toList().sum;
        formattedEasyShipList.add(EasyShipReportsWithTotal(
            month: k,
            reports: ls,
            totalPv: totalPv,
            totalPrice: totalPrice.toDouble()));
      }
      formattedEasyShipList.refresh();
      isLoading.toggle();
      if (allEasyShipOrders.isEmpty) {
        SnackbarUtil.showWarning(
            message: "Easyship reports are empty!"); //! Hardcoded
      } else {
        final Map<String, dynamic> args = {
          "orders": formattedEasyShipList,
          "userId": userId
        };
        Get.toNamed(Routes.EASY_SHIP_ORDER_LIST, arguments: args);
      }
    } catch (err, s) {
      isLoading.toggle();
      LoggerService.instance.e(s.toString());
    }
  }

  List<DateTime> getDaysInBetween(DateTime startDate, DateTime endDate) {
    final List<DateTime> list = [];
    DateTime startDate1 = startDate;
    //something on these lines
    while (startDate1.isBefore(endDate)) {
      // pull out month and year
      list.add(startDate1.add(const Duration(days: 30)));
      startDate1 = startDate1.add(const Duration(days: 30));
    }
    return list;
  }

  Future onTapExportExcellSheet() async {
    if (allEasyShipOrders.isEmpty) {
      renderGetSnackbar(
          title: "empty_table".tr,
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
            emptyA.value = "slno".tr;
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
