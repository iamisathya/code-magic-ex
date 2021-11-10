import 'package:dsc_tools/ui/global/theme/text_view.dart';
import 'package:dsc_tools/utilities/enums.dart';
import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({Key? key, required this.errors}) : super(key: key);

  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 294,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: const Color(0xFFF9748E),
      ),
      child: Column(
          children: errors
              .map((e) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: AppText(
                      text: e,
                      style: TextTypes.subtitle2,
                      color: const Color(0xFFFFFFFF),
                    ),
              ))
              .toList()),
    );
  }
}
