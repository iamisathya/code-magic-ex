import 'package:code_magic_ex/ui/global/widgets/transparent_app_bar.dart';
import 'package:code_magic_ex/ui/screens/order_entry/controllers/order_entry_controller.dart';
import 'package:code_magic_ex/utilities/constants.dart';
import 'package:code_magic_ex/utilities/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/body.dart';

class CheckoutPage extends StatelessWidget {
    static const String routeName = '/checkoutPage';
  final OrderEntryTableController controller =
      Get.put(OrderEntryTableController());


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
