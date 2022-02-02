import 'dart:async';

import 'package:inventory_api/inventory_api.dart';

class InventoryFailure implements Exception {}

class InventoryRepository {
  InventoryRepository({InventoryApiClient? inventoryApiClient})
      : _inventoryApiClient = inventoryApiClient ?? InventoryApiClient();

  final InventoryApiClient _inventoryApiClient;

  Future<InventoryItemListModel> getInventory(String customerToken) async {
    final warehouseId = await _inventoryApiClient.getWarehouseId(customerToken);
    final inventoryList =
        await _inventoryApiClient.getInventory(warehouseId, "", "");
    return inventoryList;
  }
}
