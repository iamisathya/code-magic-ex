import 'package:flutter/material.dart';

class SearchBarField extends StatelessWidget {
  final TextEditingController searchTextController;

  const SearchBarField(
      {required this.searchTextController});

  @override
  Widget build(BuildContext context) {
    return Transform(
        transform: Matrix4.translationValues(0.0, 0.0, 0.0),
        child: TextField(
          controller: searchTextController,
          style: const TextStyle(color: Color(0xFF9EA9B9), fontSize: 14),
          decoration: const InputDecoration(
              border: InputBorder.none,
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF9EA9B9)),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 20),
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              hintText: "Enter PO number...",
              hintStyle:
                  TextStyle(color: Color(0xFF9EA9B9), fontSize: 14)),
        ));
  }
}
