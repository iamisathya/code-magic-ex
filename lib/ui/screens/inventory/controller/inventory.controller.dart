import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:excel/excel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:printing/printing.dart';

import '../../../../api/api_address.dart';
import '../../../../api/config/api_service.dart';
import '../../../../models/inventory_records.dart';
import '../../../../utilities/constants.dart';
import '../../../../utilities/enums.dart';
import '../../../../utilities/function.dart';
import '../../../../utilities/parsing.dart';
import '../../../global/widgets/overlay_progress.dart';

class InventoryController extends GetxController {
  TextEditingController searchController = TextEditingController();
  Rx<InventoryRecords> inventoryRecords = InventoryRecords(items: []).obs;
  Rx<InventoryRecords> tempInventoryRecords = InventoryRecords(items: []).obs;

  RxString searchText = ''.obs;
  static int sortName = 0;
  static int sortStatus = 1;
  bool isAscending = true;
  InventorySortTypes currentType = InventorySortTypes.itemCode;
  final ProgressBar _sendingMsgProgressBar = ProgressBar();

  RxString filterMethod = describeEnum(StockTypes.onHand).obs;
  RxBool loading = false.obs;
  RxString errorMessage = "".obs;

  void resetSearchText() {
    tempInventoryRecords.value.items.addAll(inventoryRecords.value.items);
    searchController.text = "";
    update();
  }

  Future<void> loadInventoryProducts(BuildContext context) async {
    Timer(const Duration(milliseconds: 100),
        () => {_sendingMsgProgressBar.show(context)});
    const String type = "item";
    const String userId =
        "9e41f330617aa2801b45620f8ffc5615306328fa0bd2255b0d42d7746560d24c";
    try {
      inventoryRecords.value =
          await ApiService.shared().getInventoryRecords(userId, type);
      tempInventoryRecords.value.items =
          List.from(inventoryRecords.value.items);
      update();
      _sendingMsgProgressBar.hide();
    } on DioError catch (e) {
      onDioError(e, _sendingMsgProgressBar, errorMessage);
    } catch (err) {
      onCatchError(err, _sendingMsgProgressBar, errorMessage);
    }
  }

  void onSearchTextChanged(String val) {
    if (val.isNotEmpty) {
      tempInventoryRecords.value.items.clear();
      tempInventoryRecords.value.items.addAll(inventoryRecords.value.items);
      tempInventoryRecords.value.items.removeWhere((game) => !game
          .catalogSlideContent.content.description
          .toLowerCase()
          .contains(val.toLowerCase()));
    } else {
      tempInventoryRecords.value.items.addAll(inventoryRecords.value.items);
    }
    searchText.value = val;
    update();
  }

  void onSortCulumn(InventorySortTypes sortStatus) {
    currentType = sortStatus;
    isAscending = !isAscending;
    switch (sortStatus) {
      case InventorySortTypes.itemCode:
        if (isAscending) {
          tempInventoryRecords.value.items
              .sort((a, b) => a.item.id.unicity.compareTo(b.item.id.unicity));
        } else {
          tempInventoryRecords.value.items
              .sort((b, a) => a.item.id.unicity.compareTo(b.item.id.unicity));
        }
        break;
      case InventorySortTypes.itemName:
        if (isAscending) {
          tempInventoryRecords.value.items.sort((a, b) => a
              .catalogSlideContent.content.description
              .compareTo(b.catalogSlideContent.content.description));
        } else {
          tempInventoryRecords.value.items.sort((b, a) => a
              .catalogSlideContent.content.description
              .compareTo(b.catalogSlideContent.content.description));
        }
        break;
      case InventorySortTypes.pv:
        if (isAscending) {
          tempInventoryRecords.value.items
              .sort((a, b) => a.terms.priceEach.compareTo(b.terms.priceEach));
        } else {
          tempInventoryRecords.value.items
              .sort((b, a) => a.terms.priceEach.compareTo(b.terms.priceEach));
        }
        break;
      case InventorySortTypes.price:
        if (isAscending) {
          tempInventoryRecords.value.items
              .sort((a, b) => a.terms.priceEach.compareTo(b.terms.priceEach));
        } else {
          tempInventoryRecords.value.items
              .sort((b, a) => a.terms.priceEach.compareTo(b.terms.priceEach));
        }
        break;
      case InventorySortTypes.quantityOnHand:
        if (isAscending) {
          tempInventoryRecords.value.items.sort((a, b) => NumberFormat()
              .parse(a.quantityOnHand)
              .compareTo(NumberFormat().parse(b.quantityOnHand)));
        } else {
          tempInventoryRecords.value.items.sort((b, a) => NumberFormat()
              .parse(a.quantityOnHand)
              .compareTo(NumberFormat().parse(b.quantityOnHand)));
        }
        break;
      case InventorySortTypes.totalAccumulatedPrice:
        if (isAscending) {
          tempInventoryRecords.value.items.sort((a, b) =>
              (Parsing.intFrom(a.quantityOnHand)! * a.terms.priceEach.toInt())
                  .compareTo(Parsing.intFrom(b.quantityOnHand)! *
                      b.terms.priceEach.toInt()));
        } else {
          tempInventoryRecords.value.items.sort((b, a) =>
              (Parsing.intFrom(a.quantityOnHand)! * a.terms.priceEach.toInt())
                  .compareTo(Parsing.intFrom(b.quantityOnHand)! *
                      b.terms.priceEach.toInt()));
        }
        break;
      case InventorySortTypes.totalPV:
        if (isAscending) {
          tempInventoryRecords.value.items.sort((a, b) =>
              (Parsing.intFrom(a.quantityOnHand)! * a.terms.pvEach.toInt())
                  .compareTo(Parsing.intFrom(b.quantityOnHand)! *
                      b.terms.pvEach.toInt()));
        } else {
          tempInventoryRecords.value.items.sort((b, a) =>
              (Parsing.intFrom(a.quantityOnHand)! * a.terms.pvEach.toInt())
                  .compareTo(Parsing.intFrom(b.quantityOnHand)! *
                      b.terms.pvEach.toInt()));
        }
        break;
      default:
    }
    update();
  }

  void onTapFilterInventory(BuildContext context, StockTypes type) {
    filterMethod = describeEnum(type).obs;
    update();
    Navigator.pop(context);
    filterInventoryData(type);
  }

  //* Filter inventory records with quanntity without quantity
  void filterInventoryData(StockTypes type) {
    tempInventoryRecords.value.items.addAll(inventoryRecords.value.items);
    switch (type) {
      case StockTypes.onHand:
        tempInventoryRecords.value.items
            .removeWhere((game) => Parsing.intFrom(game.quantityOnHand) == 0);
        break;
      case StockTypes.outOfStock:
        tempInventoryRecords.value.items
            .removeWhere((game) => Parsing.intFrom(game.quantityOnHand) != 0);
        break;
      default:
        tempInventoryRecords.value.items.addAll(inventoryRecords.value.items);
    }
  }

  Future<void> showPopupMenu(BuildContext context) async {
    await showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(100, 105, 0, 100),
      items: [
        PopupMenuItem<String>(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          value: "onHand",
          child: ListTile(
            onTap: () {
              onTapFilterInventory(context, StockTypes.onHand);
            },
            shape: kRoundedBorder(),
            selected: filterMethod.value == describeEnum(StockTypes.onHand),
            selectedTileColor: Theme.of(context).colorScheme.primary,
            title: Text("On Hand",
                style: TextStyle(
                    color: filterMethod.value == describeEnum(StockTypes.onHand)
                        ? Colors.white
                        : Colors.black)),
          ),
        ),
        PopupMenuItem<String>(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          value: "outOfStock",
          child: ListTile(
            selected: filterMethod.value == describeEnum(StockTypes.outOfStock),
            onTap: () {
              onTapFilterInventory(context, StockTypes.outOfStock);
            },
            shape: kRoundedBorder(),
            selectedTileColor: Theme.of(context).colorScheme.primary,
            title: Text("Out Of Stock",
                style: TextStyle(
                    color: filterMethod.value ==
                            describeEnum(StockTypes.outOfStock)
                        ? Colors.white
                        : Colors.black)),
          ),
        ),
      ],
      elevation: 8.0,
    );
  }

  Future onTapExportExcellSheet() async {
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

        for (int i = 0; i < tempInventoryRecords.value.items.length; i++) {
          final InventoryRecordItems currentItem =
              tempInventoryRecords.value.items[i];
          final emptyA = sheetObject.cell(CellIndex.indexByString("A${i + 1}"));

          emptyA.cellStyle = headerCellStyle;
          final b = sheetObject.cell(CellIndex.indexByString("B${i + 1}"));
          final c = sheetObject.cell(CellIndex.indexByString("C${i + 1}"));
          final d = sheetObject.cell(CellIndex.indexByString("D${i + 1}"));
          final e = sheetObject.cell(CellIndex.indexByString("E${i + 1}"));
          final f = sheetObject.cell(CellIndex.indexByString("F${i + 1}"));
          final g = sheetObject.cell(CellIndex.indexByString("G${i + 1}"));
          final h = sheetObject.cell(CellIndex.indexByString("H${i + 1}"));
          if (i == 0) {
            emptyA.cellStyle = headerCellStyle;
            b.cellStyle = headerCellStyle;
            c.cellStyle = headerCellStyle;
            d.cellStyle = headerCellStyle;
            e.cellStyle = headerCellStyle;
            f.cellStyle = headerCellStyle;
            g.cellStyle = headerCellStyle;
            h.cellStyle = headerCellStyle;
          }
          if (i == 0) {
            emptyA.value = "SL No."; //!hardcoded
            b.value = "Item Code"; //!hardcoded
            c.value = "Item Name"; //!hardcoded
            d.value = "PV"; //!hardcoded
            e.value = "Price"; //!hardcoded
            f.value = "Quantity on hand"; //!hardcoded
            g.value = "Total Accumulated Price"; //!hardcoded
            h.value = "Total PV"; //!hardcoded
            emptyA.cellStyle = headerCellStyle;
            b.cellStyle = headerCellStyle;
            c.cellStyle = headerCellStyle;
            d.cellStyle = headerCellStyle;
            e.cellStyle = headerCellStyle;
            f.cellStyle = headerCellStyle;
            g.cellStyle = headerCellStyle;
            h.cellStyle = headerCellStyle;
          } else {
            emptyA.cellStyle = headerCellStyle;
            b.cellStyle = dataCellStyle;
            c.cellStyle = dataCellStyle;
            d.cellStyle = dataCellStyle;
            e.cellStyle = dataCellStyle;
            f.cellStyle = dataCellStyle;
            g.cellStyle = dataCellStyle;
            h.cellStyle = dataCellStyle;
            emptyA.value = "$i";
            b.value = currentItem.item.id.unicity;
            c.value = currentItem.catalogSlideContent.content.description;
            d.value = currentItem.terms.pvEach;
            e.value = currentItem.terms.priceEach;
            f.value = currentItem.quantityOnHand;
            g.value = calculateTotalAmount(
                quantity: currentItem.quantityOnHand,
                price: currentItem.terms.priceEach);
            h.value = calculateTotalAmount(
                quantity: currentItem.quantityOnHand,
                price: currentItem.terms.pvEach.toDouble());
          }
        }

        final String filePath =
            '${directory.path}/${DateTime.now().millisecondsSinceEpoch}.xlsx';

        final encoded = excel.encode();
        final file = File(join(filePath))
          ..createSync(recursive: true)
          ..writeAsBytesSync(encoded!);
        OpenFile.open(file.path, type: "xlsx/vnd.ms-excel", uti: ".xlsx");
      });
    }
  }

  Future<void> onTapPrint(BuildContext context) async {
    try {
      _sendingMsgProgressBar.show(context);
      final Dio dio = Dio();
      final response = await dio.get("${Address.inventoryPrint}=2970466");
      final removedBackground =
          response.toString().replaceAll('background: rgb(204,204,204);', '');
      _sendingMsgProgressBar.hide();
      await Printing.layoutPdf(
          dynamicLayout: false,
          onLayout: (PdfPageFormat format) async => Printing.convertHtml(
                format: format,
                html: removedBackground,
              ));
    } catch (err) {
      onCatchError(err, _sendingMsgProgressBar, errorMessage);
    }
  }
}
