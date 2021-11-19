import 'package:flutter/material.dart';

import '../../../../../global/widgets/unordered_list.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({Key? key, required this.errors}) : super(key: key);

  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: const Color(0xFFFA758E),
        ),
        child: UnorderedList(errors));
  }
}
