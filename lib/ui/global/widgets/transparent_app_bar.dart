import 'package:flutter/material.dart';

class TransAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String subTitle;
  final List<Widget> action;

  const TransAppBar({
    required this.title,
    this.subTitle = "",
    this.action = const <Widget>[],
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 0,
        actions: action,
        title: Column(children: [
          Text(
            title,
          ),
          if (subTitle != "")
            Text(subTitle, style: Theme.of(context).textTheme.subtitle1),
        ]));
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}
