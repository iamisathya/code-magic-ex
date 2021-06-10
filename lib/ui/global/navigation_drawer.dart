import 'package:code_magic_ex/ui/global/router.dart';
import 'package:flutter/material.dart';

class NavigationDrawer extends StatelessWidget {
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
            onTap: () =>
                Navigator.pushReplacementNamed(context, PageRoutes.mainHome),
          ),
          _createDrawerBodyItem(
            icon: Icons.trending_up_sharp,
            text: 'Open PO',
            onTap: () =>
                Navigator.pushReplacementNamed(context, PageRoutes.openPO),
          ),
          _createDrawerBodyItem(
            icon: Icons.mode_edit_sharp,
            text: 'Enroll',
            onTap: () =>
                Navigator.pushReplacementNamed(context, PageRoutes.enroll),
          ),
          const Divider(),
          _createDrawerBodyItem(
            icon: Icons.shopping_cart_outlined,
            text: 'Order Entry',
            onTap: () =>
                Navigator.pushReplacementNamed(context, PageRoutes.orderEntry),
          ),
          _createDrawerBodyItem(
            icon: Icons.inventory_2,
            text: 'Inventory',
            onTap: () =>
                Navigator.pushReplacementNamed(context, PageRoutes.inventory),
          ),
          _createDrawerBodyItem(
            icon: Icons.receipt_outlined,
            text: 'Sales Report',
            onTap: () =>
                Navigator.pushReplacementNamed(context, PageRoutes.salesReport),
          ),
          _createDrawerBodyItem(
            icon: Icons.share_outlined,
            text: 'Easyship Report',
            onTap: () => Navigator.pushReplacementNamed(
                context, PageRoutes.easyShipReport),
          ),
          _createDrawerBodyItem(
            icon: Icons.qr_code_2_outlined,
            text: 'Barcode',
            onTap: () =>
                Navigator.pushReplacementNamed(context, PageRoutes.barcode),
          ),
          _createDrawerBodyItem(
            icon: Icons.logout_outlined,
            text: 'Signout',
            onTap: () =>
                Navigator.pushReplacementNamed(context, PageRoutes.barcode),
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
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill, image: AssetImage('images/bg_header.jpeg'))),
      child: Stack(children: <Widget>[
        Positioned(
            bottom: 12.0,
            left: 16.0,
            child: Text("Welcome to Flutter",
                style: const TextStyle(
                    color: Colors.white,
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
