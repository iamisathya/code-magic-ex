import 'package:dsc_tools/ui/screens/inventory/inventory.screen.dart';
import 'package:get/get.dart';

import '../ui/screens/barcode/barcode.screen.dart';
import '../ui/screens/barcode/screens/barcode_details.dart';
import '../ui/screens/easy_ship/easyship.screen.dart';
import '../ui/screens/enroll/enrollhome.screen.dart';
import '../ui/screens/enroll/screens/enroll_confirmation/enrollconfirmation.screen.dart';
import '../ui/screens/enroll/screens/order_complete/enrollcomplete.screen.dart';
import '../ui/screens/home/home.dart';
import '../ui/screens/login/login.screen.dart';
import '../ui/screens/open_po/order_create/home_screen.dart';
import '../ui/screens/open_po/order_details/home_screen.dart';
import '../ui/screens/open_po/order_list/home_screen.dart';
import '../ui/screens/open_po/order_success/main_screen.dart';
import '../ui/screens/order_entry/orderentry.screen.dart';
import '../ui/screens/order_entry/screens/checkout/checkout.screen.dart';
import '../ui/screens/profile/profile.dart';
import '../ui/screens/sales_reports/component/print_report.dart';
import '../ui/screens/sales_reports/salesreports.screen.dart';
import '../ui/screens/settings/settings.screen.dart';
import '../ui/screens/splash/splash.screen.dart';
import '../ui/screens/webview/webview.screen.dart';
// import '../utilities/bindings.dart';

class AppRoutes {
  AppRoutes._(); //this is to prevent anyone from instantiating this object
  static final routes = [
    // splash
    GetPage(name: SplashScreen.routeName, page: () => SplashScreen()),
    // Enroll
    GetPage(name: EnrollHomeScreen.routeName, page: () => EnrollHomeScreen()),
    GetPage(
        name: EnrollConfirmation.routeName, page: () => EnrollConfirmation()),
    GetPage(name: EnrollComplete.routeName, page: () => EnrollComplete()),
    GetPage(name: InventoryHomeScreen.routeName, page: () => InventoryHomeScreen()),
    // Easy ship
    GetPage(
        name: EasyShipHomeScreen.routeName, page: () => EasyShipHomeScreen()),
    // Order Entry
    GetPage(
        name: OrderEntryHomeScreen.routeName,
        page: () => OrderEntryHomeScreen()),
    // Dashbaord
    GetPage(name: MainHomeScreen.routeName, page: () => MainHomeScreen()),
    // Login
    GetPage(name: LoginScreen.routeName, page: () => LoginScreen()),
    GetPage(name: CheckoutPage.routeName, page: () => CheckoutPage()),
    // Settings
    GetPage(name: SettingsPage.routeName, page: () => SettingsPage()),
    // Open PO
    GetPage(
        name: OpenPoHomeScreen.routeName,
        page: () => OpenPoHomeScreen()),
    GetPage(
        name: OpenPoOrderDetails.routeName,
        page: () => OpenPoOrderDetails()),
    GetPage(
        name: OpenPoCreateOrder.routeName,
        page: () => OpenPoCreateOrder()),
    GetPage(
        name: CreateOpenPoOrderResult.routeName,
        page: () => CreateOpenPoOrderResult()),
    // Sales Report
    GetPage(name: PrintSalesReport.routeName, page: () => PrintSalesReport()),
    GetPage(
        name: SalesReportsHomeScreen.routeName,
        page: () => SalesReportsHomeScreen()),
    // Barcode
    GetPage(name: BarCodeDetails.routeName, page: () => BarCodeDetails()),
    GetPage(name: BarcodeHomeScreen.routeName, page: () => BarcodeHomeScreen()),
    // Common pages
    GetPage(
        name: WebivewHomeScreen.routeName,
        page: () => const WebivewHomeScreen()),
    GetPage(
        name: UserProfileScreen.routeName,
        page: () => const UserProfileScreen()),
  ];
}
