import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../constants/colors.dart';

class SearchBarField extends StatelessWidget {
  final TextEditingController searchTextController;
  final String placeHolder;
  final bool autofocus;

  const SearchBarField(
      {required this.searchTextController,
      this.placeHolder = "Search ...",
      this.autofocus = false});

  @override
  Widget build(BuildContext context) {
    return Transform(
        transform: Matrix4.translationValues(0.0, 0.0, 0.0),
        child: TextField(
          controller: searchTextController,
          style: const TextStyle(fontSize: 14),
          keyboardType: TextInputType.number,
          autofocus: autofocus,
          decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: AppColor.metallicSilver),
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 20),
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              hintText: placeHolder,
              hintStyle: const TextStyle(
                  color: AppColor.metallicSilver, fontSize: 14)),
        ));
  }
}
