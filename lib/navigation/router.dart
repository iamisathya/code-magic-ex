import 'package:dsc_tools/ui/screens/open_po/order_list/home_screen.dart';

import '../ui/screens/barcode/barcode.screen.dart';
import '../ui/screens/easy_ship/easyship.screen.dart';
import '../ui/screens/enroll/enrollhome.screen.dart';
import '../ui/screens/home/home.dart';
import '../ui/screens/inventory/inventory.screen.dart';
import '../ui/screens/login/login.screen.dart';
import '../ui/screens/order_entry/orderentry.screen.dart';
import '../ui/screens/order_entry/screens/checkout/checkout.screen.dart';
import '../ui/screens/sales_reports/salesreports.screen.dart';
import '../ui/screens/settings/settings.screen.dart';
import '../ui/screens/webview/webview.screen.dart';

class ScreenPaths {
  static const String loginHome = LoginScreen.routeName;
  static const String mainHome = MainHomeScreen.routeName;
  static const String openPo = OpenPoHomeScreen.routeName;
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
