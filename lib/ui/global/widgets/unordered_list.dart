import 'package:dsc_tools/ui/global/theme/text_view.dart';
import 'package:dsc_tools/utilities/enums.dart';
import 'package:flutter/material.dart';

class UnorderedList extends StatelessWidget {
  const UnorderedList(this.texts);
  final List<String> texts;

  @override
  Widget build(BuildContext context) {
    final widgetList = <Widget>[];
    for (final text in texts) {
      // Add list item
      widgetList.add(UnorderedListItem(text));
      // Add space between items
      // widgetList.add(const SizedBox(height: 0.0));
    }

    return Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: widgetList);
  }
}

class UnorderedListItem extends StatelessWidget {
  const UnorderedListItem(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const Text("• "),
        Expanded(
          child: AppText(text: text, style: TextTypes.subtitle1),
        ),
      ],
    );
  }
}
