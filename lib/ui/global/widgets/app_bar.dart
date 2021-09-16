import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBar extends StatelessWidget {
  final String text;

  const AppBar({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Text(
        text,
        style: Theme.of(context)
            .textTheme
            .headline6!
            .copyWith(color: const Color(0xFF000000)),
      ),
    );
  }
}
