import 'package:flutter/material.dart';

class DataCell extends StatelessWidget {
  const DataCell({
    required this.width,
    required this.titleText,
  }) : super();
  final double width;
  final String titleText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 65,
      decoration: BoxDecoration(border: Border.all(width: 0.5)),
      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(titleText),
      ),
    );
  }
}
