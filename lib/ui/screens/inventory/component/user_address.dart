import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../constants/globals.dart';
import '../../../../utilities/images.dart';
import '../controller/inventory.home.controller.dart';

class UserAddress extends StatelessWidget {
  final InventoryHomeController controller = Get.put(InventoryHomeController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      color: const Color(0xFFFFFFFF),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Text(
              "Date: ${DateFormat('dd/MM/yyyy').format(DateTime.now()).toString()} - ${DateFormat('hh:mm aa').format(DateTime.now()).toString()}",
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Text("DSC Address",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(color: const Color(0xFF384250)))),
          Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: Text(
              Globals.userInfo.humanName.fullName,
              style: Theme.of(context).textTheme.bodyText2,
              maxLines: 3,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Text(
              "${Globals.userInfo.mainAddress.address1}, ${Globals.userInfo.mainAddress.address2}, ${Globals.userInfo.mainAddress.city} ${Globals.userInfo.mainAddress.state} ${Globals.userInfo.mainAddress.zip} - ${Globals.userInfo.mainAddress.country}",
              style: Theme.of(context).textTheme.bodyText2,
              maxLines: 3,
            ),
          ),
          SizedBox(
            height: 1,
            width: double.infinity,
            child: Container(
              color: const Color(0xFFCBCBCD),
            ),
          ),
          const Divider(height: 1),
          Obx(
            () => SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                      onTap: () => controller.onChangeViewType("card"),
                      child: Row(
                        children: [
                          Text("Card View",
                              style: controller.currentViewType.value.value ==
                                      "card"
                                  ? Theme.of(context).textTheme.subtitle1
                                  : Theme.of(context).textTheme.bodyText2),
                          const SizedBox(width: 20),
                          SvgPicture.asset(kCardViewIcon,
                              color: controller.currentViewType.value.value ==
                                      "card"
                                  ? const Color(0xFF000000)
                                  : const Color(0xFF606975),
                              width: 20,
                              semanticsLabel: 'arrow'),
                        ],
                      )),
                  SizedBox(
                    height: 50,
                    width: 1,
                    child: Container(
                      color: const Color(0xFFCBCBCD),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => controller.onChangeViewType("table"),
                    child: Row(
                      children: [
                        Text("Table View",
                            style: controller.currentViewType.value.value ==
                                    "table"
                                ? Theme.of(context).textTheme.subtitle1
                                : Theme.of(context).textTheme.bodyText2),
                        const SizedBox(width: 20),
                        SvgPicture.asset(kTableViewIcon,
                            color: controller.currentViewType.value.value ==
                                    "table"
                                ? const Color(0xFF000000)
                                : const Color(0xFF606975),
                            width: 20,
                            semanticsLabel: 'arrow'),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
