import 'package:code_magic_ex/ui/global/navigation_drawer.dart';
import 'package:code_magic_ex/ui/global/widgets/primary_button.dart';
import 'package:code_magic_ex/ui/global/widgets/transparent_app_bar.dart';
import 'package:code_magic_ex/ui/screens/open_po/controller/open_po_controller.dart';
import 'package:code_magic_ex/ui/screens/open_po/home/components/body.dart';
import 'package:code_magic_ex/utilities/size_config.dart';
import 'package:code_magic_ex/utilities/constants.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OpenPOHomeScreen extends StatelessWidget {
  final OpenPoController controller = Get.put(OpenPoController());
  static const String routeName = '/openPOHomePage';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        backgroundColor: kWhiteSmokeColor,
        appBar: TransAppBar(
          title: "PO List",
          action: _renderActionBar(context),
        ),
        drawer: NavigationDrawer(),
        body: Body(),
        floatingActionButton: FloatingActionButton(
            elevation: 0.0,
            backgroundColor: kMainColor,
            onPressed: () => renderBottomSheet(context),
            child: const Icon(Icons.add, color: Colors.white)));
  }

  List<Widget> _renderActionBar(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: const Icon(
          Icons.sort,
        ),
        tooltip: 'Sort types',
        onPressed: () => controller.showPopupMenu(context),
      ),
    ];
  }

  void renderBottomSheet(BuildContext context) {
    Get.bottomSheet(
      Container(
        margin: EdgeInsets.all(16),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                'Extra info',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            _renderTextField(
                ctlr: controller.commentController,
                helperText: "Add your comments here",
                maxLines: 5,
                label: "Comment"),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: controller.selectSource,
              child: Stack(children: [
                _renderTextField(
                      ctlr: controller.selectedFileController,
                      label: "Browse file",
                      minLines: 1,
                      enabled: false,
                    ),
                Positioned(
                    left: 0,
                    top: 40,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 0.5),
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10))),
                      alignment: Alignment.center,
                      width: 80,
                      height: 63,
                      child: const Icon(
                        Icons.image,
                        color: kMainColor,
                      ),
                    ))
              ]),
            ),
            const SizedBox(height: 30),
            PrimaryButton(
              press: () {},
              text: 'Checkout',
            )
          ],
        ),
      ),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      elevation: 10,
      backgroundColor: Colors.white,
    );
  }

  Container _renderTextField(
      {TextEditingController? ctlr,
      bool enabled = true,
      String label = "",
      String helperText = "",
      String hintText = "",
      int maxLines = 1,
      int minLines = 2}) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          _renderLabel(label),
          TextField(
              enabled: enabled,
              controller: ctlr,
              maxLines: maxLines,
              minLines: minLines,
              style: const TextStyle(fontSize: 18),
              cursorColor: kMainColor,
              decoration: enabled == false
                  ? kDisabledTextInputDecoration(
                      helperText: helperText, hintText: hintText)
                  : kActiveTextInputDecoration(
                      helperText: helperText, hintText: hintText))
        ],
      ),
    );
  }

  Padding _renderLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, left: 8),
      child: SizedBox(
        width: Get.width,
        child: Text(
          label,
          textAlign: TextAlign.left,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
