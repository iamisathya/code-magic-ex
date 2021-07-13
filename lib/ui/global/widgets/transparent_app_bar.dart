import 'package:code_magic_ex/utilities/constants.dart';
import 'package:flutter/material.dart';

class TransAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const TransAppBar({
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: kMainColor),
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(
        title,
        style: const TextStyle(color: kMainColor),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}
