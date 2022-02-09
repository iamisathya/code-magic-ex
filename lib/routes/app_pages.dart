import 'package:get/get.dart';

import '../ui/global/no_connection.dart';
import '../ui/screens/barcode/barcode.screen.dart';
import '../ui/screens/barcode/screens/barcode_details.dart';
import '../ui/screens/easy_ship/easyship.screen.dart';
import '../ui/screens/enroll/enrollhome.screen.dart';
import '../ui/screens/enroll/screens/enroll_confirmation/enrollconfirmation.screen.dart';
import '../ui/screens/enroll/screens/order_complete/enrollcomplete.screen.dart';
import '../ui/screens/home/home.dart';
import '../ui/screens/inventory/inventory.dart';
import '../ui/screens/login/login.screen.dart';
import '../ui/screens/notifications/screens/home_screen.dart';
import '../ui/screens/open_po/order_create/home_screen.dart';
import '../ui/screens/open_po/order_details/home_screen.dart';
import '../ui/screens/open_po/order_list/home_screen.dart';
import '../ui/screens/open_po/order_success/main_screen.dart';
import '../ui/screens/order_entry/orderentry.screen.dart';
import '../ui/screens/order_entry/screens/checkout/checkout.screen.dart';
import '../ui/screens/profile/profile.dart';
import '../ui/screens/profile/screens/change_password/update_password.dart';
import '../ui/screens/profile/screens/forgot_password/forgot_password.dart';
import '../ui/screens/profile/screens/forgot_password/screens/change_password/change_password.dart';
import '../ui/screens/profile/screens/forgot_password/screens/verify_code/verify_code.dart';
import '../ui/screens/profile/screens/operation_result/operation_result.dart';
import '../ui/screens/profile/screens/terms_conditions/terms_conditions.dart';
import '../ui/screens/profile/screens/update_email/update_email.dart';
import '../ui/screens/sales_reports/component/print_report.dart';
import '../ui/screens/sales_reports/salesreports.screen.dart';
import '../ui/screens/settings/settings.screen.dart';
import '../ui/screens/splash/splash.screen.dart';
import '../ui/screens/webview/webview.screen.dart';
import '../utilities/bindings.dart';

part './app_routes.dart';
// import '../utilities/bindings.dart';

class AppRoutes {
  AppRoutes._(); //this is to prevent anyone from instantiating this object
  static final routes = [
    GetPage(name: Routes.SPLASH, page: () => SplashScreen()),
    GetPage(name: Routes.ENROLL, page: () => EnrollHomeScreen()),
    GetPage(name: Routes.ENROLL_CONFIRMATION, page: () => EnrollConfirmation()),
    GetPage(name: Routes.ENROLL_COMPLETE, page: () => EnrollComplete()),
    GetPage(name: Routes.INVENTORY, page: () => InventoryHomeScreen()),
    GetPage(name: Routes.EASY_SHIP_REPORT, page: () => EasyShipHomeScreen()),
    GetPage(name: Routes.ORDER_ENTRY, page: () => OrderEntryHomeScreen()),
    GetPage(name: Routes.MAIN_HOME, page: () => MainHomeScreen()),
    GetPage(name: Routes.LOGIN_HOME, page: () => LoginScreen()),
    GetPage(name: Routes.ORDER_ENTRY_CHECKOUT, page: () => CheckoutPage()),
    GetPage(name: Routes.SETTINGS, page: () => SettingsPage()),
    GetPage(name: Routes.OPEN_PO, page: () => OpenPoHomeScreen()),
    GetPage(
        name: Routes.OPEN_PO_ORDER_DETAILS, page: () => OpenPoOrderDetails()),
    GetPage(name: Routes.OPEN_PO_CREATE_ORDER, page: () => OpenPoCreateOrder()),
    GetPage(
        name: Routes.OPEN_PO_CREATE_ORDER_RESULT,
        page: () => CreateOpenPoOrderResult()),
    GetPage(name: Routes.PRINT_SALES_REPORT, page: () => PrintSalesReport()),
    GetPage(name: Routes.SALES_REPORT, page: () => SalesReportsHomeScreen()),
    GetPage(name: Routes.BARCODE_DETAILS, page: () => BarCodeDetails()),
    GetPage(name: Routes.BARCODE, page: () => BarcodeHomeScreen()),
    GetPage(name: Routes.WEBVIEW, page: () => const WebivewHomeScreen()),
    GetPage(name: Routes.USER_PROFILE, page: () => UserProfileScreen()),
    GetPage(
        name: Routes.TERMS_CONDITIONS,
        page: () => const TermsConditionsScreen(),
        binding: TermsConditionsBinding()),
    GetPage(
        name: Routes.UPDATE_EMAIL,
        page: () => UpdateEmailScreen(),
        binding: UpdateEmailBinding()),
    GetPage(
        name: Routes.UPDATE_PASSWORD,
        page: () => UpdatePasswordScreen(),
        binding: UpdatePasswordBinding()),
    GetPage(
        name: Routes.USER_PROFILE,
        page: () => UserProfileScreen(),
        binding: UserProfileBinding()),
    GetPage(
        name: Routes.NOTIFICATIONS,
        page: () => const NotificationsScreen(),
        binding: NotificationsBinding()),
    GetPage(
        name: Routes.NO_CONNECTION,
        page: () => NoConnectionScreen(),
        binding: NoConnectionBinding()),
    GetPage(
        name: Routes.FOROGT_PASSWORD,
        page: () => ForgotPasswordScreen(),
        binding: ForgotPasswordBinding()),
    GetPage(
        name: Routes.VERIFY_CODE,
        page: () => VerifyCodeScreen(),
        binding: VerifyCodeBinding()),
    GetPage(
        name: Routes.CHANGE_PASSWORD,
        page: () => ChangePasswordScreen(),
        binding: ChangePasswordBinding()),
    GetPage(name: Routes.OPERATION_RESULT, page: () => OperationResultScreen()),
  ];
}
