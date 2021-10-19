import 'package:dsc_tools/ui/global/theme/text_view.dart';
import 'package:dsc_tools/utilities/enums.dart';
import 'package:dsc_tools/utilities/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class TopHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 22.0, horizontal: 22.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [AppText(text: "categories".tr, style: TextTypes.headline4), renderCart()],
        ),
      ),
    );
  }

  Row renderCart() {
    return Row(
      children: [    
        SizedBox(
          width: 19,
          height: 18.75,
          child: Stack(
            children: [
              Positioned.fill(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    width: 18.95,
                    height: 18.75,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xfff9748e),
                    ),
                  ),
                ),
              ),
              const Positioned.fill(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: SizedBox(
                    width: 19,
                    height: 17,
                    child: Text(
                      "0",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        SvgPicture.asset(kOrderEntryCartIcon, width: 20, height: 20,),    
      ],
    );
  }
}
