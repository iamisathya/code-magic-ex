import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../constants/colors.dart';
import '../../../../../ui/global/widgets/transparent_app_bar.dart';
import '../../../../../utilities/size_config.dart';
import '../../controllers/order_complete.dart';
import 'components/body.dart';

class OrderComplete extends StatelessWidget {
  final OrderCompleteController controller = Get.put(OrderCompleteController());
  static const String routeName = '/orderComplete';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: AppColor.kBackground,
      appBar: TransAppBar(
          title: "ordercomplete".tr, action: _renderActionBar(context)),
      body: SafeArea(child: Body()),
    );
  }

  List<Widget> _renderActionBar(BuildContext context) {
    return <Widget>[
      IconButton(
          icon: const Icon(
            Icons.qr_code_2_outlined,
          ),
          tooltip: 'open qr code',
          onPressed: () => controller.openBarCode()),
    ];
  }
}
