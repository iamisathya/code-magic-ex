//Create a SearchView
import 'package:dsc_tools/utilities/constants.dart';
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
    final Color color = controller.text.isNotEmpty
        ? Theme.of(context).colorScheme.primary
        : Colors.grey;
    return Container(
        margin: const EdgeInsets.only(right: 16),
        child: TextField(
          keyboardType: TextInputType.number,
          cursorColor: Theme.of(context).colorScheme.primary,
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: IconButton(
                onPressed: controller.text.isNotEmpty ? controller.clear : null,
                color: color,
                icon: Icon(
                  Icons.clear,
                  color: Theme.of(context).colorScheme.primary,
                )),
            hintStyle: TextStyle(color: Colors.grey[300]),
          ),
        ));
  }
}
