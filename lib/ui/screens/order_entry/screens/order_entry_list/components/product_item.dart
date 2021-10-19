import 'package:dsc_tools/ui/global/theme/text_view.dart';
import 'package:dsc_tools/utilities/enums.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(      
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(3.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          AppText(
            text: "Code: 34160",
            style: TextTypes.caption,
            color: Color(0xFF9EA9B9),
          ),
          Container(
            height: 60,
            child: const FlutterLogo(size: 60),
          ),
          AppText(
            text: "4 PV | 350 THB",
            style: TextTypes.caption,
            color: Color(0xFF384250),
          ),
        ],
      ),
    );
  }
}
