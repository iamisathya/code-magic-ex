import 'package:flutter/material.dart';

import '../../../utilities/constants.dart';

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
      this.hintText = "",
      this.clearText = "Clear"});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Container(
            margin: const EdgeInsets.all(8),
            child: TextField(
              onChanged: (val) => onTextChange(val),
              controller: searchController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 90,
          height: 54,
          child: Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Container(
              decoration: kCircular8,
              child: ElevatedButton(
                onPressed: () => onPressClear(),
                child: Text(clearText),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
