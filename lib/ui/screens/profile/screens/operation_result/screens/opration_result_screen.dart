import 'package:dsc_tools/constants/colors.dart';
import 'package:dsc_tools/ui/global/theme/text_view.dart';
import 'package:dsc_tools/ui/global/widgets/page_title.dart';
import 'package:dsc_tools/ui/screens/open_po/order_create/component/app_bar.dart';
import 'package:dsc_tools/ui/screens/profile/screens/operation_result/controller/operation_result.controller.dart';
import 'package:dsc_tools/ui/screens/profile/screens/terms_conditions/widgets/title_bar.dart';
import 'package:dsc_tools/utilities/enums.dart';
import 'package:dsc_tools/utilities/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class OperationResultScreen extends StatelessWidget {
  final OperationResultController _controller =
      Get.put(OperationResultController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OpenPoAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            PageTitle(title: _controller.result.value.headerText),
            TitleBar(
                title: _controller.result.value.title,
                icon: kProfileUserEditPencilIcon),
            Container(
              padding: const EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      AppText(
                          text: _controller.result.value.message,
                          style: TextTypes.headline4),
                      const SizedBox(height: 10),
                      AppText(
                          text: _controller.result.value.subContent,
                          style: TextTypes.subtitle2,
                          align: TextAlign.center),
                    ],
                  ),
                  const SizedBox(height: 86),
                  SvgPicture.asset(_controller.result.value.resultImage),
                  const SizedBox(height: 60),
                  TextButton(
                    onPressed: () => _controller.result.value.onPressDone!(),
                    child: AppText(
                        text: _controller.result.value.buttonText,
                        style: TextTypes.headline6,
                        color: AppColor.dodgerBlue),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
