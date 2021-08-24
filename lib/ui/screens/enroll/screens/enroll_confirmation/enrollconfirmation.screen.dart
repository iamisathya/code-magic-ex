import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../global/widgets/transparent_app_bar.dart';
import '../../bloc/enrollconfirmation.controller.dart';
import 'components/body.dart';

class EnrollConfirmation extends StatelessWidget {
  final EnrollConfirmationController controller = Get.put(EnrollConfirmationController());
  static const String routeName = '/enrollHomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TransAppBar(
          title: "Enroll Confirmation",
          action: _renderActionBar(context),
        ),
        body: SingleChildScrollView(child: SafeArea(child: Body())));
  }

  List<Widget> _renderActionBar(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: const Icon(
          Icons.mode_edit_outline_outlined
        ),
        tooltip: 'Edit',
        onPressed: () => controller.onCancel(),
      ),
    ];
  }
}
