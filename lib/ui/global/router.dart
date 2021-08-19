import 'package:code_magic_ex/ui/screens/settings/settings.dart';

import '../screens/barcode/home.dart';
import '../screens/easy_ship/home.dart';
import '../screens/enroll/enroll.dart';
import '../screens/home/home.dart';
import '../screens/inventory/home.dart';
import '../screens/login/login.dart';
import '../screens/open_po/home/home.dart';
import '../screens/order_entry/order_entry.dart';
import '../screens/order_entry/screens/checkout/checkout_screen.dart';
import '../screens/sales_reports/home.dart';
import '../screens/webview/webview.dart';

class ScreenPaths {
  static const String loginHome = LoginScreen.routeName;
  static const String mainHome = MainHomeScreen.routeName;
  static const String openPO = OpenPOHomeScreen.routeName;
  static const String enroll = EnrollHomeScreen.routeName;
  static const String orderEntry = OrderEntryHomeScreen.routeName;
  static const String inventory = InventoryHomeScreen.routeName;
  static const String salesReport = SalesReportsHomeScreen.routeName;
  static const String easyShipReport = EasyShipHomeScreen.routeName;
  static const String barcode = BarcodeHomeScreen.routeName;
  static const String webview = WebivewHomeScreen.routeName;
  static const String checkout = CheckoutPage.routeName;
  static const String settings = SettingsPage.routeName;
}
