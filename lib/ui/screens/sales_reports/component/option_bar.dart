import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../constants/colors.dart';
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
        color: AppColor.kWhiteColor,
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
                  child: Text(
                    "Print",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(color: AppColor.darkLiver),
                  ),
                ),
                const SizedBox(width: 20),
                SvgPicture.asset(kPrintIcon,
                    width: 12,
                    color: AppColor.darkLiver,
                    semanticsLabel: 'print'),
              ],
            ),
          ),
          SizedBox(
            height: 50,
            width: 0.5,
            child: Container(
              color: AppColor.kBlackColor,
            ),
          ),
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => onDownload(),
                  child: Text(
                    "Download",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(color: AppColor.darkLiver),
                  ),
                ),
                const SizedBox(width: 20),
                SvgPicture.asset(kDownloadIcon,
                    color: AppColor.darkLiver,
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
