import 'package:code_magic_ex/ui/global/widgets/back_buttonn.dart';
import 'package:code_magic_ex/ui/global/widgets/custom_surfix_icon.dart';
import 'package:code_magic_ex/ui/screens/open_po/getx/bloc.dart';
import 'package:code_magic_ex/utilities/constants.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class PurchaseOrderDetailsPage extends StatelessWidget {
  static const String routeName = '/purchaseOrderDetailsPage';
  final SampleController controller = Get.put(SampleController());

  PurchaseOrderDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 1250),
      margin: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BackIconButton(press: (){
            controller.toggle();
          }),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(child: Text("DSC Information")),
                Expanded(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: kWhiteSmokeColor,
                          border: Border.all(),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8.0))),
                      child: Text("00001"),
                    )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(child: Text("Date")),
                Expanded(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: kWhiteSmokeColor,
                          border: Border.all(),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8.0))),
                      child: Text("00001"),
                    )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(child: Text("DSC Name")),
                Expanded(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: kWhiteSmokeColor,
                          border: Border.all(),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8.0))),
                      child: Text("00001"),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
