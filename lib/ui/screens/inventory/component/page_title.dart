import 'package:flutter/material.dart';

class PageTitle extends StatelessWidget {
  final String title;

  const PageTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFFFFFF),
      height: 70,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Center(
            child: Text(title, style: Theme.of(context).textTheme.headline4)),
      ),
    );
  }
}
