import 'package:flutter/material.dart';

class Headline extends StatelessWidget {
  const Headline({required this.title, Key? key}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 70,
      alignment: Alignment.center,
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }
}
