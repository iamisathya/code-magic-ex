import 'package:code_magic_ex/api/config/api_service.dart';
import 'package:code_magic_ex/models/inventory_records.dart';
import 'package:code_magic_ex/utilities/constants.dart';
import 'package:code_magic_ex/utilities/enums.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:code_magic_ex/utilities/Logger/logger.dart';

class InventoryController extends GetxController {
  Rx<InventoryRecords> backUpGamesList = InventoryRecords(items: []).obs;
  Rx<InventoryRecords> filteredGamesList = InventoryRecords(items: []).obs;

  final TextEditingController searchController = TextEditingController();
  RxString searchText = ''.obs;
  static int sortName = 0;
  static int sortStatus = 1;
  bool isAscending = true;
  InventorySortTypes currentType = InventorySortTypes.itemCode;

  set onSearchTextChanged(String val) {
    if (val.isNotEmpty) {
      filteredGamesList.value.items.clear();
      filteredGamesList.value.items.addAll(backUpGamesList.value.items);
      filteredGamesList.value.items.removeWhere((game) => !game
          .catalogSlideContent.content.description
          .toLowerCase()
          .contains(val.toLowerCase()));
      print(filteredGamesList.value.items.length);
      tempInventoryRecords = filteredGamesList.value;
      // update();
    } else {
      tempInventoryRecords = inventoryRecords;
    }
    searchText.value = val;
    update();
  }

  String get onSearchTextChanged => searchText.value;

  RxString filterMethod = "onHand".obs;

  RxBool loading = false.obs;
  RxString errorMessage = "".obs;

  InventoryRecords inventoryRecords = InventoryRecords(items: []);
  InventoryRecords tempInventoryRecords = InventoryRecords(items: []);

  int get currentOrdersLength => tempInventoryRecords.items.length;
  int get currentTabLength => currentOrdersLength;

  List<InventoryRecordItems> get currentTabItems => tempInventoryRecords.items;

  List<InventoryRecordItems> get currentOrders => tempInventoryRecords.items;

  void onSortCulumn(InventorySortTypes sortStatus) {
    currentType = sortStatus;
    isAscending = !isAscending;
    switch (sortStatus) {
      case InventorySortTypes.itemCode:
        if (isAscending) {
          tempInventoryRecords.items
              .sort((a, b) => a.item.id.unicity.compareTo(b.item.id.unicity));
        } else {
          tempInventoryRecords.items
              .sort((b, a) => a.item.id.unicity.compareTo(b.item.id.unicity));
        }
        break;
      case InventorySortTypes.itemName:
        if (isAscending) {
          tempInventoryRecords.items.sort((a, b) => a
              .catalogSlideContent.content.description
              .compareTo(b.catalogSlideContent.content.description));
        } else {
          tempInventoryRecords.items.sort((b, a) => a
              .catalogSlideContent.content.description
              .compareTo(b.catalogSlideContent.content.description));
        }
        break;
      case InventorySortTypes.pv:
        if (isAscending) {
          tempInventoryRecords.items
              .sort((a, b) => a.terms.priceEach.compareTo(b.terms.priceEach));
        } else {
          tempInventoryRecords.items
              .sort((b, a) => a.terms.priceEach.compareTo(b.terms.priceEach));
        }
        break;
      case InventorySortTypes.price:
        if (isAscending) {
          tempInventoryRecords.items
              .sort((a, b) => a.terms.priceEach.compareTo(b.terms.priceEach));
        } else {
          tempInventoryRecords.items
              .sort((b, a) => a.terms.priceEach.compareTo(b.terms.priceEach));
        }
        break;
      case InventorySortTypes.quantityOnHand:
        if (isAscending) {
          tempInventoryRecords.items
              .sort((a, b) => a.quantityOnHand.compareTo(b.quantityOnHand));
        } else {
          tempInventoryRecords.items
              .sort((b, a) => a.quantityOnHand.compareTo(b.quantityOnHand));
        }
        break;
      case InventorySortTypes.totalAccumulatedPrice:
        if (isAscending) {
          tempInventoryRecords.items.sort((a, b) =>
              (a.quantityOnHand * a.terms.priceEach.toInt())
                  .compareTo(b.quantityOnHand * a.terms.priceEach.toInt()));
        } else {
          tempInventoryRecords.items.sort((b, a) =>
              (a.quantityOnHand * a.terms.priceEach.toInt())
                  .compareTo(b.quantityOnHand * b.terms.priceEach.toInt()));
        }
        break;
      case InventorySortTypes.totalPV:
        if (isAscending) {
          tempInventoryRecords.items.sort((a, b) =>
              (a.quantityOnHand * a.terms.pvEach.toInt())
                  .compareTo(b.quantityOnHand * b.terms.pvEach.toInt()));
        } else {
          tempInventoryRecords.items.sort((b, a) =>
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
      tempInventoryRecords = inventoryRecords;
      backUpGamesList.value.items.addAll(inventoryRecords.items.obs);
      filteredGamesList.value.items.addAll(inventoryRecords.items.obs);
      
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
