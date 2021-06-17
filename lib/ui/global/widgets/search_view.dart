//Create a SearchView
import 'package:code_magic_ex/ui/screens/inventory/bloc.dart';
import 'package:flutter/material.dart';

class SearchViewWidget extends StatelessWidget {
  final Stream<String> getSearchTextStream;
  final TextEditingController searchviewController;

  const SearchViewWidget({
    required this.getSearchTextStream,
    required this.searchviewController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: const BorderRadius.all(Radius.circular(8.0))),
      child: StreamBuilder<Object>(
          stream: inventoryBLoc.getSearchTextStream,
          builder: (context, snapshot) {
            searchviewController.text = snapshot.data.toString();
            searchviewController.selection = TextSelection.fromPosition(
                TextPosition(offset: searchviewController.text.length));
            return TextField(
              onChanged: (value) => inventoryBLoc.onTextSearchChange(value),
              cursorColor: Colors.grey[300],
              controller: searchviewController,
              decoration: InputDecoration(
                hintText: "Search",
                focusedBorder: InputBorder.none,
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                hintStyle: TextStyle(color: Colors.grey[300]),
              ),
            );
          }),
    );
  }
}
