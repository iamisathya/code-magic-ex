import 'package:flutter/material.dart';

class SearchBarField extends StatelessWidget {
  final TextEditingController searchTextController;
  final Function(String) onTap;

  const SearchBarField(
      {required this.searchTextController, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Transform(
        transform: Matrix4.translationValues(0.0, 0.0, 0.0),
        child: TextField(
          controller: searchTextController,
          style: const TextStyle(color: Color(0xFF9EA9B9), fontSize: 14),
          decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF9EA9B9)),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 20),
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              hintText: "Enter PO number...",
              suffixIcon: GestureDetector(
                onTap: () => onTap(searchTextController.text),
                child: const Icon(Icons.search),
              ),
              hintStyle:
                  const TextStyle(color: Color(0xFF9EA9B9), fontSize: 14)),
        ));
  }
}
