import 'package:code_magic_ex/styles/box_decorations.dart';
import 'package:code_magic_ex/styles/edge_insets.dart';
import 'package:code_magic_ex/styles/sized_box.dart';
import 'package:code_magic_ex/ui/global/widgets/primary_button.dart';
import 'package:code_magic_ex/ui/screens/enroll/bloc/enroll_confirmation_controller.dart';
import 'package:code_magic_ex/utilities/constants.dart';
import 'package:code_magic_ex/utilities/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
              _renderCardHeader("BA inforations"),
              Column(
                children: [
                  renderUserCard("Enroller", "12312312", "This is name"),
                  const Divider(thickness: 1,),
                  SizedBox(height: SizeConfig.screenHeight * 0.01),
                  renderUserCard("Sponsor", "12312312", "This is name"),
                  const Divider(thickness: 1,),
                  SizedBox(height: SizeConfig.screenHeight * 0.01),
                  _renderUserInfo("First Name(Thai)", "ทดสอบ"),
                  _renderUserInfo("Last Name(Thai)", "บัญชีผู้ใช้"),
                  _renderUserInfo("Last Name(English)", "Test"),
                  _renderUserInfo("First Name(English)", "Account"),
                  _renderUserInfo("Address",
                      "ทดสอบ Sub-Areaวังบูรพาภิรมย์ Areaพระนคร กรุงเทพมหานคร 10200"),
                  _renderUserInfo("Email", "no@unicity.com"),
                  _renderUserInfo("Phone", "009900909"),
                  _renderUserInfo("Mobile", "0099009900"),
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
              PrimaryButton(press: () => controller.getPurchaseLog(context), text: "Confirm"),
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
          _renderCardHeader("Starter Kit"),
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
                _renderCardCell("Product Name", TextAlign.left),
                kHyphenSizedBox(),
                _renderCardCell("Starter Kit", TextAlign.right),
              ],
            ),
          ),
          Padding(
            padding: kEdgeInsetTLRB(t: 8, b: 16, l: 16, r: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _renderCardCell("Quantity", TextAlign.left),
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
                _renderCardCell("Price", TextAlign.left),
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
                _renderCardCell("PV", TextAlign.left),
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
