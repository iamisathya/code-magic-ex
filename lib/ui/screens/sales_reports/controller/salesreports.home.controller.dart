import 'dart:io';

import 'package:dio/dio.dart';
import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:printing/printing.dart';

import '../../../../api/api_address.dart';
import '../../../../api/config/api_service.dart';
import '../../../../models/general_models.dart';
import '../../../../models/order_list_rmas.dart';
import '../../../../utilities/enums.dart';
import '../../../../utilities/extensions.dart';
import '../../../../utilities/function.dart';
import '../../../../utilities/logger.dart';
import '../../../../utilities/parsing.dart';
import '../../../../utilities/snackbar.dart';
import '../../../../utilities/user_session.dart';

class SalesReportHomeController extends GetxController {
  Rx<DateTime> startDate = DateTime.now().subtract(const Duration(days: 1)).obs;
  Rx<DateTime> endDate = DateTime.now().obs;

  RxList<NameValueType> sortOptions = [
    NameValueType(name: "By Order", value: "order"),
    NameValueType(name: "By Item", value: "item"),
    NameValueType(name: "RMAs", value: "rma")
  ].obs;
  Rx<OrdersAndRmas> allOrdersAndRmas = const OrdersAndRmas().obs;
  RxInt totalAmount = 0.obs;
  RxInt totalVolume = 0.obs;

  Rx<NameValueType> activeStockType =
      NameValueType(name: "By Order", value: "order").obs;

  RxBool isLoading = false.obs;
  RxBool isPrinting = false.obs;

  Future<void> getAllSalesReports() async {
    if (startDate.value.isAfter(endDate.value)) {
      SnackbarUtil.showError(
          message: "Start date should be lower than end date!");
      return;
    }
    isLoading.toggle();
    final String startingFrom =
        DateFormat('yyyy-MM-dd').format(startDate.value).toString();
    final String endingTill =
        DateFormat('yyyy-MM-dd').format(endDate.value).toString();

    const String type = "order,rma";
    const String userId =
        "9e41f330617aa2801b45620f8ffc5615306328fa0bd2255b0d42d7746560d24c";
    final String duration = "[$startingFrom;$endingTill]";

    try {
      allOrdersAndRmas.value = await ApiService.clientNoLogger()
          .getOrdersAndRmas(userId, duration, type);
      calulateValue();
      isLoading.toggle();
    } on DioError catch (e) {
      isLoading.toggle();
      final String message = getErrorMessage(e.response!.data);
      renderErrorSnackBar(
          title: "${e.response!.statusCode} Error!", subTitle: message);
      returnResponse(e.response!);
    } catch (err) {
      isLoading.toggle();
      LoggerService.instance.e(err.toString());
    }
  }

  void calulateValue() {
    if (activeStockType.value.value == "order") {
      totalVolume = allOrdersAndRmas.value.orders[0].items
          .fold(0.obs, (sum, item) => sum + item.terms.pv);
      totalAmount = allOrdersAndRmas.value.orders[0].items
          .fold(0.obs, (sum, item) => sum + Parsing.intFrom(item.terms.total)!);
    } else {
      totalVolume = allOrdersAndRmas.value.rmas[0].items
          .fold(0.obs, (sum, item) => sum + item.terms.pv);
      totalAmount = allOrdersAndRmas.value.rmas[0].items
          .fold(0.obs, (sum, item) => sum + Parsing.intFrom(item.terms.total)!);
    }
  }

  void onChangeViewType(String value) {
    activeStockType.value =
        sortOptions.firstWhere((element) => element.value == value);
  }

  void onTapDateSelector(DateSelectorType type, BuildContext context) {
    if (type == DateSelectorType.startDate) {
      DatePicker.showDatePicker(context,
          currentTime: startDate.value,
          maxTime: DateTime.now().subtract(const Duration(days: 1)),
          onConfirm: (date) {
        startDate.value = date;
      });
    } else {
      DatePicker.showDatePicker(context,
          currentTime: endDate.value,
          maxTime: DateTime.now(), onConfirm: (date) {
        endDate.value = date;
      });
    }
  }

  Future<void> proceedToPrint(BuildContext context,
      {required String orderHref}) async {
    //  https://dsc-th.unicity.com/invoice.php?link=https://hydra.unicity.net/v5a/orders/31512d2a1d4a2a5860bc785d27d1f75270eabace2d169ad5bfab2c45959ff3de&token=08b438b3-5326-45d7-9cc9-f4f3299bae5c
    final String imgUrl =
        "${Address.dscHome}invoice.php?link=$orderHref&token=${UserSessionManager.shared.customerToken.token}";
    try {
      isPrinting.toggle();
      final Dio dio = Dio();
      final response = await dio.get(imgUrl);
      isPrinting.toggle();
      await Printing.layoutPdf(
          dynamicLayout: false,
          onLayout: (PdfPageFormat format) async => Printing.convertHtml(
                format: format,
                html: response.data.toString(),
              ));
    } catch (err) {
      isPrinting.toggle();
      LoggerService.instance.e(err.toString());
    }
  }

  Future<File?> createExcellSheet() async {
    File? createdFile;
    if (allOrdersAndRmas.value.orders[0].items.isEmpty) {
      renderGetSnackbar(
          title: "Empty table!",
          message: "No data found in table.",
          type: SnackBarType.error);
      return createdFile;
    }
    if (await Permission.storage.request().isGranted) {
      // Either the permission was already granted before or the user just granted it.
      final Directory appDocDirectory =
          await getApplicationDocumentsDirectory();

      final Directory directory = await Directory('${appDocDirectory.path}/dir')
          .create(recursive: true);
      // The created directory is returned as a Future.
      // .then((Directory directory) async {
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

      for (int x = 0; x < allOrdersAndRmas.value.orders[0].items.length; x++) {
        final OrderItem currentItem = allOrdersAndRmas.value.orders[0].items[x];
        final emptyA = sheetObject.cell(CellIndex.indexByString("A${x + 1}"));

        emptyA.cellStyle = headerCellStyle;
        final b = sheetObject.cell(CellIndex.indexByString("B${x + 1}"));
        final c = sheetObject.cell(CellIndex.indexByString("C${x + 1}"));
        final d = sheetObject.cell(CellIndex.indexByString("D${x + 1}"));
        final e = sheetObject.cell(CellIndex.indexByString("E${x + 1}"));
        final f = sheetObject.cell(CellIndex.indexByString("F${x + 1}"));
        final g = sheetObject.cell(CellIndex.indexByString("G${x + 1}"));
        final h = sheetObject.cell(CellIndex.indexByString("H${x + 1}"));
        final i = sheetObject.cell(CellIndex.indexByString("I${x + 1}"));
        if (x == 0) {
          emptyA.cellStyle = headerCellStyle;
          b.cellStyle = headerCellStyle;
          c.cellStyle = headerCellStyle;
          d.cellStyle = headerCellStyle;
          e.cellStyle = headerCellStyle;
          f.cellStyle = headerCellStyle;
          g.cellStyle = headerCellStyle;
          h.cellStyle = headerCellStyle;
          i.cellStyle = headerCellStyle;
        }
        if (x == 0) {
          emptyA.value = "SL No.";
          b.value = "Record";
          c.value = "BA Number";
          d.value = "Name";
          e.value = "Order ID";
          f.value = "Date";
          g.value = "Time";
          h.value = "Total Price";
          i.value = "Total PV";
          emptyA.cellStyle = headerCellStyle;
          b.cellStyle = headerCellStyle;
          c.cellStyle = headerCellStyle;
          d.cellStyle = headerCellStyle;
          e.cellStyle = headerCellStyle;
          f.cellStyle = headerCellStyle;
          g.cellStyle = headerCellStyle;
          h.cellStyle = headerCellStyle;
          i.cellStyle = headerCellStyle;
        } else {
          emptyA.cellStyle = headerCellStyle;
          b.cellStyle = dataCellStyle;
          c.cellStyle = dataCellStyle;
          d.cellStyle = dataCellStyle;
          e.cellStyle = dataCellStyle;
          f.cellStyle = dataCellStyle;
          g.cellStyle = dataCellStyle;
          h.cellStyle = dataCellStyle;
          i.cellStyle = dataCellStyle;
          emptyA.value = "$x";
          b.value = currentItem.creator.humanName.fullName;
          c.value = currentItem.customer.id.unicity;
          d.value = currentItem.customer.humanName.fullName;
          e.value = currentItem.id.unicity.retrieveOrderId();
          f.value = currentItem.dateCreated.asDDMMYYYY;
          g.value = currentItem.dateCreated.asHHMMA;
          h.value = currentItem.terms.total.toString();
          i.value = Parsing.stringFrom(currentItem.terms.pv);
        }
      }

      final String filePath =
          '${directory.path}/easyship_${DateTime.now().millisecondsSinceEpoch}.xlsx';

      final encoded = excel.encode();
      return File(join(filePath))
        ..createSync(recursive: true)
        ..writeAsBytesSync(encoded!);
    } else {
      return createdFile;
    }
  }

  Future<void> onTapExportExcellSheet() async {
    final File? createdFile = await createExcellSheet();
    if (createdFile != null) {
      OpenFile.open(createdFile.path, type: "xlsx/vnd.ms-excel", uti: ".xlsx");
    }
  }
}
