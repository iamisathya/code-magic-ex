import 'package:flutter/material.dart';

import 'package:code_magic_ex/ui/global/router.dart';
import 'package:code_magic_ex/ui/global/widgets/confirmation_dialog.dart';
import 'package:code_magic_ex/ui/screens/login/login.dart';
import 'package:code_magic_ex/utilities/user_session.dart';

class NavigationDrawer extends StatelessWidget {
  Future<void> _didMenuPressed(BuildContext context) async {
    // Navigator.of(context).pop();
    final isConfirmed = await ConfirmationDialog.show(
        context: context,
        message: 'Are you sure you want to log out?',
        okText: 'Yes',
        cancelText: 'No');
    if (isConfirmed == false) return;
    UserSessionManager.shared.removeUserInfoFromDB();
    final route = MaterialPageRoute(builder: (context) => LoginScreen());
    Navigator.of(context).pushAndRemoveUntil(route, (_) => false);
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createDrawerHeader(),
          _createDrawerBodyItem(
            icon: Icons.home_outlined,
            text: 'Home',
            onTap: () => Navigator.pushNamed(context, ScreenPaths.mainHome),
          ),
          _createDrawerBodyItem(
            icon: Icons.trending_up_sharp,
            text: 'Open PO',
            onTap: () => Navigator.pushNamed(context, ScreenPaths.openPO),
          ),
          _createDrawerBodyItem(
            icon: Icons.mode_edit_sharp,
            text: 'Enroll',
            onTap: () => Navigator.pushNamed(context, ScreenPaths.enroll),
          ),
          _createDrawerBodyItem(
            icon: Icons.shopping_cart_outlined,
            text: 'Order Entry',
            onTap: () => Navigator.pushNamed(context, ScreenPaths.orderEntry),
          ),
          const Divider(thickness: 1),
          _createDrawerBodyItem(
            icon: Icons.inventory_2,
            text: 'Inventory',
            onTap: () => Navigator.pushNamed(context, ScreenPaths.inventory),
          ),
          _createDrawerBodyItem(
            icon: Icons.receipt_outlined,
            text: 'Sales Report',
            onTap: () => Navigator.pushNamed(context, ScreenPaths.salesReport),
          ),
          _createDrawerBodyItem(
            icon: Icons.share_outlined,
            text: 'Easyship Report',
            onTap: () =>
                Navigator.pushNamed(context, ScreenPaths.easyShipReport),
          ),
          _createDrawerBodyItem(
            icon: Icons.qr_code_2_outlined,
            text: 'Barcode',
            onTap: () => Navigator.pushNamed(context, ScreenPaths.barcode),
          ),
          _createDrawerBodyItem(
            icon: Icons.logout_outlined,
            text: 'Signout',
            onTap: () => _didMenuPressed(context),
          ),
          ListTile(
            title: const Text('App version 1.0.0'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

Widget _createDrawerHeader() {
  return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      decoration: const BoxDecoration(color: Colors.white),
      child: Stack(children: const <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 12.0),
          child: CircleAvatar(
            radius: 50.0,
            backgroundColor: Color(0xFF778899),
            backgroundImage: NetworkImage(
                "http://d27zzi0gwko92h.cloudfront.net/media/image/customers/421adf11-eb44-44de-acd9-56d746304c37_original.jpeg"), // for Network image
          ),
        ),
        Positioned(
            bottom: 38.0,
            left: 16.0,
            child: Text("122345455",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500))),
        Positioned(
            bottom: 12.0,
            left: 16.0,
            child: Text("Kim Jung Un",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500))),
      ]));
}

Widget _createDrawerBodyItem(
    {required IconData icon,
    required String text,
    required GestureTapCallback onTap}) {
  return ListTile(
    leading: Icon(icon),
    title: Text(text),
    onTap: onTap,
  );
}
