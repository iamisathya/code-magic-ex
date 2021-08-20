import 'package:code_magic_ex/ui/screens/settings/settings.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utilities/user_session.dart';
import '../screens/login/login.dart';
import 'router.dart';
import 'widgets/confirmation_dialog.dart';

class NavigationDrawer extends StatelessWidget {
  Future<void> _didMenuPressed(BuildContext context) async {
    // Navigator.of(context).pop();
    final isConfirmed = await ConfirmationDialog.show(
        context: context,
        message: 'Are you sure you want to log out?',
        okText: 'Yes',
        cancelText: 'No');
    if (isConfirmed == false) return;
    FirebaseAnalytics()
        .logEvent(name: 'log_out', parameters: {'type': "normal_signout"});
    UserSessionManager.shared.removeUserInfoFromDB();
    final route = MaterialPageRoute(builder: (context) => LoginScreen());
    Navigator.of(context).pushAndRemoveUntil(route, (_) => false);
    return;
  }

  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context)!.settings.name;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createDrawerHeader(context),
          _createDrawerBodyItem(
            selected: currentRoute == ScreenPaths.openPO || currentRoute == null || currentRoute == "/",
            icon: Icons.trending_up_sharp,
            text: 'Open PO',
            onTap: () => Navigator.pushNamed(context, ScreenPaths.openPO),
          ),
          _createDrawerBodyItem(
            selected: currentRoute == ScreenPaths.enroll,
            icon: Icons.mode_edit_sharp,
            text: 'Enroll',
            onTap: () => Navigator.pushNamed(context, ScreenPaths.enroll),
          ),
          _createDrawerBodyItem(
            selected: currentRoute == ScreenPaths.orderEntry,
            icon: Icons.shopping_cart_outlined,
            text: 'Order Entry',
            onTap: () => Navigator.pushNamed(context, ScreenPaths.orderEntry),
          ),
          const Divider(thickness: 1),
          _createDrawerBodyItem(
            selected: currentRoute == ScreenPaths.inventory,
            icon: Icons.inventory_2,
            text: 'Inventory',
            onTap: () => Navigator.pushNamed(context, ScreenPaths.inventory),
          ),
          _createDrawerBodyItem(
            selected: currentRoute == ScreenPaths.salesReport,
            icon: Icons.receipt_outlined,
            text: 'Sales Report',
            onTap: () => Navigator.pushNamed(context, ScreenPaths.salesReport),
          ),
          _createDrawerBodyItem(
            selected: currentRoute == ScreenPaths.easyShipReport,
            icon: Icons.share_outlined,
            text: 'Easyship Report',
            onTap: () =>
                Navigator.pushNamed(context, ScreenPaths.easyShipReport),
          ),
          _createDrawerBodyItem(
            selected: currentRoute == ScreenPaths.barcode,
            icon: Icons.qr_code_2_outlined,
            text: 'Barcode',
            onTap: () => Navigator.pushNamed(context, ScreenPaths.easyShipReport),
          ),
          _createDrawerBodyItem(
            selected: currentRoute == ScreenPaths.settings,
            icon: Icons.settings,
            text: 'Settings',
            onTap: () => {
              Get.back(),
              Get.to(() => SettingsPage())
            },
          ),
          _createDrawerBodyItem(
            selected: false,
            icon: Icons.logout_outlined,
            text: 'Signout',
            onTap: () => _didMenuPressed(context),
          ),
          const ListTile(
            title: Text('App version 1.0.0'),
          ),
        ],
      ),
    );
  }
}

Widget _createDrawerHeader(BuildContext context) {
  return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      child: Stack(children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: CircleAvatar(
            radius: 50.0,
            backgroundImage: NetworkImage(UserSessionManager
                .shared.profilePicture!.sizes[0].media), // for Network image
          ),
        ),
        Positioned(
            bottom: 38.0,
            left: 16.0,
            child: Text(
                UserSessionManager.shared.userInfo!.id.unicity.toString(),
                style: Theme.of(context).textTheme.bodyText2,
                )),
        Positioned(
            bottom: 12.0,
            left: 16.0,
            child: Text(UserSessionManager.shared.userInfo!.humanName.fullName,
                )),
      ]));
}

Widget _createDrawerBodyItem(
    {required IconData icon,
    required String text,
    required GestureTapCallback onTap,
    required bool selected}) {
  return ListTile(
    selected: selected,
    leading: Icon(icon),
    title: Text(
      text,
    ),
    onTap: onTap,
  );
}
