import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../utilities/images.dart';
import '../controller/salesreports.home.controller.dart';

class OptionBar extends StatelessWidget {
  final SalesReportHomeController controller =
      Get.put(SalesReportHomeController());

  final VoidCallback onPrint;
  final VoidCallback onDownload;

  OptionBar({required this.onPrint, required this.onDownload});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: const BoxDecoration(
        color: Color(0xFFFFFFFF),
        border: Border(
          top: BorderSide(width: 0.5),
          bottom: BorderSide(width: 0.5),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => onPrint(),
                  child: Text("Print",
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(color: const Color(0xFF505050))),
                ),
                const SizedBox(width: 20),
                SvgPicture.asset(kPrintIcon,
                    width: 12,
                    color: const Color(0xFF505050),
                    semanticsLabel: 'print'),
              ],
            ),
          ),
          SizedBox(
            height: 50,
            width: 0.5,
            child: Container(
              color: const Color(0xFF000000),
            ),
          ),
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => onDownload(),
                  child: Text("Download",
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(color: const Color(0xFF505050))),
                ),
                const SizedBox(width: 20),
                SvgPicture.asset(kDownloadIcon,
                    color: const Color(0xFF505050),
                    width: 12,
                    semanticsLabel: 'dowmnload'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
