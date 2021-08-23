import 'dart:io';

import 'package:excel/excel.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../api/config/member_class.dart';
import '../../../../models/easy_ship_reports.dart';
import '../../../../utilities/logger.dart';
import '../../../../utilities/constants.dart';
import '../../../../utilities/parsing.dart';
import '../../../../utilities/enums.dart';
import '../../../../utilities/function.dart';
import '../../../../utilities/user_session.dart';

class EasyShipController extends GetxController {
  RxBool loading = false.obs;
  RxString errorMessage = "".obs;

  List<EasyShipReports> allEasyShipOrders = <EasyShipReports>[];
  List<EasyShipReports> _tempEasyShipOrders = <EasyShipReports>[];

  static int sortName = 0;
  static int sortStatus = 1;
  bool isAscending = true;
  EasyShipTypes currentType = EasyShipTypes.orderNumber;

  List<EasyShipReports> get getEasyShipReports => _tempEasyShipOrders;
  int get easyShipReportsCount => _tempEasyShipOrders.length;
  bool get isEasyShipReportsEmpty => _tempEasyShipOrders.isEmpty;

  Future<void> getAllOrderlines({String userId = "2970466"}) async {
    loading(true);
    update();
    try {
      allEasyShipOrders = await MemberCallsService.init().getEasyShipReports(
          kEasyShipReports,
          userId,
          UserSessionManager.shared.customerToken.token);
      allEasyShipOrders = addTotalRowAfterEachUniqueItemSet();
      _tempEasyShipOrders = allEasyShipOrders;
      loading(false);
      update();
    } catch (err) {
      loading(false);
      errorMessage(err.toString());
      LoggerService.instance.e(err.toString());
      update();
    }
  }

  void onSortCulumn(EasyShipTypes sortStatus) {
    currentType = sortStatus;
    isAscending = !isAscending;
    switch (sortStatus) {
      case EasyShipTypes.orderNumber:
        if (isAscending) {
          _tempEasyShipOrders
              .sort((a, b) => a.orderNumber.compareTo(b.orderNumber));
        } else {
          _tempEasyShipOrders
              .sort((b, a) => a.orderNumber.compareTo(b.orderNumber));
        }
        break;
      case EasyShipTypes.period:
        if (isAscending) {
          _tempEasyShipOrders.sort((a, b) => a.pvDate.compareTo(b.pvDate));
        } else {
          _tempEasyShipOrders.sort((b, a) => a.pvDate.compareTo(b.pvDate));
        }
        break;
      case EasyShipTypes.productName:
        if (isAscending) {
          _tempEasyShipOrders.sort((a, b) => a.name.compareTo(b.name));
        } else {
          _tempEasyShipOrders.sort((b, a) => a.name.compareTo(b.name));
        }
        break;
      case EasyShipTypes.itemCode:
        if (isAscending) {
          _tempEasyShipOrders.sort((a, b) => a.itemName.compareTo(b.itemName));
        } else {
          _tempEasyShipOrders.sort((b, a) => a.itemName.compareTo(b.itemName));
        }
        break;
      case EasyShipTypes.pv:
        if (isAscending) {
          _tempEasyShipOrders.sort((a, b) => a.pv.compareTo(b.pv));
        } else {
          _tempEasyShipOrders.sort((b, a) => a.pv.compareTo(b.pv));
        }
        break;
      case EasyShipTypes.price:
        if (isAscending) {
          _tempEasyShipOrders
              .sort((a, b) => a.totalPrice.compareTo(b.totalPrice));
        } else {
          _tempEasyShipOrders
              .sort((b, a) => a.totalPrice.compareTo(b.totalPrice));
        }
        break;
      default:
    }
    update();
  }

  //*  This will find & returns total unique order size
  int totalUniqueOrderItemSize() {
    final List<EasyShipReports> resArr = [];
    for (final item in _tempEasyShipOrders) {
      final i = resArr.indexWhere((x) => x.orderNumber == item.orderNumber);
      if (i <= -1) {
        resArr.add(item);
      }
    }
    return resArr.length;
  }

  int forceParse(String str) {
    return Parsing.doubleFrom(str.replaceAll(",", ""))!.toInt();
  }

  List<EasyShipReports> addTotalRowAfterEachUniqueItemSet() {
    final Map<String, List<EasyShipReports>> easyShipMap =
        groupBy(allEasyShipOrders, (obj) => obj.orderNumber);
    //* Adding empty EasyShipReports object after each set of unique orders
    for (final objectItem in easyShipMap.values) {
      final int totalAmount =
          objectItem.fold(0, (sum, item) => sum + forceParse(item.totalPrice));
      final int totalVolume = objectItem.fold(0, (sum, item) => sum + item.pv);
      final EasyShipReports emptyReport = EasyShipReports(
          orderNumber: "",
          itemName: "Total",
          name: "",
          price: "",
          pv: totalVolume,
          pvDate: "",
          totalPrice: NumberFormat("#,###").format(totalAmount));
      objectItem.add(emptyReport);
    }
    // ! Need to optimise this
    final List<EasyShipReports> easyShipReports = [];
    for (final objectItems in easyShipMap.values) {
      for (var i = 0; i < objectItems.length; i++) {
        easyShipReports.add(objectItems[i]);
      }
    }
    return easyShipReports;
  }

  Future onTapExportExcellSheet() async {
    if (_tempEasyShipOrders.isEmpty) {
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

        for (int i = 0; i < _tempEasyShipOrders.length; i++) {
          final EasyShipReports currentItem = _tempEasyShipOrders[i];
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
}
