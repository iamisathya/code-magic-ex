//Create a SearchView
import 'package:code_magic_ex/utilities/constants.dart';
import 'package:flutter/material.dart';

class SearchViewWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  const SearchViewWidget({
    required this.controller,
    this.hintText = "",
  });

  @override
  Widget build(BuildContext context) {
    final Color color = controller.text.isNotEmpty ? kMainColor : Colors.grey;
    return Container(
        margin: const EdgeInsets.only(right: 16),
        child: TextField(
          keyboardType: TextInputType.number,
          cursorColor: kMainColor,
          controller: controller,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            isDense: true,
            contentPadding: const EdgeInsets.all(14.0),
            focusedBorder: kFocusedOutlineInputBorder(),
            border: kOutlineInputBorder(),
            hintText: hintText,
            suffixIcon: IconButton(
                onPressed: controller.text.isNotEmpty ? controller.clear : null,
                color: color,
                icon: const Icon(Icons.clear, color: kMainColor,)),
            hintStyle: TextStyle(color: Colors.grey[300]),
          ),
        ));
  }
}
