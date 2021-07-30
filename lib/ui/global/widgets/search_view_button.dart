import 'package:code_magic_ex/utilities/constants.dart';
import 'package:flutter/material.dart';

class SearchWithButton extends StatelessWidget {
  final TextEditingController searchController;
  final Function onPressClear;
  final Function(String) onTextChange;
  final String hintText;
  final String clearText;
  const SearchWithButton(
      {required this.searchController,
      required this.onPressClear,
      required this.onTextChange,
      this.hintText = "Search",
      this.clearText = "Clear"});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                border: Border.all(color: kMainColor, width: 2),
                borderRadius: const BorderRadius.all(Radius.circular(8.0))),
            child: TextField(
              onChanged: (val) => onTextChange(val),
              cursorColor: Colors.grey[300],
              controller: searchController,
              decoration: InputDecoration(
                hintText: hintText,
                focusedBorder: InputBorder.none,
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                hintStyle: TextStyle(color: Colors.grey[300]),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 86,
          height: 50,
          child: Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Container(
              decoration: kCircular8,
              child: ElevatedButton(
                onPressed: () => onPressClear(),
                style: ElevatedButton.styleFrom(
                    shape: kRoundedBorder(radius: 20),
                    primary: kMainColor,
                    padding: kEdgeA12()),
                child: Text(clearText),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
