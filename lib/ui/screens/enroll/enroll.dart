import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../global/navigation_drawer.dart';
import '../../global/widgets/transparent_app_bar.dart';
import 'screens/enroll/components/body.dart';


class EnrollHomeScreen extends StatelessWidget {
  static const String routeName = '/enrollHomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TransAppBar(
          title: "enroll".tr,
        ),
        drawer: NavigationDrawer(),
        body: Body());
  }
}
