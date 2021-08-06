import '../screens/easy_ship/home.dart';
import '../screens/inventory/home.dart';
import '../screens/order_entry/screens/checkout/checkout_screen.dart';
import '../screens/sales_reports/home.dart';
import 'package:flutter/material.dart';

import '../screens/webview/webview.dart';
import 'router.dart';
import '../screens/login/login.dart';
import '../screens/barcode/home.dart';
import '../screens/enroll/enroll.dart';
import '../screens/home/home.dart';
import '../screens/open_po/home/home.dart';
import '../screens/order_entry/order_entry.dart';

Map<String, WidgetBuilder> get routes {
  return {
    ScreenPaths.loginHome: (context) => LoginScreen(),
    ScreenPaths.mainHome: (context) => MainHomeScreen(),
    ScreenPaths.openPO: (context) => OpenPOHomeScreen(),
    ScreenPaths.enroll: (context) => EnrollHomeScreen(),
    ScreenPaths.orderEntry: (context) => OrderEntryHomeScreen(),
    ScreenPaths.inventory: (context) => InventoryHomeScreen(),
    ScreenPaths.salesReport: (context) => SalesReportsHomeScreen(),
    ScreenPaths.easyShipReport: (context) => EasyShipHomeScreen(),
    ScreenPaths.barcode: (context) => BarcodeHomeScreen(),
    ScreenPaths.webview: (context) => const WebivewHomeScreen(),
    ScreenPaths.checkout: (context) => CheckoutPage(),
  };
}
