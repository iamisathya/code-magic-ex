import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utilities/constants.dart';
import '../../../utilities/size_config.dart';
import '../../global/navigation_drawer.dart';
import '../../global/widgets/transparent_app_bar.dart';
import 'bloc/bloc.dart';
import 'component/body.dart';

class SalesReportsHomeScreen extends StatelessWidget {
  final SalesReportController controller = Get.put(SalesReportController());
  static const String routeName = '/salesReportsHomePage';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        backgroundColor: kWhiteSmokeColor,
        appBar: TransAppBar(
          title: "Sales Report",
          action: _renderActionBar(context),
        ),
        drawer: NavigationDrawer(),
        body: Body());
  }

  List<Widget> _renderActionBar(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: const Icon(
          Icons.open_in_new_outlined,
        ),
        tooltip: 'Export',
        onPressed: () => controller.onTapExportExcellSheet(),
      ),
      IconButton(
        icon: const Icon(
          Icons.print_outlined,
        ),
        tooltip: 'Print',
        onPressed: () => controller.onTapPrintExcellSheet(),
      ),
      IconButton(
        icon: const Icon(
          Icons.sort,
        ),
        tooltip: 'Sort types',
        onPressed: () => controller.showPopupMenu(context),
      ),
    ];
  }
}
