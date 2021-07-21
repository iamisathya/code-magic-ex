import 'package:code_magic_ex/utilities/constants.dart';
import 'package:flutter/material.dart';

class TransAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String subTitle;

  const TransAppBar({
    required this.title,
    this.subTitle = "",
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
        iconTheme: const IconThemeData(color: kMainColor),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Column(children: [
          Text(
            title,
            style: const TextStyle(color: kMainColor),
          ),
          if (subTitle != "")
            Text(subTitle,
                style: const TextStyle(color: kMainColor, fontSize: 14))
        ]));
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}
