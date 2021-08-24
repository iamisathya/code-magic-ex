import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../styles/box_decorations.dart';
import '../../../../../../styles/edge_insets.dart';
import '../../../../../../styles/sized_box.dart';
import '../../../../../../utilities/constants.dart';
import '../../../../../../utilities/size_config.dart';
import '../../../../../global/widgets/primary_button.dart';
import '../../../bloc/enrollconfirmation.controller.dart';

class Body extends StatelessWidget {
  final EnrollConfirmationController controller =
      Get.put(EnrollConfirmationController());

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      margin: kEdgeInsetSymmetric(h: 8, v: 0),
      child: Column(
        children: [
          _starterKit(),
          SizedBox(height: SizeConfig.screenHeight * 0.01),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(children: [
              _renderCardHeader("dsc_info".tr),
              Column(
                children: [
                  renderUserCard("Enroller", controller.enroleeData.enrollerId,
                      controller.enroleeData.enrollerName),
                  const Divider(
                    thickness: 1,
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.01),
                  renderUserCard("Sponsor", controller.enroleeData.sponsorId,
                      controller.enroleeData.sponsorName),
                  const Divider(
                    thickness: 1,
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.01),
                  _renderUserInfo(
                      "first_name_th".tr, controller.enroleeData.firstNameTh),
                  _renderUserInfo(
                      "last_name_th".tr, controller.enroleeData.lastNameTh),
                  _renderUserInfo(
                      "first_name_en".tr, controller.enroleeData.firstName),
                  _renderUserInfo(
                      "last_name_en".tr, controller.enroleeData.lastName),
                  _renderUserInfo("Address",
                      "${controller.enroleeData.mainAddress1} ${controller.enroleeData.mainAddress2}, ${controller.enroleeData.zipCode}"),
                  _renderUserInfo("email".tr, controller.enroleeData.email),
                  _renderUserInfo("phone".tr, controller.enroleeData.phoneNumber),
                  _renderUserInfo(
                      "mobilephone".tr, controller.enroleeData.mobileNumber),
                  SizedBox(height: SizeConfig.screenHeight * 0.01),
                ],
              ),
            ]),
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.03),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              PrimaryButton(
                  press: () => controller.onCancel(),
                  text: "Cancel",
                  color: Colors.red),
              PrimaryButton(
                  press: () => controller.proceedOrderPlace(context),
                  text: "Confirm"),
            ],
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.04),
        ],
      ),
    );
  }

  Padding _renderUserInfo(String title, String value) {
    return Padding(
      padding: kEdgeInsetTLRB(t: 16, b: 8, l: 16, r: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _renderCardCell(title, TextAlign.left),
          kHyphenSizedBox(),
          _renderCardCell(value, TextAlign.right),
        ],
      ),
    );
  }

  Card _starterKit() {
    return Card(
      shape: kRoundedBorder(),
      child: Column(
        children: [
          _renderCardHeader("enroll_pickup".tr),
          Padding(
            padding: kEdgeInsetTLRB(t: 16, b: 8, l: 16, r: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _renderCardCell("Product ID", TextAlign.left),
                kHyphenSizedBox(),
                _renderCardCell("12313123", TextAlign.right),
              ],
            ),
          ),
          Padding(
            padding: kEdgeInsetTLRB(t: 8, b: 16, l: 16, r: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _renderCardCell("product_name".tr, TextAlign.left),
                kHyphenSizedBox(),
                _renderCardCell("enroll_pickup".tr, TextAlign.right),
              ],
            ),
          ),
          Padding(
            padding: kEdgeInsetTLRB(t: 8, b: 16, l: 16, r: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _renderCardCell("quantity".tr, TextAlign.left),
                kHyphenSizedBox(),
                _renderCardCell("1", TextAlign.right),
              ],
            ),
          ),
          Padding(
            padding: kEdgeInsetTLRB(t: 8, b: 16, l: 16, r: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _renderCardCell("price".tr, TextAlign.left),
                kHyphenSizedBox(),
                _renderCardCell("`123123`", TextAlign.right),
              ],
            ),
          ),
          Padding(
            padding: kEdgeInsetTLRB(t: 8, b: 16, l: 16, r: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _renderCardCell("pv".tr, TextAlign.left),
                kHyphenSizedBox(),
                _renderCardCell("123123", TextAlign.right),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column renderUserCard(String title, String id, String name) {
    return Column(
      children: [
        Padding(
          padding: kEdgeInsetTLRB(t: 16, b: 8, l: 16, r: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _renderCardCell("$title ID", TextAlign.left),
              const SizedBox(width: 10, child: Text(" : ")),
              _renderCardCell(id, TextAlign.right),
            ],
          ),
        ),
        Padding(
          padding: kEdgeInsetTLRB(t: 8, b: 16, l: 16, r: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _renderCardCell("$title Name", TextAlign.left),
              const SizedBox(width: 10, child: Text(" : ")),
              _renderCardCell(name, TextAlign.right),
            ],
          ),
        ),
      ],
    );
  }

  Container _renderCardHeader(String title) {
    return Container(
      width: Get.width,
      height: 50,
      decoration: kEnrollHeader,
      child: Align(
        child: Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }

  Flexible _renderCardCell(String title, TextAlign align) {
    return Flexible(
      fit: FlexFit.tight,
      child:
          Text(title, textAlign: align, style: const TextStyle(fontSize: 16)),
    );
  }
}
