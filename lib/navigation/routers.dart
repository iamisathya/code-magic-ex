import 'package:get/get.dart';

import '../ui/screens/barcode/home.dart';
import '../ui/screens/easy_ship/home.dart';
import '../ui/screens/enroll/enroll.dart';
import '../ui/screens/enroll/screens/enroll_confirmation/home.dart';
import '../ui/screens/enroll/screens/order_complete/enroll_complete.dart';
import '../ui/screens/home/home.dart';
import '../ui/screens/login/login.dart';
import '../ui/screens/open_po/home/home.dart';
import '../ui/screens/order_entry/order_entry.dart';
import '../ui/screens/order_entry/screens/checkout/checkout_screen.dart';
import '../ui/screens/sales_reports/home.dart';
import '../ui/screens/splash/screen.dart';
import '../ui/screens/webview/webview.dart';

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
  ];
}
