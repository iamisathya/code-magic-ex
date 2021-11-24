import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../utilities/enums.dart';
import '../theme/text_view.dart';

class UnorderedList extends StatelessWidget {
  const UnorderedList(this.texts, {this.color = AppColor.kWhiteColor});
  final List<String> texts;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final widgetList = <Widget>[];
    for (final text in texts) {
      // Add list item
      widgetList.add(UnorderedListItem(text, color));
      // Add space between items
      // widgetList.add(const SizedBox(height: 0.0));
    }

    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround, children: widgetList);
  }
}

class UnorderedListItem extends StatelessWidget {
  const UnorderedListItem(this.text, this.color);
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("• ", style: TextStyle(color: color)),
          Expanded(
            child: AppText(
              text: text,
              style: TextTypes.subtitle2,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
