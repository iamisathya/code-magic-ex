import 'package:flutter/material.dart';

import '../../../utilities/constants.dart';

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
        iconTheme: const IconThemeData(color: kMainColor),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: action,
        title: Column(children: [
          Text(
            title,
            style: const TextStyle(color: kMainColor),
          ),
          if (subTitle != "")
            Text(subTitle,
                style: const TextStyle(color: kMainColor, fontSize: 14)),
        ]));
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}
