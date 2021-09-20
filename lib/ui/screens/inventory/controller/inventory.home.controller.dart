import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dsc_tools/models/managed_warehouse.dart';
import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
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
import '../../../../models/inventory_records.dart';
import '../../../../utilities/enums.dart';
import '../../../../utilities/extensions.dart';
import '../../../../utilities/function.dart';
import '../../../../utilities/logger.dart';
import '../../../../utilities/parsing.dart';
import '../../../../utilities/snackbar.dart';

class InventoryHomeController extends GetxController {
  RxList<NameValueType> viewTypes = [
    NameValueType(name: "Card View", value: "card"),
    NameValueType(name: "Table View", value: "table")
  ].obs;

  RxList<NameValueType> stockOptions = [
    NameValueType(name: "On Hand", value: "onHand"),
    NameValueType(name: "Out Of Stock", value: "outOfStock")
  ].obs;

  Rx<NameValueType> activeStockType =
      NameValueType(name: "On Hand", value: "onHand").obs;

  Rx<NameValueType> currentViewType =
      NameValueType(name: "Card View", value: "card").obs;

  RxBool isLoading = false.obs;
  RxString grandTotalPrice = "".obs;
  RxString grandTotalPv = "".obs;

  TextEditingController searchController = TextEditingController();
  Rx<InventoryRecords> inventoryRecords = InventoryRecords(items: []).obs;
  Rx<InventoryRecords> tempInventoryRecords = InventoryRecords(items: []).obs;
  Rx<InventoryRecords> searchedProducts = InventoryRecords(items: []).obs;
  ManagedWarehouses warehouses = ManagedWarehouses(items: []);
  InventorySortTypes currentType = InventorySortTypes.itemCode;
  bool isAscending = true;

  @override
  void onInit() {
    getManagedWarehouses();
    super.onInit();
  }

  Future<void> getManagedWarehouses() async {
    isLoading.toggle();
    try {
      warehouses = await ApiService.shared().getManagedWarehouses();
      if (warehouses.items.isNotEmpty) {
        await loadInventoryProducts(
            warehouses.items[0].href.getAfterLastSlash());
      } else {
        isLoading.toggle();
        SnackbarUtil.showError(message: "No warehouses found");
      }
    } on DioError catch (e) {
      isLoading.toggle();
      final String message = getErrorMessage(e.response!.data);
      SnackbarUtil.showError(message: message);
      returnResponse(e.response!);
    } catch (err) {
      isLoading.toggle();
      LoggerService.instance.e(err.toString());
    }
  }

  Future<void> loadInventoryProducts(String warehouseId) async {
    const String type = "item";
    try {
      inventoryRecords.value =
          await ApiService.shared().getInventoryRecords(warehouseId, type);
      tempInventoryRecords.value.items =
          List.from(inventoryRecords.value.items);
      calculateTotal();
      tempInventoryRecords.refresh();
      isLoading.toggle();
    } on DioError catch (e) {
      isLoading.toggle();
      final String message = getErrorMessage(e.response!.data);
      SnackbarUtil.showError(message: message);
      returnResponse(e.response!);
    } catch (err) {
      isLoading.toggle();
      LoggerService.instance.e(err.toString());
    }
  }

  void calculateTotal() {
    final String totalPrice =
        calculateTotalPrice(tempInventoryRecords.value, 'price');
    final String totalPv =
        calculateTotalPrice(tempInventoryRecords.value, 'pv');
    grandTotalPrice.value = totalPrice;
    grandTotalPv.value = totalPv;
  }

  void onChangeStockType(String value) {
    activeStockType.value =
        stockOptions.firstWhere((element) => element.value == value);
    if (value == "outOfStock") {
      tempInventoryRecords.value.items = tempInventoryRecords.value.items
          .where((item) => item.quantityOnHand == "0")
          .toList();
    } else {
      tempInventoryRecords.value.items =
          List.from(inventoryRecords.value.items);
    }
    tempInventoryRecords.refresh();
  }

  void onChangeViewType(String value) {
    currentViewType.value =
        viewTypes.firstWhere((element) => element.value == value);
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
            emptyA.value = "SL No.";
            b.value = "Item Code";
            c.value = "Item Name";
            d.value = "PV";
            e.value = "Price";
            f.value = "Quantity on hand";
            g.value = "Total Accumulated Price";
            h.value = "Total PV";
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

  Future<void> onTapPrint() async {
    try {
      isLoading.toggle();
      final Dio dio = Dio();
      final response = await dio.get("${Address.inventoryPrint}=2970466");
      final removedBackground =
          response.toString().replaceAll('background: rgb(204,204,204);', '');
      isLoading.toggle();
      await Printing.layoutPdf(
          dynamicLayout: false,
          onLayout: (PdfPageFormat format) async => Printing.convertHtml(
                format: format,
                html: removedBackground,
              ));
    } catch (err) {
      isLoading.toggle();
      LoggerService.instance.e(err.toString());
    }
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
    tempInventoryRecords.refresh();
  }

  void onSearchTextChange(String searchText) {
    if (searchText.isNotEmpty) {
      searchedProducts.value.items.clear();
      searchedProducts.value.items.addAll(inventoryRecords.value.items);
      searchedProducts.value.items.removeWhere((game) => !game
          .catalogSlideContent.content.description
          .toLowerCase()
          .contains(searchText.toLowerCase()));
    } else {
      searchedProducts.value.items.addAll(inventoryRecords.value.items);
    }
    searchedProducts.refresh();
  }
}
