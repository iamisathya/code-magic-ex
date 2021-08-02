import 'dart:io';

import 'package:code_magic_ex/api/api_address.dart';
import 'package:code_magic_ex/api/config/api_service.dart';
import 'package:code_magic_ex/models/order_list_rmas.dart';
import 'package:code_magic_ex/ui/global/widgets/overlay_progress.dart';
import 'package:code_magic_ex/utilities/constants.dart';
import 'package:code_magic_ex/utilities/core/parsing.dart';
import 'package:code_magic_ex/utilities/enums.dart';
import 'package:code_magic_ex/utilities/function.dart';
import 'package:code_magic_ex/utilities/user_session.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:excel/excel.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:code_magic_ex/utilities/extensions.dart';
import 'package:code_magic_ex/utilities/Logger/logger.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:printing/printing.dart';
import 'package:path/path.dart';
import 'package:share/share.dart';

class SalesReportController extends GetxController {
  final TextEditingController startDate = TextEditingController();
  final TextEditingController endDate = TextEditingController();
  static int sortName = 0;
  static int sortStatus = 1;
  bool isAscending = true;
  EasyShipSortTypes currentType = EasyShipSortTypes.record;

  RxString filterMethod = "order".obs;

  RxBool loading = false.obs;
  RxString errorMessage = "".obs;

  OrdersAndRmas allOrdersAndRmas = const OrdersAndRmas();

  final ProgressBar _sendingMsgProgressBar = ProgressBar();

  int get currentOrdersLength => allOrdersAndRmas.orders[0].items.length;
  int get currentItemsLength => 0;
  int get currentRmasLength => allOrdersAndRmas.rmas[0].items.length;
  int get currentTabLength => filterMethod.value == "order"
      ? currentOrdersLength
      : filterMethod.value == "item"
          ? currentItemsLength
          : currentRmasLength;

  List<Object> get currentTabItems => filterMethod.value == "order"
      ? allOrdersAndRmas.orders[0].items
      : allOrdersAndRmas.rmas[0].items;

  List<OrderItem> get currentOrders => allOrdersAndRmas.orders[0].items;
  List<RmaItem> get currentRmas => allOrdersAndRmas.rmas[0].items;

  RxInt totalAmount = 0.obs;
  RxInt totalVolume = 0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    startDate.text = DateFormat('yyyy-MM-dd')
        .format(DateTime.now().subtract(const Duration(days: 1)))
        .toString();
    endDate.text = DateFormat('yyyy-MM-dd').format(DateTime.now()).toString();
  }

  void onSortCulumn(EasyShipSortTypes sortStatus) {
    currentType = sortStatus;
    isAscending = !isAscending;
    switch (sortStatus) {
      case EasyShipSortTypes.baNumber:
        if (isAscending) {
          allOrdersAndRmas.orders[0].items.sort(
              (a, b) => a.customer.id.unicity.compareTo(b.customer.id.unicity));
        } else {
          allOrdersAndRmas.orders[0].items.sort(
              (b, a) => a.customer.id.unicity.compareTo(b.customer.id.unicity));
        }
        break;
      case EasyShipSortTypes.name:
        if (isAscending) {
          allOrdersAndRmas.orders[0].items.sort((a, b) => a
              .customer.humanName.fullName
              .compareTo(b.customer.humanName.fullName));
        } else {
          allOrdersAndRmas.orders[0].items.sort((b, a) => a
              .customer.humanName.fullName
              .compareTo(b.customer.humanName.fullName));
        }
        break;
      case EasyShipSortTypes.orderId:
        if (isAscending) {
          allOrdersAndRmas.orders[0].items.sort((a, b) => a.id.unicity
              .retrieveOrderId()
              .compareTo(b.id.unicity.retrieveOrderId()));
        } else {
          allOrdersAndRmas.orders[0].items.sort((b, a) => a.id.unicity
              .retrieveOrderId()
              .compareTo(b.id.unicity.retrieveOrderId()));
        }
        break;
      case EasyShipSortTypes.date:
        if (isAscending) {
          allOrdersAndRmas.orders[0].items.sort((a, b) =>
              a.dateCreated.asDDMMYYYY.compareTo(b.dateCreated.asDDMMYYYY));
        } else {
          allOrdersAndRmas.orders[0].items.sort((b, a) =>
              a.dateCreated.asDDMMYYYY.compareTo(b.dateCreated.asDDMMYYYY));
        }
        break;
      case EasyShipSortTypes.time:
        if (isAscending) {
          allOrdersAndRmas.orders[0].items.sort(
              (a, b) => a.dateCreated.asHHMMA.compareTo(b.dateCreated.asHHMMA));
        } else {
          allOrdersAndRmas.orders[0].items.sort(
              (b, a) => a.dateCreated.asHHMMA.compareTo(b.dateCreated.asHHMMA));
        }
        break;
      case EasyShipSortTypes.total:
        if (isAscending) {
          allOrdersAndRmas.orders[0].items
              .sort((a, b) => a.terms.total.compareTo(b.terms.total));
        } else {
          allOrdersAndRmas.orders[0].items
              .sort((b, a) => a.terms.total.compareTo(b.terms.total));
        }
        break;
      case EasyShipSortTypes.totalPV:
        if (isAscending) {
          allOrdersAndRmas.orders[0].items
              .sort((a, b) => a.terms.pv.compareTo(b.terms.pv));
        } else {
          allOrdersAndRmas.orders[0].items
              .sort((b, a) => a.terms.pv.compareTo(b.terms.pv));
        }
        break;

      default:
    }
    update();
  }

  Future<void> loadSalesReports(BuildContext context) async {
    if (startDate.text.isEmpty || endDate.text.isEmpty) {
      renderErrorSnackBar(
          title: "Select ${startDate.text.isEmpty ? 'start' : 'end'} date",
          subTitle:
              "Please select ${startDate.text.isEmpty ? 'start' : 'end'} date from Calender");
      return;
    } else {
      final DateTime _start = DateTime.parse(startDate.text);
      final DateTime _end = DateTime.parse(endDate.text);
      if (_start.isAfter(_end)) {
        renderErrorSnackBar(
            title: "Invalid date range!",
            subTitle: "Start date should be lower than end date!");
        return;
      }
    }
    const String type = "order,rma";
    const String userId =
        "9e41f330617aa2801b45620f8ffc5615306328fa0bd2255b0d42d7746560d24c";
    final String duration = "[${startDate.text};${endDate.text}]";
    loading(true);
    _sendingMsgProgressBar.show(context);
    update();
    try {
      allOrdersAndRmas = await ApiService.clientNoLogger()
          .getOrdersAndRmas(userId, duration, type);
      calulateValue();
      loading(false);
      _sendingMsgProgressBar.hide();
      update();
    } on DioError catch (e) {
      onDioError(e, _sendingMsgProgressBar, errorMessage);
    } catch (err) {
      onCatchError(err, _sendingMsgProgressBar, errorMessage);
    }
  }

  void calulateValue() {
    if (filterMethod.value == "order") {
      totalVolume = allOrdersAndRmas.orders[0].items
          .fold(0.obs, (sum, item) => sum + item.terms.pv);
      totalAmount = allOrdersAndRmas.orders[0].items
          .fold(0.obs, (sum, item) => sum + Parsing.intFrom(item.terms.total)!);
    } else {
      totalVolume = allOrdersAndRmas.rmas[0].items
          .fold(0.obs, (sum, item) => sum + item.terms.pv);
      totalAmount = allOrdersAndRmas.rmas[0].items
          .fold(0.obs, (sum, item) => sum + Parsing.intFrom(item.terms.total)!);
    }
  }

  Future<void> showPopupMenu(BuildContext context) async {
    await showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(100, 105, 0, 100),
      items: [
        PopupMenuItem<String>(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          value: "order",
          child: ListTile(
            onTap: () {
              filterMethod = "order".obs;
              update();
              Navigator.pop(context);
            },
            selected: filterMethod.value == "order",
            selectedTileColor: kPrimaryColor,
            title: const Text("By Order"),
          ),
        ),
        PopupMenuItem<String>(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          value: "item",
          child: ListTile(
            selected: filterMethod.value == "item",
            onTap: () {
              filterMethod = "item".obs;
              update();
              Navigator.pop(context);
            },
            selectedTileColor: kPrimaryColor,
            title: const Text("By Item"),
          ),
        ),
        PopupMenuItem<String>(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          value: "rma",
          child: ListTile(
            selected: filterMethod.value == "rma",
            onTap: () {
              filterMethod = "rma".obs;
              Navigator.pop(context);
              update();
            },
            selectedTileColor: kPrimaryColor,
            title: const Text("RMAs"),
          ),
        )
      ],
      elevation: 8.0,
    );
  }

  Future<void> proceedToPrint(BuildContext context,
      {required String orderHref}) async {
    //  https://dsc-th.unicity.com/invoice.php?link=https://hydra.unicity.net/v5a/orders/31512d2a1d4a2a5860bc785d27d1f75270eabace2d169ad5bfab2c45959ff3de&token=08b438b3-5326-45d7-9cc9-f4f3299bae5c
    final String imgUrl =
        "${Address.dscHome}invoice.php?link=$orderHref&token=${UserSessionManager.shared.customerToken.token}";
    try {
      _sendingMsgProgressBar.show(context);
      final Dio dio = Dio();
      final response = await dio.get(imgUrl);
      _sendingMsgProgressBar.hide();
      await Printing.layoutPdf(
          dynamicLayout: false,
          onLayout: (PdfPageFormat format) async => Printing.convertHtml(
                format: format,
                html: response.data.toString(),
              ));
    } catch (err) {
      _sendingMsgProgressBar.hide();
      errorMessage(err.toString());
      LoggerService.instance.e(err.toString());
    }
  }

  Future<File?> createExcellSheet() async {
    File? createdFile;
    if (allOrdersAndRmas.orders[0].items.isEmpty) {
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

      Directory directory = await Directory('${appDocDirectory.path}/dir').create(recursive: true);
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

        for (int x = 0; x < allOrdersAndRmas.orders[0].items.length; x++) {
          final OrderItem currentItem = allOrdersAndRmas.orders[0].items[x];
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
        createdFile = File(join(filePath))
          ..createSync(recursive: true)
          ..writeAsBytesSync(encoded!);
      
      return createdFile;
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

  Future<void> onTapPrintExcellSheet() async {
    final File? createdFile = await createExcellSheet();
    if (createdFile != null) {
      await OpenFile.open(createdFile.path, type: "xlsx/vnd.ms-excel", uti: ".xlsx");      
      Share.shareFiles([createdFile.path], text: "Sales Report");
    }
  }
}
