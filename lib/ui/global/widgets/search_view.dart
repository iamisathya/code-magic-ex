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
    final Color color = controller.text.isNotEmpty ? Colors.blue : Colors.grey;
    return Container(
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: const BorderRadius.all(Radius.circular(8.0))),
        child: TextField(
          cursorColor: Colors.grey[300],
          controller: controller,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(16),
            hintText: hintText,
            focusedBorder: InputBorder.none,
            // prefixIcon: const Icon(Icons.search, color: Colors.grey),
            suffixIcon: IconButton(
                onPressed: controller.text.isNotEmpty ? controller.clear : null,
                color: color,
                icon: const Icon(Icons.clear)),
            hintStyle: TextStyle(color: Colors.grey[300]),
          ),
        ));
  }
}
