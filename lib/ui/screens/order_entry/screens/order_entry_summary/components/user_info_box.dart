import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../constants/colors.dart';
import '../../../controllers/orderentry.product.list.controller.dart';

class UserInfoBox extends StatelessWidget {
  final OrderEntryProductListController listController =
      Get.put(OrderEntryProductListController());

  UserInfoBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.all(20),
      color: AppColor.crayola,
      child: Row(
        children: [
          TitleBox(title: listController.userData.userId),
          const SizedBox(width: 10),
          Flexible(child: TitleBox(title: listController.userData.fullName)),
        ],
      ),
    );
  }
}

class TitleBox extends StatelessWidget {
  const TitleBox({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: AppColor.kWhiteSmokeColor,
      ),
      child: Text(
        title,
        overflow: TextOverflow.fade,
        softWrap: false,
        style: Theme.of(context)
            .textTheme
            .subtitle1!
            .copyWith(color: AppColor.darkLiver),
      ),
    );
  }
}
