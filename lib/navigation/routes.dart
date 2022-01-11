import 'package:dsc_tools/ui/screens/inventory/inventory.dart';
import 'package:flutter/material.dart';

import '../ui/screens/barcode/barcode.screen.dart';
import '../ui/screens/easy_ship/easyship.screen.dart';
import '../ui/screens/enroll/enrollhome.screen.dart';
import '../ui/screens/home/home.dart';
import '../ui/screens/login/login.screen.dart';
import '../ui/screens/open_po/order_list/home_screen.dart';
import '../ui/screens/order_entry/orderentry.screen.dart';
import '../ui/screens/order_entry/screens/checkout/checkout.screen.dart';
import '../ui/screens/sales_reports/salesreports.screen.dart';
import '../ui/screens/webview/webview.screen.dart';
import 'router.dart';

Map<String, WidgetBuilder> get routes {
  return {
    ScreenPaths.loginHome: (context) => LoginScreen(),
    ScreenPaths.mainHome: (context) => MainHomeScreen(),
    ScreenPaths.openPo: (context) => OpenPoHomeScreen(),
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
