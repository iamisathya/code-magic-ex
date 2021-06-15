import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';

import 'package:code_magic_ex/models/inventory_records.dart';
import 'package:code_magic_ex/api/config/api_service.dart';

class InventoryBLoc {
  final BehaviorSubject<InventoryRecords> _subject =
      BehaviorSubject<InventoryRecords>();

  final _activityIndicatorStreamController = BehaviorSubject<bool>.seeded(true);

  Stream<bool> get activityIndicatorStream =>
      _activityIndicatorStreamController.stream;

  Function(bool) get _setActivityIndicatorStream =>
      _activityIndicatorStreamController.sink.add;

  final _inventoryStreamController =
      BehaviorSubject<InventoryRecords>.seeded(InventoryRecords(items: []));

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
  }

  BehaviorSubject<InventoryRecords> get subject => _subject;
}

final inventoryBLoc = InventoryBLoc();
