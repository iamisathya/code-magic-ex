import 'package:dsc_tools/utilities/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OpenPoAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      titleSpacing: 0.0,
      // leading: Container(),
      title: Image.asset(kUnicityGradientImage, fit: BoxFit.cover),
      // Transform(
      //     transform: Matrix4.translationValues(-30.0, 0.0, 0.0),
      //     child: Image.asset(kUnicityGradientImage, fit: BoxFit.cover)),
      actions: [
        GestureDetector(
          child: SizedBox(
            width: 65,
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("En", style: TextStyle(color: Colors.black, fontSize: 14),),
                ),
                SvgPicture.asset(kEnIcon, height: 20, semanticsLabel: "change language"),
              ],
            ),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}
