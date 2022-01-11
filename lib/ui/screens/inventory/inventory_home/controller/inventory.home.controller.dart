import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dsc_tools/api/config/api_service.dart';
import 'package:dsc_tools/constants/globals.dart';
import 'package:dsc_tools/models/general_models.dart';
import 'package:dsc_tools/models/inventory_item_v2.dart';
import 'package:dsc_tools/models/inventory_record_matched.dart';
import 'package:dsc_tools/models/managed_warehouse.dart';
import 'package:dsc_tools/services/rest_api/exceptions.dart';
import 'package:dsc_tools/utilities/enums.dart';
import 'package:dsc_tools/utilities/function.dart';
import 'package:dsc_tools/utilities/parsing.dart';
import 'package:dsc_tools/utilities/snackbar.dart';
import 'package:dsc_tools/utilities/user_session.dart';
import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class InventoryHomeController extends GetxController {
  final RxList<NameValueType> _allViewTypes = [
    NameValueType(name: "card_view".tr, value: "card"),
    NameValueType(name: "table_view".tr, value: "table")
  ].obs;

  final RxList<NameValueType> _allStockOptions = [
    NameValueType(name: "on_hand".tr, value: "onHand"),
    NameValueType(name: "out_of_stock".tr, value: "outOfStock")
  ].obs;

  final Rx<NameValueType> _activeStockType =
      NameValueType(name: "on_hand".tr, value: "onHand").obs;

  final Rx<NameValueType> _activeViewType =
      NameValueType(name: "card_view".tr, value: "card").obs;

  RxBool isLoading = false.obs;
  RxString grandTotalPrice = "".obs;
  RxString grandTotalPv = "".obs;

  TextEditingController searchController = TextEditingController();

  final Rx<InventoryItemV2> _tempInventoryRecords =
      InventoryItemV2(items: []).obs;
  final Rx<InventoryItemV2> _inventoryRecords = InventoryItemV2(items: []).obs;
  final RxList<InventoryRecordsMatchedItem> _inventoryRecordsOutOfStock =
      <InventoryRecordsMatchedItem>[].obs;
  Rx<InventoryItemV2> searchedProducts = InventoryItemV2(items: []).obs;
  ManagedWarehouses warehouses = ManagedWarehouses(items: []);
  InventorySortTypes currentType = InventorySortTypes.itemCode;
  bool isAscending = true;

  List<InventoryItem> get inventoryItems => _tempInventoryRecords.value.items!;
  List<InventoryItem> get allInventoryItems => _inventoryRecords.value.items!;
  List<InventoryRecordsMatchedItem> get outOfStockItems =>
      _inventoryRecordsOutOfStock;

  // card or table view
  String get activeViewType => _activeViewType.value.value;
  List<NameValueType> get allViewType => _allViewTypes;
  set activeViewType(String value) => _activeViewType.value =
      _allViewTypes.firstWhere((element) => element.value == value);

  // outOfStock or inStock
  String get activeStockType => _activeStockType.value.value;
  List<NameValueType> get allStockTypes => _allStockOptions;
  set activeStockType(String value) => _activeStockType.value =
      _allStockOptions.firstWhere((element) => element.value == value);

  @override
  void onInit() {
    loadAllInventory();
    super.onInit();
  }

  Future<void> loadAllInventory() async {
    try {
      isLoading.toggle();
      await Future.wait<void>([
        loadInventory(),
        loadOutOfStockInventory(), // Get hydra products to get image urls
      ]).then((_) => onCompleteFetching());
    } on AppException catch (exception, stack) {
      isLoading.toggle();
      exception.logError(exception, stack);
    }
  }

  void onCompleteFetching() {
    isLoading.toggle();
    onChangeStockType("onHand");
    _tempInventoryRecords.value.items =
        List.from(_inventoryRecords.value.items!);
    calculateTotal();
    _tempInventoryRecords.refresh();
  }

  Future<void> loadInventory() async {
    try {
      final InventoryItemV2 records = await MemberCalls2Service.authNoLogger()
          .loadInventoryProductsV2(
              "50b0517be73b8280e59d6f9d1c6a8f09418cd2304f9d29b9902ecfa5e0212899",
              "item",
              Globals.currentMarket!.isoCode);
      _inventoryRecords.value.items!.addAll(List.from(records.items!));
      if (records.items!.isEmpty) {
        SnackbarUtil.showError(message: "no_warehouses_found".tr);
      }
    } on DioError catch (e, stack) {
      const AppException().logError(e, stack);
    } on AppException catch (exception, stack) {
      exception.logError(exception, stack);
    }
  }

  Future<void> loadOutOfStockInventory() async {
    try {
      final List<InventoryRecordsMatchedItem> inventoryRecordsOutOfStock1 =
          await MemberCallsService.clientNoLogger()
              .getOutOfStockInventoryRecords(
                  "1_11", UserSessionManager.shared.customerToken.token);
      final InventoryItemV2 records = InventoryItemV2(items: []);
      for (final InventoryRecordsMatchedItem item
          in inventoryRecordsOutOfStock1) {
        final InventoryItem outOfStockItem = InventoryItem(
            catalogSlide:
                CatalogSlide(content: Content(description: item.itemNameEn)),
            item: Item(href: item.itemCode, id: Id(unicity: item.itemId)),
            quantityOnHand: "0",
            terms: Terms(
                priceEach: double.parse(item.itemPrice).toInt(),
                pvEach: int.parse(item.itemPv)));
        records.items!.add(outOfStockItem);
      }
      _inventoryRecords.value.items!.addAll(records.items!.toList());
    } on DioError catch (e) {
      final String message = getErrorMessage(e.response!.data);
      SnackbarUtil.showError(message: message);
      returnResponse(e.response!);
    } on AppException catch (err, s) {
      err.logError(err, s);
    }
  }

  void calculateTotal() {
    try {
      grandTotalPrice.value = calculateTotalPriceFromInventoryItemV2(
          _tempInventoryRecords.value, 'price');
      grandTotalPv.value = calculateTotalPriceFromInventoryItemV2(
          _tempInventoryRecords.value, 'pv');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void onChangeStockType(String value) {
    try {
     _activeStockType.value =
        _allStockOptions.firstWhere((element) => element.value == value);
    if (value == "outOfStock") {
      _tempInventoryRecords.value.items = _inventoryRecords.value.items!
          .where((item) => item.quantityOnHand == "0")
          .toList();
    } else {
      _tempInventoryRecords.value.items = _inventoryRecords.value.items!
          .where((item) => item.quantityOnHand != "0")
          .toList();
    }
    activeStockType = _activeStockType.value.value;
    _tempInventoryRecords.refresh();
    calculateTotal(); 
    } on AppException catch (e, stack) {
      e.logError(e, stack);
    }    
  }

  void onChangeViewType(String value) {
    _activeViewType.value =
        _allViewTypes.firstWhere((element) => element.value == value);
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

        for (int i = 0; i < _tempInventoryRecords.value.items!.length; i++) {
          final InventoryItem currentItem =
              _tempInventoryRecords.value.items![i];
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
            b.value = "itemcode".tr;
            c.value = "itemname".tr;
            d.value = "pv".tr;
            e.value = "price".tr;
            f.value = "quantiity_on_hand".tr;
            g.value = "total_accumulated_price".tr;
            h.value = "total_pv".tr;
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
            b.value = currentItem.item!.id!.unicity;
            c.value = currentItem.catalogSlide!.content!.description;
            d.value = currentItem.terms!.pvEach;
            e.value = currentItem.terms!.priceEach;
            f.value = currentItem.quantityOnHand;
            g.value = calculateTotalAmount(
                quantity: currentItem.quantityOnHand!,
                price: currentItem.terms!.priceEach!.toDouble());
            h.value = calculateTotalAmount(
                quantity: currentItem.quantityOnHand!,
                price: currentItem.terms!.pvEach!.toDouble());
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
      await proceedPrinting();
      isLoading.toggle();
    } catch (err) {
      isLoading.toggle();
    }
  }

  void onSortCulumn(InventorySortTypes sortStatus) {
    currentType = sortStatus;
    isAscending = !isAscending;
    switch (sortStatus) {
      case InventorySortTypes.itemCode:
        if (isAscending) {
          _tempInventoryRecords.value.items!.sort(
              (a, b) => a.item!.id!.unicity!.compareTo(b.item!.id!.unicity!));
        } else {
          _tempInventoryRecords.value.items!.sort(
              (b, a) => a.item!.id!.unicity!.compareTo(b.item!.id!.unicity!));
        }
        break;
      case InventorySortTypes.itemName:
        if (isAscending) {
          _tempInventoryRecords.value.items!.sort((a, b) => a
              .catalogSlide!.content!.description!
              .compareTo(b.catalogSlide!.content!.description!));
        } else {
          _tempInventoryRecords.value.items!.sort((b, a) => a
              .catalogSlide!.content!.description!
              .compareTo(b.catalogSlide!.content!.description!));
        }
        break;
      case InventorySortTypes.pv:
        if (isAscending) {
          _tempInventoryRecords.value.items!.sort(
              (a, b) => a.terms!.priceEach!.compareTo(b.terms!.priceEach!));
        } else {
          _tempInventoryRecords.value.items!.sort(
              (b, a) => a.terms!.priceEach!.compareTo(b.terms!.priceEach!));
        }
        break;
      case InventorySortTypes.price:
        if (isAscending) {
          _tempInventoryRecords.value.items!.sort(
              (a, b) => a.terms!.priceEach!.compareTo(b.terms!.priceEach!));
        } else {
          _tempInventoryRecords.value.items!.sort(
              (b, a) => a.terms!.priceEach!.compareTo(b.terms!.priceEach!));
        }
        break;
      case InventorySortTypes.quantityOnHand:
        if (isAscending) {
          _tempInventoryRecords.value.items!.sort((a, b) => NumberFormat()
              .parse(a.quantityOnHand!)
              .compareTo(NumberFormat().parse(b.quantityOnHand!)));
        } else {
          _tempInventoryRecords.value.items!.sort((b, a) => NumberFormat()
              .parse(a.quantityOnHand!)
              .compareTo(NumberFormat().parse(b.quantityOnHand!)));
        }
        break;
      case InventorySortTypes.totalAccumulatedPrice:
        if (isAscending) {
          _tempInventoryRecords.value.items!.sort((a, b) =>
              (Parsing.intFrom(a.quantityOnHand)! * a.terms!.priceEach!.toInt())
                  .compareTo(Parsing.intFrom(b.quantityOnHand)! *
                      b.terms!.priceEach!.toInt()));
        } else {
          _tempInventoryRecords.value.items!.sort((b, a) =>
              (Parsing.intFrom(a.quantityOnHand)! * a.terms!.priceEach!.toInt())
                  .compareTo(Parsing.intFrom(b.quantityOnHand)! *
                      b.terms!.priceEach!.toInt()));
        }
        break;
      case InventorySortTypes.totalPV:
        if (isAscending) {
          _tempInventoryRecords.value.items!.sort((a, b) =>
              (Parsing.intFrom(a.quantityOnHand)! * a.terms!.pvEach!.toInt())
                  .compareTo(Parsing.intFrom(b.quantityOnHand)! *
                      b.terms!.pvEach!.toInt()));
        } else {
          _tempInventoryRecords.value.items!.sort((b, a) =>
              (Parsing.intFrom(a.quantityOnHand)! * a.terms!.pvEach!.toInt())
                  .compareTo(Parsing.intFrom(b.quantityOnHand)! *
                      b.terms!.pvEach!.toInt()));
        }
        break;
      default:
    }
    _tempInventoryRecords.refresh();
  }

  void onSearchTextChange(String searchText) {
    if (searchText.isNotEmpty) {
      searchedProducts.value.items!.clear();
      searchedProducts.value.items!.addAll(_inventoryRecords.value.items!);
      searchedProducts.value.items!.removeWhere((game) => !game
          .catalogSlide!.content!.description!
          .toLowerCase()
          .contains(searchText.toLowerCase()));
    } else {
      searchedProducts.value.items!.addAll(_inventoryRecords.value.items!);
    }
    searchedProducts.refresh();
  }
}
