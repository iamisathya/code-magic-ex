import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import '../../../models/inventory_records.dart';
import '../../../utilities/constants.dart';

class SearchableDropdown extends StatelessWidget {
  const SearchableDropdown({
    required this.idx,
    required this.inventoryRecords,
    required this.onSelected,
  }) : super();
  final int idx;
  final InventoryRecords inventoryRecords;
  final Function(String, int) onSelected;

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<InventoryRecordItems>(
        showSearchBox: true,
        mode: Mode.MENU,
        showSelectedItem: true,
        items: inventoryRecords.items,
        showClearButton: true,
        onChanged: (option) => onSelected(option!.item.id.unicity, idx),
        popupSafeArea: const PopupSafeArea(),
        searchBoxDecoration: kAutoCompleteTextInputDecoration(),
        autoFocusSearchBox: true,
        hint: "country in menu mode",
        selectedItem: inventoryRecords.items[0]);
  }
}
