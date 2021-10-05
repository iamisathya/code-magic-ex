import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchTextfield extends StatelessWidget {
  const SearchTextfield({
    Key? key,
    required this.textFieldController,
    required this.onSubmit,
    required this.labelText,
    required this.icon,
  }) : super(key: key);

  final TextEditingController textFieldController;
  final Function onSubmit;
  final String labelText;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 104,
      color: const Color(0xFF5297A6),
      child: Container(
        margin: const EdgeInsets.all(20),
        height: 64,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: const Color(0xFFFFFFFF),
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: textFieldController,
                onSubmitted: (val) => onSubmit(),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  labelText: labelText,
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFFFFFFF), width: 0),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFFFFFFF), width: 0),
                  ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFFFFFFF), width: 0),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                ),
              ),
            ),
            SizedBox(
              width: 50,
              child: GestureDetector(
                  onTap: () => onSubmit(),
                  child: SvgPicture.asset(icon, width: 20, height: 20)),
            ),
          ],
        ),
      ),
    );
  }
}
