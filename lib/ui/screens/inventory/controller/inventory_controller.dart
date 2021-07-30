import 'dart:async';
import 'dart:io';

import 'package:code_magic_ex/api/api_address.dart';
import 'package:code_magic_ex/api/config/api_service.dart';
import 'package:code_magic_ex/models/inventory_records.dart';
import 'package:code_magic_ex/ui/global/widgets/overlay_progress.dart';
import 'package:code_magic_ex/utilities/constants.dart';
import 'package:code_magic_ex/utilities/core/parsing.dart';
import 'package:code_magic_ex/utilities/enums.dart';
import 'package:code_magic_ex/utilities/function.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:excel/excel.dart';
import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:open_file/open_file.dart';
import 'package:printing/printing.dart';

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
      tempInventoryRecords.value.items = List.from(inventoryRecords.value.items);
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
          tempInventoryRecords.value.items
              .sort((a, b) => a.quantityOnHand.compareTo(b.quantityOnHand));
        } else {
          tempInventoryRecords.value.items
              .sort((b, a) => a.quantityOnHand.compareTo(b.quantityOnHand));
        }
        break;
      case InventorySortTypes.totalAccumulatedPrice:
        if (isAscending) {
          tempInventoryRecords.value.items.sort((a, b) =>
              (a.quantityOnHand * a.terms.priceEach.toInt())
                  .compareTo(b.quantityOnHand * a.terms.priceEach.toInt()));
        } else {
          tempInventoryRecords.value.items.sort((b, a) =>
              (a.quantityOnHand * a.terms.priceEach.toInt())
                  .compareTo(b.quantityOnHand * b.terms.priceEach.toInt()));
        }
        break;
      case InventorySortTypes.totalPV:
        if (isAscending) {
          tempInventoryRecords.value.items.sort((a, b) =>
              (a.quantityOnHand * a.terms.pvEach.toInt())
                  .compareTo(b.quantityOnHand * b.terms.pvEach.toInt()));
        } else {
          tempInventoryRecords.value.items.sort((b, a) =>
              (a.quantityOnHand * a.terms.pvEach.toInt())
                  .compareTo(b.quantityOnHand * b.terms.pvEach.toInt()));
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
            selectedTileColor: kMainColor,
            title: const Text("On Hand"),
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
            selectedTileColor: kMainColor,
            title: const Text("Out Of Stock"),
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
        final bytes = excel.encode();
        final Sheet sheet = excel['mySheet'];

        //* Check this
        // final Sheet unlinkedSheetObject = excel["sheet1"];
        // final List<InventoryRecordItems> dataList =
        //     tempInventoryRecords.value.items;
        // unlinkedSheetObject.insertRowIterables(dataList, 8);

        /// appending rows
        List<List<String>> list = List.generate(
            2, (index) => List.generate(2, (index1) => '$index $index1'));

        list.forEach((row) {
          sheet.appendRow(row);
        });

        sheet.appendRow([8, 10, 12, 12, 14, 14, 15, 16, 65]);
        final String filePath =
            '${directory.path}/${DateTime.now().millisecondsSinceEpoch}.xlsx';
        final fileDate = File(join(filePath))
          ..createSync(recursive: true)
          ..writeAsBytesSync(bytes!);
        debugPrint('Path of New Dir: $fileDate');
        OpenFile.open(fileDate.path, type: "xlsx/vnd.ms-excel", uti: ".xlsx");
      });
    }

    //* shareFiles: this has to be awaited 🤔
    // await Share.shareFiles([path]).then((value) => setState(() => excel = null));
    // });
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
