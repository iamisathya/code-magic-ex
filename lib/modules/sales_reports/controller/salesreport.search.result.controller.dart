import 'dart:io';

import 'package:excel/excel.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:permission_handler/permission_handler.dart';
import 'package:printing/printing.dart';

import '../../../data/model/sales_report_item_item.dart';
import '../../../data/model/sales_report_order_item.dart';
import '../../../data/model/sales_report_rma_item.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/extensions.dart';
import '../../../utils/snackbar.dart';

class SalesReportSearchResultController extends GetxController {
  RxString searchKey = "".obs;
  RxString type = "order".obs;
  RxBool isPrinting = false.obs;
  RxList<SalesReportOrderItem> allSalesReports = <SalesReportOrderItem>[].obs;
  RxList<SalesReportRmaItem> allSalesRmaReports = <SalesReportRmaItem>[].obs;
  RxList<SalesReportItemItem> allSalesItemReports = <SalesReportItemItem>[].obs;

  int get activeListLength => type.value == "order"
      ? allSalesReports.length
      : type.value == "rma"
          ? allSalesRmaReports.length
          : allSalesItemReports.length;

  @override
  void onInit() {
    final dynamic data = Get.arguments;
    if (data != null) {
      final args = data as Map<String, dynamic>;
      final String resultType = args["type"] as String;
      if (resultType == "order") {
        allSalesReports.add(args["data"] as SalesReportOrderItem);
        searchKey.value = allSalesReports[0].orderNumber;
      } else if (resultType == "rma") {
        allSalesRmaReports.add(args["data"] as SalesReportRmaItem);
        searchKey.value = allSalesRmaReports[0].orderNumber;
      } else {
        allSalesItemReports.add(args["data"] as SalesReportItemItem);
        searchKey.value = allSalesItemReports[0].description;
      }
      type.value = resultType;
    }
    super.onInit();
  }

  Future<void> proceedToPrint() async {
    if (activeListLength == 0) {
      SnackbarUtil.showWarning(message: "no_data_found_table".tr);
      return;
    }
    final List<SalesReportGeneric> printList = [];
    printList.add(SalesReportGeneric(
        orderNumber: "order_id".tr,
        userId: "ba_number".tr,
        totalPv: "total_pv".tr,
        totalPrice: "total_price".tr));
    for (int x = 0; x < activeListLength; x++) {
      late SalesReportGeneric item;
      if (type.value == "order") {
        final SalesReportOrderItem orderItem = allSalesReports[x];
        item = SalesReportGeneric(
            orderNumber: orderItem.orderNumber.retrieveBarcode(),
            userId: orderItem.customer,
            totalPv: orderItem.totalPv.toString(),
            totalPrice: orderItem.total);
      } else if (type.value == "rma") {
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
      SnackbarUtil.showWarning(message: "empty_table".tr);
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
        if (type.value == "order") {
          final SalesReportOrderItem orderItem = allSalesReports[x];
          item = SalesReportGeneric(
              orderNumber: orderItem.orderNumber.retrieveBarcode(),
              userId: orderItem.customer,
              totalPv: orderItem.totalPv.toString(),
              totalPrice: orderItem.total);
        } else if (type.value == "rma") {
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
        if (x == 0) {
          emptyA.cellStyle = headerCellStyle;
          b.cellStyle = headerCellStyle;
          c.cellStyle = headerCellStyle;
          d.cellStyle = headerCellStyle;
          e.cellStyle = headerCellStyle;
        }
        if (x == 0) {
          emptyA.value = "slno".tr;
          b.value = "order_id".tr;
          c.value = "ba_number".tr;
          d.value = "total_pv".tr;
          e.value = "total_price".tr;
          emptyA.cellStyle = headerCellStyle;
          b.cellStyle = headerCellStyle;
          c.cellStyle = headerCellStyle;
          d.cellStyle = headerCellStyle;
          e.cellStyle = headerCellStyle;
        } else {
          emptyA.cellStyle = headerCellStyle;
          b.cellStyle = dataCellStyle;
          c.cellStyle = dataCellStyle;
          d.cellStyle = dataCellStyle;
          e.cellStyle = dataCellStyle;
          emptyA.value = "$x";
          b.value = item.orderNumber;
          c.value = item.userId;
          d.value = item.totalPv;
          e.value = item.totalPrice;
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
      "orderCode": item.orderNumber.retrieveOrderCodeFromUrl(),
      "orderId": item.orderNumber.retrieveBarcode()
    };
    Get.toNamed(Routes.SALES_REPORT_ORDER_DETAILS, arguments: args);
  }
}

class SalesReportGeneric {
  String orderNumber;
  String userId;
  String totalPv;
  String totalPrice;

  SalesReportGeneric({
    required this.orderNumber,
    required this.userId,
    required this.totalPv,
    required this.totalPrice,
  });
}
