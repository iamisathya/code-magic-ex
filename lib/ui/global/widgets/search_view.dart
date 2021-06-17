//Create a SearchView
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
    return Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: const BorderRadius.all(Radius.circular(8.0))),
        child: TextField(
          cursorColor: Colors.grey[300],
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            focusedBorder: InputBorder.none,
            prefixIcon: const Icon(Icons.search, color: Colors.grey),
            hintStyle: TextStyle(color: Colors.grey[300]),
          ),
        ));
  }
}
