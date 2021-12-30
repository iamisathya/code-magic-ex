import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../../../../constants/colors.dart';
import '../../../../../models/general_models.dart';
import '../../../../../utilities/enums.dart';
import '../../../../../utilities/extensions.dart';
import '../../../../../utilities/images.dart';
import '../../../../global/theme/text_view.dart';
import '../../../open_po/order_create/component/loader.dart';
import '../../controllers/orderentry.home.controller.dart';
import 'components/white_search_field.dart';

class Body extends StatelessWidget {
  final OrderEntryUserListController controller =
      Get.put(OrderEntryUserListController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          height: 70,
          alignment: Alignment.center,
          child: Text(
            "order_entry".tr,
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
        Container(
          color: AppColor.crayola,
          height: 130,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                    children: controller.searchOptions
                        .mapIndexed(
                          (NameValueType type, int index) => GestureDetector(
                            onTap: () => controller.onChangeTab(index),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: index != 0 ? 8.0 : 0),
                              child: Text(
                                type.name.tr,
                                style: controller.currentTab.value == index
                                    ? Theme.of(context).textTheme.subtitle1
                                    : Theme.of(context).textTheme.bodyText2,
                              ),
                            ),
                          ),
                        )
                        .toList()),
                WhiteSearchField(
                    controller: controller.searchUserTextController,
                    onPress: controller.searchUserBySearchQuery,
                    onChanged: controller.onTextChange,
                    kType: controller.currentTab.value == 0
                        ? TextInputType.number
                        : TextInputType.text,
                    hintText: "",
                    isFetching: controller.isFetching)
              ],
            ),
          ),
        ),
        if (controller.filterMethod.value != "baId" &&
            controller.searchResultsOfUserInfo.isNotEmpty)
          Expanded(
            child: SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Container(
                color: AppColor.kWhiteSmokeColor,
                child: Obx(
                  () => ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.searchResultsOfUserInfo.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        final bool isSelected =
                            controller.selecteduserIndex.value == index;
                        return GestureDetector(
                            onTap: () => controller.onSelectUser(index),
                            child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: isSelected
                                    ? AppText(
                                        text: controller
                                            .searchResultsOfUserInfo[index]
                                            .humanName
                                            .fullName,
                                        style: TextTypes.headline6)
                                    : AppText(
                                        text: controller
                                            .searchResultsOfUserInfo[index]
                                            .humanName
                                            .fullName,
                                        style: TextTypes.bodyText1,
                                        color: AppColor.darkLiver)));
                      }),
                ),
              ),
            )),
          )
        else
          Obx(
            () => Expanded(
              child: controller.showErrorImage.value
                  ? SvgPicture.asset(kOrderEntryErrorImage)
                  : const SizedBox(),
            ),
          )
      ],
    );
  }
}
