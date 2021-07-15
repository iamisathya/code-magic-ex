import 'package:code_magic_ex/models/inventory_records.dart';
import 'package:flutter/material.dart';

class ProductEntryAutoComplete extends StatelessWidget {
  const ProductEntryAutoComplete({
    required this.idx,
    required this.inventoryRecords,
    required this.onSelected,
  }) : super();
  final int idx;
  final InventoryRecords inventoryRecords;
  final Function(String, int) onSelected;

  @override
  Widget build(BuildContext context) {
    String _displayStringForOption(InventoryRecordItems option) =>
        option.item.id.unicity;

    return Autocomplete<InventoryRecordItems>(
      displayStringForOption: _displayStringForOption,
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<InventoryRecordItems>.empty();
        }
        return inventoryRecords.items.where((InventoryRecordItems option) {
          return option.toString().contains(textEditingValue.text);
        });
      },
      onSelected: (InventoryRecordItems item) =>
          onSelected(_displayStringForOption(item), idx),
    );
  }
}
