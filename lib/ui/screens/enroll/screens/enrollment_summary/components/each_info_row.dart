import '../../../../../global/theme/text_view.dart';
import '../../../../../../utilities/enums.dart';
import 'package:flutter/material.dart';

class EeachUserinfoItem extends StatelessWidget {
  const EeachUserinfoItem({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(child: AppText(text: title, style: TextTypes.bodyText1)),
          Flexible(
            flex: 2,
            child: AppText(
                text: value,
                style: TextTypes.bodyText1,
                align: TextAlign.right),
          ),
        ],
      ),
    );
  }
}
