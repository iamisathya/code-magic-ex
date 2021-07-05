import 'package:code_magic_ex/ui/screens/easy_ship/home.dart';
import 'package:code_magic_ex/ui/screens/inventory/home.dart';
import 'package:code_magic_ex/ui/screens/sales_reports/home.dart';
import 'package:flutter/material.dart';

import 'package:code_magic_ex/ui/screens/webview/webview.dart';
import 'package:code_magic_ex/ui/global/router.dart';
import 'package:code_magic_ex/ui/screens/login/login.dart';
import 'package:code_magic_ex/ui/screens/barcode/barcode.dart';
import 'package:code_magic_ex/ui/screens/enroll/enroll.dart';
import 'package:code_magic_ex/ui/screens/home/home.dart';
import 'package:code_magic_ex/ui/screens/open_po/home.dart';
import 'package:code_magic_ex/ui/screens/order_entry/order_entry.dart';

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
  };
}
