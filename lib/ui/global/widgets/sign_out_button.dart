import 'package:dsc_tools/utilities/images.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class SignOutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ButtonStyle(
            minimumSize: MaterialStateProperty.all<Size>(const Size(100, 54)),
            backgroundColor: MaterialStateProperty.all<Color>(
              const Color(0xFFFFB74F),
            ),
            foregroundColor: MaterialStateProperty.all<Color>(
              const Color(0xFF000000),
            ),
            textStyle: MaterialStateProperty.all<TextStyle?>(
                const TextStyle(fontSize: 20))),
        onPressed: () {},
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          const Text("Sign Out"),
          SvgPicture.asset(kSignOutIcon, height: 20),
        ]),
      ),
    );
  }
}
