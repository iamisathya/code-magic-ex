import 'package:code_magic_ex/ui/global/navigation_drawer.dart';
import 'package:code_magic_ex/ui/global/widgets/transparent_app_bar.dart';
import 'package:code_magic_ex/ui/screens/easy_ship/components/body.dart';
import 'package:code_magic_ex/utilities/size_config.dart';
import 'package:code_magic_ex/utilities/constants.dart';

import 'package:flutter/material.dart';

class EasyShipHomeScreen extends StatelessWidget {
  static const String routeName = '/easyShipReportsHomePage';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        backgroundColor: kWhiteSmokeColor,
        appBar: TransAppBar(
          title: "Easy Ship",
          action: [
            _appBarActions(),
          ],
        ),
        drawer: NavigationDrawer(),
        body: Body());
  }

  IconButton _appBarActions() {
    return const IconButton(
      icon: Icon(
        Icons.open_in_new_outlined,
        color: kMainColor,
      ),
      tooltip: 'Theme selector',
      onPressed: null,
    );
  }
}
