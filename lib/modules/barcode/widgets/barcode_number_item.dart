import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/images.dart';

class BarcodeTextItem extends StatelessWidget {
  const BarcodeTextItem({
    Key? key,
    required this.text,
    required this.onDelete,
    required this.index,
  }) : super(key: key);

  final String text;
  final int index;
  final Function(int) onDelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text, style: Theme.of(context).textTheme.subtitle1),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: GestureDetector(
              onTap: () => onDelete(index),
              child: SvgPicture.asset(kTrashIcon,
                  height: 15, width: 15, semanticsLabel: 'trash icon'),
            ),
          ),
        ],
      ),
    );
  }
}
