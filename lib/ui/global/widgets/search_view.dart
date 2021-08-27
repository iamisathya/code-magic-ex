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
    final Color color = controller.text.isNotEmpty
        ? Theme.of(context).colorScheme.primary
        : Colors.grey;
    return Container(
        margin: const EdgeInsets.only(right: 16),
        child: TextField(
          keyboardType: TextInputType.number,
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: IconButton(
                onPressed: () =>
                    controller.text.isNotEmpty ? controller.clear() : null,
                color: color,
                icon: Icon(
                  Icons.clear,
                  color: controller.text.isNotEmpty
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).highlightColor,
                )),
            hintStyle: TextStyle(color: Colors.grey[300]),
          ),
        ));
  }
}
