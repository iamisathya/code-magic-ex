import 'package:flutter/material.dart';

class DropDownItem extends StatelessWidget {
  const DropDownItem({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 100,
      child: Text(
        title,
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
