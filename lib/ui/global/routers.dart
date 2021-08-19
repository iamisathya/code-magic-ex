import 'package:code_magic_ex/ui/screens/barcode/home.dart';
import 'package:code_magic_ex/ui/screens/easy_ship/home.dart';
import 'package:code_magic_ex/ui/screens/enroll/enroll.dart';
import 'package:code_magic_ex/ui/screens/enroll/screens/enroll_confirmation/home.dart';
import 'package:code_magic_ex/ui/screens/enroll/screens/order_complete/enroll_complete.dart';
import 'package:code_magic_ex/ui/screens/home/home.dart';
import 'package:code_magic_ex/ui/screens/login/login.dart';
import 'package:code_magic_ex/ui/screens/open_po/home/home.dart';
import 'package:code_magic_ex/ui/screens/order_entry/order_entry.dart';
import 'package:code_magic_ex/ui/screens/order_entry/screens/checkout/checkout_screen.dart';
import 'package:code_magic_ex/ui/screens/sales_reports/home.dart';
import 'package:code_magic_ex/ui/screens/splash/screen.dart';
import 'package:code_magic_ex/ui/screens/webview/webview.dart';
import 'package:get/get.dart';

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
