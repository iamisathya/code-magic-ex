import '../ui/screens/barcode/screens/barcode_details.dart';
import 'package:get/get.dart';

import '../ui/screens/barcode/barcode.screen.dart';
import '../ui/screens/easy_ship/easyship.screen.dart';
import '../ui/screens/enroll/enrollhome.screen.dart';
import '../ui/screens/enroll/screens/enroll_confirmation/enrollconfirmation.screen.dart';
import '../ui/screens/enroll/screens/order_complete/enrollcomplete.screen.dart';
import '../ui/screens/home/home.dart';
import '../ui/screens/login/login.screen.dart';
import '../ui/screens/open_po/home/components/add_products.dart';
import '../ui/screens/open_po/home/components/open_po_details.dart';
import '../ui/screens/open_po/home/home.screen.dart';
import '../ui/screens/order_entry/orderentry.screen.dart';
import '../ui/screens/order_entry/screens/checkout/checkout.screen.dart';
import '../ui/screens/sales_reports/component/print_report.dart';
import '../ui/screens/sales_reports/salesreports.screen.dart';
import '../ui/screens/settings/settings.screen.dart';
import '../ui/screens/splash/splash.screen.dart';
import '../ui/screens/webview/webview.screen.dart';
import '../utilities/bindings.dart';

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
    GetPage(name: MainHomeScreen.routeName, page: () => MainHomeScreen()),
    GetPage(name: LoginScreen.routeName, page: () => LoginScreen()),
    GetPage(name: CheckoutPage.routeName, page: () => CheckoutPage()),
    GetPage(name: SettingsPage.routeName, page: () => SettingsPage()),
    GetPage(
        name: OpenPOHomeScreen.routeName,
        page: () => OpenPOHomeScreen(),
        binding: OpenPoOrderListBindings()),
    GetPage(
        name: OpenPODetailsPage.routeName,
        page: () => OpenPODetailsPage(),
        binding: AppBindings()),
    GetPage(
        name: CreateOpenPoOrder.routeName,
        page: () => CreateOpenPoOrder(),
        binding: CreateOpenPoOrderBindings()),
    GetPage(name: PrintSalesReport.routeName, page: () => PrintSalesReport()),
    GetPage(name: BarCodeDetails.routeName, page: () => BarCodeDetails()),
  ];
}
