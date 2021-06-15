import 'package:code_magic_ex/models/inventory_records.dart';

class SearchState {}

class SearchLoading extends SearchState {}

class SearchError extends SearchState {}

class SearchNoTerm extends SearchState {}

class SearchPopulated extends SearchState {
  final InventoryRecords inventoryRecords;

  SearchPopulated(this.inventoryRecords);
}

class SearchEmpty extends SearchState {}