import 'package:cached_network_image/cached_network_image.dart';
import 'package:dsc_tools/ui/global/widgets/sign_out_button.dart';
import 'package:dsc_tools/ui/screens/open_po/home/home.screen.dart';
import 'package:dsc_tools/utilities/function.dart';
import 'package:dsc_tools/utilities/images.dart';
import 'package:dsc_tools/utilities/user_session.dart';
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.asset(kSettingsIcon,
                                    height: 20, semanticsLabel: "settings"),
                                Image.asset(
                                  kUnicityGradientImage,
                                  fit: BoxFit.cover,
                                  width: 190,
                                  semanticLabel: "unicity logo",
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
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(26.0),
                                      child: CachedNetworkImage(
                                        imageUrl: UserSessionManager.shared
                                            .profilePicture!.sizes[0].media,
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error),
                                        height: 100,
                                        width: 100,
                                      ),
                                    )),
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
                          Text(
                              UserSessionManager
                                  .shared.userInfo!.humanName.fullName,
                              style: const TextStyle(fontSize: 24)),
                          const SizedBox(height: 10),
                          Text(
                              UserSessionManager.shared.userInfo!.id.unicity
                                  .toString(),
                              style: const TextStyle(
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
                  _renderMenuOption("Easyship Report", kEasyShipMenuIcon),
                  _renderMenuOption("Barcode", kBarcodeIcon),
                ],
              ),
              const SizedBox(
                height: 88,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: SignOutButton(
                  title: "Sign Out",
                  fontSize: 24,
                  height: 54,
                ),
              ),
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
