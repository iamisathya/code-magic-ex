import 'package:flutter/material.dart';

import '../../../../../constants/colors.dart';
import '../../../../../ui/global/widgets/transparent_app_bar.dart';
import '../../../../../utilities/size_config.dart';
import 'components/body.dart';

class OrderComplete extends StatelessWidget {
  static const String routeName = '/orderComplete';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kBackground,
      appBar: const TransAppBar(title: "Order Complete"),
      body: SafeArea(child: Body()),
    );
  }
}
