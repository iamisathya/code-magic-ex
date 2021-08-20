import 'package:get/get.dart';

import '../screens/barcode/home.dart';
import '../screens/easy_ship/home.dart';
import '../screens/enroll/enroll.dart';
import '../screens/enroll/screens/enroll_confirmation/home.dart';
import '../screens/enroll/screens/order_complete/enroll_complete.dart';
import '../screens/home/home.dart';
import '../screens/login/login.dart';
import '../screens/open_po/home/home.dart';
import '../screens/order_entry/order_entry.dart';
import '../screens/order_entry/screens/checkout/checkout_screen.dart';
import '../screens/sales_reports/home.dart';
import '../screens/splash/screen.dart';
import '../screens/webview/webview.dart';

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
