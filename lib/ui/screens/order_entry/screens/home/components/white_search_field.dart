
import 'package:dsc_tools/utilities/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WhiteSearchField extends StatelessWidget {
  const WhiteSearchField({
    Key? key,
    required this.controller,
    required this.onPress,
    required this.hintText,
  }) : super(key: key);

  final TextEditingController controller;
  final VoidCallback onPress;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      height: 54,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          fillColor: Colors.white,
          hintText: hintText,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
          suffixIcon: IconButton(
              onPressed: onPress,
              color: const Color(0xFF384250),
              icon: SvgPicture.asset(kSearchV2Icon,
                  width: 20, semanticsLabel: 'search icon')),
          hintStyle: TextStyle(color: Colors.grey[300]),
        ),
      ),
    );
  }
}