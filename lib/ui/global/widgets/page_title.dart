import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';

class PageTitle extends StatelessWidget {
  final String title;

  const PageTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.kWhiteColor,
      height: 70,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Center(
            child: Text(title, style: Theme.of(context).textTheme.headline4)),
      ),
    );
  }
}
