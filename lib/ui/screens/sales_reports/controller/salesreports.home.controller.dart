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
import 'package:pdf/widgets.dart' as pw;
import 'package:permission_handler/permission_handler.dart';
import 'package:printing/printing.dart';

import '../../../../api/config/api_service.dart';
import '../../../../constants/globals.dart';
import '../../../../models/general_models.dart';
import '../../../../models/order_list_rmas.dart';
import '../../../../models/sales_report_item_item.dart';
import '../../../../models/sales_report_order_item.dart';
import '../../../../models/sales_report_rma_item.dart';
import '../../../../utilities/constants.dart';
import '../../../../utilities/enums.dart';
import '../../../../utilities/extensions.dart';
import '../../../../utilities/function.dart';
import '../../../../utilities/logger.dart';
import '../../../../utilities/parsing.dart';
import '../../../../utilities/snackbar.dart';
import '../../../../utilities/user_session.dart';
import '../component/order_details.dart';
import 'salesreport.search.result.controller.dart';

class SalesReportHomeController extends GetxController {
  Rx<String> startDateString = "".obs;
  Rx<String> endDateString = "".obs;
  late Rx<DateTime>? startDate;
  late Rx<DateTime>? endDate;
  RxBool isDateSelected = false.obs;
  RxBool isDataFetched = false.obs;

  RxList<NameValueType> sortOptions = [
    NameValueType(name: "By Order", value: "order"),
    NameValueType(name: "By Item", value: "item"),
    NameValueType(name: "RMAs", value: "rma")
  ].obs;
  Rx<OrdersAndRmas> allOrdersAndRmas = const OrdersAndRmas().obs;
  RxList<SalesReportOrderItem> allSalesReports = <SalesReportOrderItem>[].obs;
  RxList<SalesReportRmaItem> allSalesRmaReports = <SalesReportRmaItem>[].obs;
  RxList<SalesReportItemItem> allSalesItemReports = <SalesReportItemItem>[].obs;
  RxInt totalAmount = 0.obs;
  RxInt totalVolume = 0.obs;

  Rx<NameValueType> activeStockType =
      NameValueType(name: "By Order", value: "order").obs;

  RxBool isLoading = false.obs;
  RxBool isPrinting = false.obs;

  @override
  void onInit() {
    startDate = Rx<DateTime>(DateTime.fromMicrosecondsSinceEpoch(100));
    endDate = Rx<DateTime>(DateTime.fromMicrosecondsSinceEpoch(100));
    super.onInit();
  }

  String get activeTab => activeStockType.value.value;
  int get activeListLength => activeStockType.value.value == "order"
      ? allSalesReports.length
      : activeStockType.value.value == "rma"
          ? allSalesRmaReports.length
          : allSalesItemReports.length;

  RxList<Object> get activeLists => activeStockType.value.value == "order"
      ? allSalesReports
      : activeStockType.value.value == "rma"
          ? allSalesRmaReports
          : allSalesItemReports;

  Future<void> getAllSalesReports() async {
    if (startDate == null || endDate == null) return;
    if (startDate!.value.isAfter(endDate!.value)) {
      SnackbarUtil.showError(
          message: "Start date should be lower than end date!");
      return;
    }
    final String actionType = activeStockType.value.value == "order"
        ? "1"
        : activeStockType.value.value == "item"
            ? "2"
            : "3";
    isLoading.toggle();
    final String startingFrom =
        DateFormat('yyyy-MM-dd').format(startDate!.value).toString();
    final String endingTill =
        DateFormat('yyyy-MM-dd').format(endDate!.value).toString();

    try {
      if (activeStockType.value.value == "order") {
        allSalesReports.value = await MemberCallsService.init().getSalesReports(
            kSalesReportType,
            startingFrom,
            endingTill,
            UserSessionManager.shared.customerToken.token,
            'th',
            Globals.userId,
            actionType);
      } else if (activeStockType.value.value == "item") {
        allSalesItemReports.value = await MemberCallsService.init()
            .getSalesItemReports(kSalesReportType, startingFrom, endingTill,
                UserSessionManager.shared.customerToken.token, actionType);
      } else if (activeStockType.value.value == "rma") {
        allSalesRmaReports.value = await MemberCallsService.init()
            .getSalesRmaReports(
                kSalesReportType,
                startingFrom,
                endingTill,
                UserSessionManager.shared.customerToken.token,
                'th',
                Globals.userId,
                actionType);
      }
      isDataFetched.toggle();
      // calulateValue();
      isLoading.toggle();
    } on DioError catch (e) {
      isLoading.toggle();
      isDataFetched.toggle();
      final String message = getErrorMessage(e.response!.data);
      renderErrorSnackBar(
          title: "${e.response!.statusCode} Error!", subTitle: message);
      returnResponse(e.response!);
    } catch (err) {
      isLoading.toggle();
      isDataFetched.toggle();
      LoggerService.instance.e(err.toString());
    }
  }

  void calulateValue() {
    if (activeStockType.value.value == "order") {
      totalVolume =
          allSalesReports.fold(0.obs, (sum, item) => sum + item.totalPv);
      totalAmount = allSalesReports.fold(
          0.obs, (sum, item) => sum + Parsing.intFrom(item.totalPv)!);
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
          currentTime: startDate != null ? startDate!.value : DateTime.now(),
          maxTime: DateTime.now().subtract(const Duration(days: 1)),
          minTime: DateTime.now().subtract(const Duration(days: 365)),
          onConfirm: (date) {
        startDate!.value = date;
        startDateString.value = startDate!.value.yyyyMMdd();
        enableFindButton();
      });
    } else {
      DatePicker.showDatePicker(context,
          currentTime: endDate != null ? endDate!.value : DateTime.now(),
          minTime: DateTime.now().subtract(const Duration(days: 364)),
          maxTime: DateTime.now(), onConfirm: (date) {
        endDate!.value = date;
        endDateString.value = endDate!.value.yyyyMMdd();
        enableFindButton();
      });
    }
  }

  void enableFindButton() {
    if (startDate?.value.microsecondsSinceEpoch != 100 &&
        endDate?.value.microsecondsSinceEpoch != 100) {
      isDateSelected.value = true;
    }
  }

  Future<void> proceedToPrint(BuildContext context,
      {required String orderHref}) async {
    if (activeListLength == 0) {
      SnackbarUtil.showWarning(message: "No data found in table.");
      return;
    }
    final List<SalesReportGeneric> printList = [];
    printList.add(SalesReportGeneric(
        orderNumber: "Order ID",
        userId: "Ba Number",
        totalPv: "Total PV",
        totalPrice: "Total Price"));
    for (int x = 0; x < activeListLength; x++) {
      late SalesReportGeneric item;
      if (activeTab == "order") {
        final SalesReportOrderItem orderItem = allSalesReports[x];
        item = SalesReportGeneric(
            orderNumber: orderItem.orderNumber.retrieveBarcode(),
            userId: orderItem.customer,
            totalPv: orderItem.totalPv.toString(),
            totalPrice: orderItem.total);
      } else if (activeTab == "rma") {
        final SalesReportRmaItem rmaItem = allSalesRmaReports[x];
        item = SalesReportGeneric(
            orderNumber: rmaItem.orderNumber.retrieveBarcode(),
            userId: rmaItem.customer,
            totalPv: rmaItem.totalPv.toString(),
            totalPrice: rmaItem.total);
      }
      printList.add(item);
    }
    final res = printList.map((e) => pw.TableRow(children: [
          pw.Column(children: [pw.Text(e.orderNumber)]),
          pw.Column(children: [pw.Text(e.userId)]),
          pw.Column(children: [pw.Text(e.totalPv)]),
          pw.Column(children: [pw.Text(e.totalPrice)]),
        ]));

    final printDocument = pw.Document();
    printDocument.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) => pw.Table(
          children: res.toList(),
        ),
      ),
    );
    // Print now
    await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => printDocument.save());
  }

  Future<File?> createExcellSheet() async {
    File? createdFile;
    if (activeListLength == 0) {
      SnackbarUtil.showWarning(message: "No data found in table.");
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

      for (int x = 0; x < activeListLength; x++) {
        late SalesReportGeneric item;
        if (activeTab == "order") {
          final SalesReportOrderItem orderItem = allSalesReports[x];
          item = SalesReportGeneric(
              orderNumber: orderItem.orderNumber.retrieveBarcode(),
              userId: orderItem.customer,
              totalPv: orderItem.totalPv.toString(),
              totalPrice: orderItem.total);
        } else if (activeTab == "rma") {
          final SalesReportRmaItem rmaItem = allSalesRmaReports[x];
          item = SalesReportGeneric(
              orderNumber: rmaItem.orderNumber.retrieveBarcode(),
              userId: rmaItem.customer,
              totalPv: rmaItem.totalPv.toString(),
              totalPrice: rmaItem.total);
        }

        // final OrderItem currentItem = allOrdersAndRmas.value.orders[0].items[x];
        final emptyA = sheetObject.cell(CellIndex.indexByString("A${x + 1}"));

        emptyA.cellStyle = headerCellStyle;
        final b = sheetObject.cell(CellIndex.indexByString("B${x + 1}"));
        final c = sheetObject.cell(CellIndex.indexByString("C${x + 1}"));
        final d = sheetObject.cell(CellIndex.indexByString("D${x + 1}"));
        final e = sheetObject.cell(CellIndex.indexByString("E${x + 1}"));
        // final f = sheetObject.cell(CellIndex.indexByString("F${x + 1}"));
        // final g = sheetObject.cell(CellIndex.indexByString("G${x + 1}"));
        // final h = sheetObject.cell(CellIndex.indexByString("H${x + 1}"));
        // final i = sheetObject.cell(CellIndex.indexByString("I${x + 1}"));
        if (x == 0) {
          emptyA.cellStyle = headerCellStyle;
          b.cellStyle = headerCellStyle;
          c.cellStyle = headerCellStyle;
          d.cellStyle = headerCellStyle;
          e.cellStyle = headerCellStyle;
          // f.cellStyle = headerCellStyle;
          // g.cellStyle = headerCellStyle;
          // h.cellStyle = headerCellStyle;
          // i.cellStyle = headerCellStyle;
        }
        if (x == 0) {
          emptyA.value = "SL No.";
          b.value = "Order ID";
          c.value = "BA Number";
          d.value = "Total PV";
          e.value = "Total Price";
          // f.value = "Date";
          // g.value = "Time";
          // h.value = "Total Price";
          // i.value = "Total PV";
          emptyA.cellStyle = headerCellStyle;
          b.cellStyle = headerCellStyle;
          c.cellStyle = headerCellStyle;
          d.cellStyle = headerCellStyle;
          e.cellStyle = headerCellStyle;
          // f.cellStyle = headerCellStyle;
          // g.cellStyle = headerCellStyle;
          // h.cellStyle = headerCellStyle;
          // i.cellStyle = headerCellStyle;
        } else {
          emptyA.cellStyle = headerCellStyle;
          b.cellStyle = dataCellStyle;
          c.cellStyle = dataCellStyle;
          d.cellStyle = dataCellStyle;
          e.cellStyle = dataCellStyle;
          // f.cellStyle = dataCellStyle;
          // g.cellStyle = dataCellStyle;
          // h.cellStyle = dataCellStyle;
          // i.cellStyle = dataCellStyle;
          emptyA.value = "$x";
          b.value = item.orderNumber;
          c.value = item.userId;
          d.value = item.totalPv;
          e.value = item.totalPrice;
          // f.value = currentItem.dateCreated.asDDMMYYYY;
          // g.value = currentItem.dateCreated.asHHMMA;
          // h.value = currentItem.terms.total.toString();
          // i.value = Parsing.stringFrom(currentItem.terms.pv);
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

  void gotoDetailsPage(SalesReportOrderItem item) {    
    final Map<String, dynamic> args = {
      "orderCode": item.barcodeHref.retrieveOrderCodeFromLightUrl(),
      "orderId": item.orderNumber.retrieveBarcode()
    };
    Get.to(() => SalesReportOrderDetials(), arguments: args);
  }

  void gotoBarcodePage(SalesReportRmaItem item) {    
    final Map<String, dynamic> args = {
      "orderCode": item.orderNumber.retrieveOrderCodeFromLightUrl(),
      "orderId": item.orderNumber.retrieveBarcode()
    };
    Get.to(() => SalesReportOrderDetials(), arguments: args);
  }

  void gotoDetailPage(SalesReportItemItem item) {
    final Map<String, dynamic> args = {
      "orderCode": item.itemCode,
      "orderId": item.description
    };
    Get.to(() => SalesReportOrderDetials(), arguments: args);
  }
}
