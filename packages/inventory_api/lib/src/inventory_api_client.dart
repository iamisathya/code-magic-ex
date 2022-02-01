import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:inventory_api/inventory_api.dart';

/// Exception thrown when locationSearch fails.
class InventoryRequestFailure implements Exception {}

/// Exception thrown when the provided location is not found.
class InventoryNotFoundFailure implements Exception {}

/// Exception thrown when getWeather fails.
class WarehouseRequestFailure implements Exception {}

/// Exception thrown when weather for provided location is not found.
class WarehouseNotFoundFailure implements Exception {}

class InventoryApiClient {
  /// {@macro meta_weather_api_client}
  InventoryApiClient({Dio? dioClient}) : _dioClient = dioClient ?? Dio();

  static const _baseUrl = 'https://member-calls2.unicity.com';
  static const _baseHydraUrl =
      'https://hydra.unicity.net/v5a/customers/me/managedwarehouses';

  final Dio _dioClient;

  /// Fetches all [inventoryItemList] from a [warehouse].
  Future<InventoryItemListModel> getInventory(
      String warehouseId, String expand, String countryCode) async {
    final locationResponse = await _dioClient.get(
        '$_baseUrl/$warehouseId/inventoryRecords?expand=$expand&countryCode=$countryCode');

    if (locationResponse.statusCode != 200) {
      throw InventoryRequestFailure();
    }

    final locationJson = jsonDecode(
      locationResponse.data as String,
    ) as List;

    if (locationJson.isEmpty) {
      throw InventoryNotFoundFailure();
    }

    return InventoryItemListModel.fromJson(
        locationJson as Map<String, dynamic>);
  }

  /// Fetches [Warehouses] for a given [country].
  Future<String> getWarehouseId(String customeToken) async {
    try {
      _dioClient.options.headers['authorization'] = "Bearer $customeToken";
      final weatherResponse = await _dioClient.get(_baseHydraUrl);

      if (weatherResponse.statusCode != 200) {
        throw WarehouseRequestFailure();
      }

      final warehousesList =
          WarehousesList.fromJson(weatherResponse.data as Map<String, dynamic>);
      if (warehousesList.items.isEmpty) {
        throw WarehouseNotFoundFailure();
      }

      return warehousesList.items.first.href;
    } catch (e, s) {
      print(e);
      print(s.toString());
      return "";
    }
  }
}
