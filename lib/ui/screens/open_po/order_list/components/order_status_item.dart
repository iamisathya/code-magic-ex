import 'package:flutter/material.dart';

import '../../../../../utilities/enums.dart';
import '../../../../global/theme/text_view.dart';

class OrderStatusItem extends StatelessWidget {
  const OrderStatusItem({
    Key? key,
    required this.title,
    required this.color,
  }) : super(key: key);

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 5),
        height: 20,
        color: color,
        child: AppText(
            text: title, style: TextTypes.bodyText2, color: Colors.white));
  }
}
