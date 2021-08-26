import 'package:dsc_tools/ui/screens/settings/settings.screen.dart';
import 'package:get/get.dart';

import '../ui/screens/barcode/barcode.screen.dart';
import '../ui/screens/easy_ship/easyship.screen.dart';
import '../ui/screens/enroll/enrollhome.screen.dart';
import '../ui/screens/enroll/screens/enroll_confirmation/enrollconfirmation.screen.dart';
import '../ui/screens/enroll/screens/order_complete/enrollcomplete.screen.dart';
import '../ui/screens/home/home.dart';
import '../ui/screens/login/login.screen.dart';
import '../ui/screens/open_po/home/home.screen.dart';
import '../ui/screens/order_entry/orderentry.screen.dart';
import '../ui/screens/order_entry/screens/checkout/checkout.screen.dart';
import '../ui/screens/sales_reports/salesreports.screen.dart';
import '../ui/screens/splash/splash.screen.dart';
import '../ui/screens/webview/webview.screen.dart';

class AppRoutes {
  AppRoutes._(); //this is to prevent anyone from instantiating this object
  static final routes = [
    GetPage(name: SplashScreen.routeName, page: () => SplashScreen()),
    GetPage(name: EnrollHomeScreen.routeName, page: () => EnrollHomeScreen()),
    GetPage(
        name: EnrollConfirmation.routeName, page: () => EnrollConfirmation()),
    GetPage(name: EnrollComplete.routeName, page: () => EnrollComplete()),
    GetPage(name: BarcodeHomeScreen.routeName, page: () => BarcodeHomeScreen()),
    GetPage(
        name: WebivewHomeScreen.routeName,
        page: () => const WebivewHomeScreen()),
    GetPage(
        name: EasyShipHomeScreen.routeName, page: () => EasyShipHomeScreen()),
    GetPage(
        name: SalesReportsHomeScreen.routeName,
        page: () => SalesReportsHomeScreen()),
    GetPage(
        name: OrderEntryHomeScreen.routeName,
        page: () => OrderEntryHomeScreen()),
    GetPage(name: OpenPOHomeScreen.routeName, page: () => OpenPOHomeScreen()),
    GetPage(name: MainHomeScreen.routeName, page: () => MainHomeScreen()),
    GetPage(name: LoginScreen.routeName, page: () => LoginScreen()),
    GetPage(name: CheckoutPage.routeName, page: () => CheckoutPage()),
    GetPage(name: SettingsPage.routeName, page: () => SettingsPage()),
  ];
}
