import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';

import 'package:code_magic_ex/models/inventory_records.dart';
import 'package:code_magic_ex/api/config/api_service.dart';

class InventoryBLoc {
  final BehaviorSubject<InventoryRecords> _subject =
      BehaviorSubject<InventoryRecords>();

  final _activityIndicatorStreamController = BehaviorSubject<bool>.seeded(true);

  final _searchStreamController = BehaviorSubject<String>.seeded("");

  final _inventoryStreamController =
      BehaviorSubject<InventoryRecords>.seeded(InventoryRecords(items: []));

  Stream<String> get getSearchTextStream => _searchStreamController.stream;

  void onTextSearchChange(String searchText) {
    final InventoryRecords filteredRecords = _inventoryStreamController.value;
    filteredRecords.items.where((item) => item
        .catalogSlideContent.content.description
        .toLowerCase()
        .contains(searchText.toLowerCase()));
    _inventoryStreamController.sink.add(filteredRecords);
    setInventoryStream(filteredRecords);
    setSearchTextStream(searchText);
  }

  Function(String) get setSearchTextStream => _searchStreamController.sink.add;

  Stream<bool> get activityIndicatorStream =>
      _activityIndicatorStreamController.stream;

  bool get isLoading => _activityIndicatorStreamController.value;

  Function(bool) get _setActivityIndicatorStream =>
      _activityIndicatorStreamController.sink.add;

  Stream<InventoryRecords> get appInventoryStream =>
      _inventoryStreamController.stream;

  Function(InventoryRecords) get setInventoryStream =>
      _inventoryStreamController.sink.add;

  Future<void> getInventoryRecords(BuildContext context) async {
    _setActivityIndicatorStream(true);
    final InventoryRecords inventoryRecords = await ApiService.shared()
        .getInventoryRecords(
            "9e41f330617aa2801b45620f8ffc5615306328fa0bd2255b0d42d7746560d24c",
            "item");
    _setActivityIndicatorStream(false);
    setInventoryStream(inventoryRecords);
    _subject.sink.add(inventoryRecords);
  }

  void dispose() {
    _subject.close();
    _searchStreamController.close();
  }

  BehaviorSubject<InventoryRecords> get subject => _subject;
}

final inventoryBLoc = InventoryBLoc();
