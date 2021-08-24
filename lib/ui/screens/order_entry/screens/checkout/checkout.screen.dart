import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utilities/constants.dart';
import '../../../../../utilities/size_config.dart';
import '../../../../global/widgets/transparent_app_bar.dart';
import '../../controllers/orderentry.checkout.controller.dart';
import 'components/body.dart';

class CheckoutPage extends StatelessWidget {
  static const String routeName = '/checkoutPage';
  final OrderEntryCheckoutController controller =
      Get.put(OrderEntryCheckoutController());

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kBackground,
      appBar: TransAppBar(
        title: "Checkout",
        subTitle: "${controller.checkoutProducts.length.toString()} Items",
      ),
      body: SafeArea(child: Body()),
    );
  }
}
