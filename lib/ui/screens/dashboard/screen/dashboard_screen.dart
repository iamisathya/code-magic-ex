import 'package:dsc_tools/ui/global/widgets/sign_out_button.dart';
import 'package:dsc_tools/ui/screens/open_po/home/home.screen.dart';
import 'package:dsc_tools/utilities/function.dart';
import 'package:dsc_tools/utilities/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                height: 300,
                color: const Color(0xFFFFFFFF),
                child: Stack(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(128)),
                        color: Color(0xFFE3E8ED),
                      ),
                      height: 300,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset(kSettingsIcon,
                                    height: 20, semanticsLabel: "settings"),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'UNICITY',
                                        style: TextStyle(
                                            fontSize: 24.0,
                                            fontWeight: FontWeight.w600,
                                            foreground: Paint()
                                              ..shader = linearGradient),
                                      ),
                                      const SizedBox(
                                        width: 17.5,
                                      ),
                                      SvgPicture.asset(kDscLogoIcon,
                                          height: 20,
                                          semanticsLabel: "dsc logo"),
                                    ],
                                  ),
                                ),
                                const SizedBox(),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 100,
                            width: 100,
                            child: Stack(
                              clipBehavior: Clip.none,
                              fit: StackFit.expand,
                              children: [
                                Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(25)),
                                      color: const Color(0xFFE3E8ED),
                                      border: Border.all(
                                          color: const Color(0xFFFFFFFF),
                                          width: 2)),
                                  child: SvgPicture.asset(kDscLogoIcon,
                                      height: 120),
                                ),
                                Positioned(
                                    bottom: -5,
                                    left: -5,
                                    child: SvgPicture.asset(kCameraIcon,
                                        height: 20,
                                        semanticsLabel: "camera icon")),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text("Wangyibo",
                              style: TextStyle(fontSize: 24)),
                          const SizedBox(height: 10),
                          const Text("85851997",
                              style: TextStyle(
                                  fontSize: 13, color: Color(0xFF606975))),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 26,
              ),
              Column(
                children: [
                  _renderMenuOption("Open PO", kOpenPoIcon),
                  _renderMenuOption("Enroll", kEnrollIcon),
                  _renderMenuOption("Order Entry", kOrderEntryIcon),
                  _renderMenuOption("Inventory", kInventoryIcon),
                  _renderMenuOption("Sales Report", kSalesReportIcon),
                  _renderMenuOption("Easyship Report", kEasyshipIcon),
                  _renderMenuOption("Barcode", kBarcodeIcon),
                ],
              ),
              const SizedBox(
                height: 88,
              ),
              SignOutButton(),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _renderMenuOption(String title, String icon) {
    return GestureDetector(
      onTap: () => Get.to(() => OpenPOHomeScreen()),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 24),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SvgPicture.asset(icon,
                  height: 20, width: 20, semanticsLabel: title),
            ),
            Expanded(
                child: Text(
              title,
              style: const TextStyle(fontSize: 18),
            )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SvgPicture.asset(kArrowIcon,
                  width: 14, semanticsLabel: 'arrow'),
            ),
          ],
        ),
      ),
    );
  }
}
