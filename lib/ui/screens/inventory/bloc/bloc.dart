import 'package:code_magic_ex/api/config/api_service.dart';
import 'package:code_magic_ex/models/inventory_records.dart';
import 'package:code_magic_ex/utilities/constants.dart';
import 'package:code_magic_ex/utilities/enums.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:code_magic_ex/utilities/Logger/logger.dart';

class InventoryController extends GetxController {
  final TextEditingController searchController = TextEditingController();
  static int sortName = 0;
  static int sortStatus = 1;
  bool isAscending = true;
  InventorySortTypes currentType = InventorySortTypes.itemCode;

  RxString filterMethod = "onHand".obs;

  RxBool loading = false.obs;
  RxString errorMessage = "".obs;

  InventoryRecords inventoryRecords = InventoryRecords(items: []);

  int get currentOrdersLength => inventoryRecords.items.length;
  int get currentTabLength => currentOrdersLength;

  List<InventoryRecordItems> get currentTabItems => inventoryRecords.items;

  List<InventoryRecordItems> get currentOrders => inventoryRecords.items;

  void onSortCulumn(InventorySortTypes sortStatus) {
    currentType = sortStatus;
    isAscending = !isAscending;
    switch (sortStatus) {
      case InventorySortTypes.itemCode:
        if (isAscending) {
          inventoryRecords.items
              .sort((a, b) => a.item.id.unicity.compareTo(b.item.id.unicity));
        } else {
          inventoryRecords.items
              .sort((b, a) => a.item.id.unicity.compareTo(b.item.id.unicity));
        }
        break;
      case InventorySortTypes.itemName:
        if (isAscending) {
          inventoryRecords.items.sort((a, b) => a
              .catalogSlideContent.content.description
              .compareTo(b.catalogSlideContent.content.description));
        } else {
          inventoryRecords.items.sort((b, a) => a
              .catalogSlideContent.content.description
              .compareTo(b.catalogSlideContent.content.description));
        }
        break;
      case InventorySortTypes.pv:
        if (isAscending) {
          inventoryRecords.items
              .sort((a, b) => a.terms.priceEach.compareTo(b.terms.priceEach));
        } else {
          inventoryRecords.items
              .sort((b, a) => a.terms.priceEach.compareTo(b.terms.priceEach));
        }
        break;
      case InventorySortTypes.price:
        if (isAscending) {
          inventoryRecords.items
              .sort((a, b) => a.terms.priceEach.compareTo(b.terms.priceEach));
        } else {
          inventoryRecords.items
              .sort((b, a) => a.terms.priceEach.compareTo(b.terms.priceEach));
        }
        break;
      case InventorySortTypes.quantityOnHand:
        if (isAscending) {
          inventoryRecords.items
              .sort((a, b) => a.quantityOnHand.compareTo(b.quantityOnHand));
        } else {
          inventoryRecords.items
              .sort((b, a) => a.quantityOnHand.compareTo(b.quantityOnHand));
        }
        break;
      case InventorySortTypes.totalAccumulatedPrice:
        if (isAscending) {
          inventoryRecords.items.sort((a, b) =>
              (a.quantityOnHand * a.terms.priceEach.toInt())
                  .compareTo(b.quantityOnHand * a.terms.priceEach.toInt()));
        } else {
          inventoryRecords.items.sort((b, a) =>
              (a.quantityOnHand * a.terms.priceEach.toInt())
                  .compareTo(b.quantityOnHand * b.terms.priceEach.toInt()));
        }
        break;
      case InventorySortTypes.totalPV:
        if (isAscending) {
          inventoryRecords.items.sort((a, b) =>
              (a.quantityOnHand * a.terms.pvEach.toInt())
                  .compareTo(b.quantityOnHand * b.terms.pvEach.toInt()));
        } else {
          inventoryRecords.items.sort((b, a) =>
              (a.quantityOnHand * a.terms.pvEach.toInt())
                  .compareTo(b.quantityOnHand * b.terms.pvEach.toInt()));
        }
        break;

      default:
    }
    update();
  }

  Future<void> loadSalesReports() async {
    // if (searchController.text.isEmpty) {
    //   renderErrorSnackBar(
    //       title: "Search text empty!",
    //       subTitle: "Please enter search text to continue");
    //   return;
    // }
    const String type = "item";
    const String userId =
        "9e41f330617aa2801b45620f8ffc5615306328fa0bd2255b0d42d7746560d24c";
    loading(true);
    update();
    try {
      inventoryRecords =
          await ApiService.shared().getInventoryRecords(userId, type);
      loading(false);
      update();
    } catch (err) {
      loading(false);
      errorMessage(err.toString());
      LoggerService.instance.e(err.toString());
      update();
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
              filterMethod = "onHand".obs;
              update();
              Navigator.pop(context);
            },
            selected: filterMethod.value == "order",
            selectedTileColor: kPrimaryColor,
            title: const Text("On Hand"),
          ),
        ),
        PopupMenuItem<String>(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          value: "outOfStock",
          child: ListTile(
            selected: filterMethod.value == "outOfStock",
            onTap: () {
              filterMethod = "outOfStock".obs;
              update();
              Navigator.pop(context);
            },
            selectedTileColor: kPrimaryColor,
            title: const Text("Out Of Stock"),
          ),
        ),
      ],
      elevation: 8.0,
    );
  }
}
