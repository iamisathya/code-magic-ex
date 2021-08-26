import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info/package_info.dart';

import '../ui/global/widgets/confirmation_dialog.dart';
import '../ui/screens/login/login.screen.dart';
import '../ui/screens/settings/settings.screen.dart';
import '../utilities/user_session.dart';
import 'router.dart';

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

  Future<PackageInfo> _packageInfo() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo;
  }

  void onSelectItem(String path) {
    Get.back();
    Get.offNamed(path);
  }

  void onSelectSettings() {
    Get.back();
    Get.to(() => SettingsPage());
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
            selected: currentRoute == ScreenPaths.openPO ||
                currentRoute == null ||
                currentRoute == "/",
            icon: Icons.trending_up_sharp,
            text: 'Open PO',
            onTap: () => onSelectItem(ScreenPaths.openPO)),
          _createDrawerBodyItem(
            selected: currentRoute == ScreenPaths.enroll,
            icon: Icons.mode_edit_sharp,
            text: 'enroll'.tr,
            onTap: () => onSelectItem(ScreenPaths.enroll),
          ),
          _createDrawerBodyItem(
            selected: currentRoute == ScreenPaths.orderEntry,
            icon: Icons.shopping_cart_outlined,
            text: 'Order Entry',
            onTap: () => onSelectItem(ScreenPaths.orderEntry),
          ),
          const Divider(thickness: 1),
          _createDrawerBodyItem(
            selected: currentRoute == ScreenPaths.inventory,
            icon: Icons.inventory_2,
            text: 'Inventory',
            onTap: () => onSelectItem(ScreenPaths.inventory),
          ),
          _createDrawerBodyItem(
            selected: currentRoute == ScreenPaths.salesReport,
            icon: Icons.receipt_outlined,
            text: 'Sales Report',
            onTap: () => onSelectItem(ScreenPaths.salesReport),
          ),
          _createDrawerBodyItem(
            selected: currentRoute == ScreenPaths.easyShipReport,
            icon: Icons.share_outlined,
            text: 'easyship'.tr,
            onTap: () => onSelectItem(ScreenPaths.easyShipReport),
          ),
          _createDrawerBodyItem(
            selected: currentRoute == ScreenPaths.barcode,
            icon: Icons.qr_code_2_outlined,
            text: 'Barcode',
            onTap: () => onSelectItem(ScreenPaths.barcode),
          ),
          _createDrawerBodyItem(
            selected: currentRoute == ScreenPaths.settings,
            icon: Icons.settings,
            text: 'Settings',
            onTap: () => onSelectSettings(),
          ),
          _createDrawerBodyItem(
            selected: false,
            icon: Icons.logout_outlined,
            text: 'Signout',
            onTap: () => _didMenuPressed(context),
          ),
          const Divider(thickness: 1),
          ListTile(
            title: FutureBuilder<PackageInfo>(
                future: _packageInfo(),
                builder: (BuildContext context,
                    AsyncSnapshot<PackageInfo> snapshot) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10, top: 5),
                        child: Text('App version  : ${snapshot.data?.version}'),
                      ),
                      Text('Build number : ${snapshot.data?.buildNumber}')
                    ],
                  );
                }),
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
            radius: 44.0,
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
            child: Text(
              UserSessionManager.shared.userInfo!.humanName.fullName,
              style: Theme.of(context).textTheme.headline6,
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
