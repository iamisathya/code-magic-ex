import 'package:flutter/material.dart';

import '../ui/screens/barcode/home.dart';
import '../ui/screens/easy_ship/home.dart';
import '../ui/screens/enroll/enroll.dart';
import '../ui/screens/home/home.dart';
import '../ui/screens/inventory/home.dart';
import '../ui/screens/login/login.dart';
import '../ui/screens/open_po/home/home.dart';
import '../ui/screens/order_entry/order_entry.dart';
import '../ui/screens/order_entry/screens/checkout/checkout_screen.dart';
import '../ui/screens/sales_reports/home.dart';
import '../ui/screens/webview/webview.dart';
import 'router.dart';

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
