import '../../../../../../utilities/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class WhiteSearchField extends StatelessWidget {
  const WhiteSearchField({
    Key? key,
    required this.controller,
    required this.isFetching,
    required this.onPress,
    required this.hintText,
    this.onChanged,
  }) : super(key: key);

  final TextEditingController controller;
  final VoidCallback onPress;
  final String hintText;
  final RxBool isFetching;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      height: 54,
      child: TextField(
        onChanged: onChanged,
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
          suffixIcon: Obx(() => IconButton(
              onPressed: onPress,
              color: const Color(0xFF384250),
              icon: isFetching.value
                  ? Image.asset(kAnimatedSpin, width: 20)
                  : SvgPicture.asset(kSearchV2Icon,
                      width: 20, semanticsLabel: 'search icon'))),
          hintStyle: TextStyle(color: Colors.grey[300]),
        ),
      ),
    );
  }
}
