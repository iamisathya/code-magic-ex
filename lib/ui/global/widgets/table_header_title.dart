import 'package:flutter/material.dart';

import '../../../utilities/constants.dart';

class TableHeaderTitle extends StatelessWidget {
  const TableHeaderTitle({
    required this.label,
    required this.width,
  }) : super();
  final String label;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: kTableHeaderTileBox,
      width: width,
      height: 56,
      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.center,
      child: Padding(
        padding: kEdgeA8(),
        child: Text(label,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white)),
      ),
    );
  }
}
