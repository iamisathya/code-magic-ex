import 'package:dsc_tools/ui/screens/open_po/home/components/open_po_details.dart';
import 'package:dsc_tools/utilities/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

import 'photo_viewer.dart';

class POItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      GestureDetector(
        onTap: () => Get.to(() => OpenPODetailsPage()),
        child: Card(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Column(
                      children: [
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "PO Number: BKM 2021-08-W002",
                            textAlign: TextAlign.left,
                            style:
                                TextStyle(fontSize: 16, color: Color(0xFF505050)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text("Total PV: 40"),
                              Text(
                                "Date: 2021-08-25",
                                style: TextStyle(color: Color(0xFF505050)),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text("Total PV: 40"),
                            Text(
                              "Date: 2021-08-25",
                              style: TextStyle(color: Color(0xFF505050)),
                            ),
                          ],
                        ),
                      ],
                    )),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Divider(height: 1, color: Color(0xFFE3E8ED)),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () => openDialog(context),
                            child: SvgPicture.asset(kCameraIcon,
                                height: 20, semanticsLabel: "Add PO"),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            "2",
                            style: TextStyle(color: Color(0xFF505050)),
                          ),
                        ],
                      ),
                      SvgPicture.asset(kPendingImage,
                          height: 20, semanticsLabel: "Add PO"),
                    ],
                  ),
                ),
              ],
            )),
      ),
      Positioned(
        top: 4,
        right: 20,
        child: SvgPicture.asset(kInformationIcon,
            height: 20, semanticsLabel: "Add PO"),
      ),
    ]);
  }

  void openDialog(BuildContext context) => showDialog(
        context: context,
        barrierColor: Colors.black87,
        builder: (BuildContext context) {
          return Dialog(
            child: PhotoView(
              tightMode: true,
              imageProvider: const NetworkImage(
                  "https://se.ewi.tudelft.nl/desosa2019/chapters/flutter/images/flutter/flutter-logo-sharing.png"),
              heroAttributes: const PhotoViewHeroAttributes(tag: "someTag"),
            ),
          );
        },
      );
}
