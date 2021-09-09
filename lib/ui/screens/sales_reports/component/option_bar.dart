import 'package:dsc_tools/ui/screens/sales_reports/controller/salesreports.home.controller.dart';
import 'package:dsc_tools/utilities/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class OptionBar extends StatelessWidget {
   final SalesReportHomeController controller =
      Get.put(SalesReportHomeController());
      
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(width: 0.5),
          bottom: BorderSide(width: 0.5),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () => controller.proceedToPrint(context, orderHref: ""),
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
          SizedBox(
            height: 50,
            width: 0.5,
            child: Container(
              color: const Color(0xFF000000),
            ),
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () => controller.onTapExportExcellSheet(),
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
          )
        ],
      ),
    );
  }
}
