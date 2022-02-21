import 'package:get/get.dart';

import '../modules/barcode/barcode.screen.dart';
import '../modules/barcode/binding.dart';
import '../modules/barcode/screens/barcode_details.dart';
import '../modules/barcode/screens/barcode_search_screen.dart';
import '../modules/easy_ship/easyship.screen.dart';
import '../modules/easy_ship/widgets/easyship.orders.list.dart';
import '../modules/enroll/enrollhome.screen.dart';
import '../modules/enroll/screens/enroll_confirmation/enrollconfirmation.screen.dart';
import '../modules/enroll/screens/enrollement_condition/main_screen.dart';
import '../modules/enroll/screens/enrollment_details/home.dart';
import '../modules/enroll/screens/enrollment_summary/main_screen.dart';
import '../modules/enroll/screens/enrollment_user_info/main_screen.dart';
import '../modules/enroll/screens/order_complete/enrollcomplete.screen.dart';
import '../modules/home/home.dart';
import '../modules/inventory/inventory.dart';
import '../modules/inventory/inventory_search/screens/search_inventory.dart';
import '../modules/inventory/inventory_search_result/screens/inventory_search_result.dart';
import '../modules/login/login_home/login_home.dart';
import '../modules/notifications/notifications_home/screens/home_screen.dart';
import '../modules/open_po/order_create/home_screen.dart';
import '../modules/open_po/order_details/home_screen.dart';
import '../modules/open_po/order_details/orderdetails.screen.dart';
import '../modules/open_po/order_list/home_screen.dart';
import '../modules/open_po/order_search/components/search_products.dart';
import '../modules/open_po/order_success/main_screen.dart';
import '../modules/order_entry/orderentry.screen.dart';
import '../modules/order_entry/screens/checkout/checkout.screen.dart';
import '../modules/order_entry/screens/order_entry_list/home.dart';
import '../modules/order_entry/screens/order_entry_summary/home.dart';
import '../modules/order_entry/screens/order_entry_table/orderentrytable.screen.dart';
import '../modules/profile/change_password/update_password.dart';
import '../modules/profile/forgot_password/forgot_password.dart';
import '../modules/profile/forgot_password/screens/change_password/change_password.dart';
import '../modules/profile/forgot_password/screens/verify_code/verify_code.dart';
import '../modules/profile/operation_result/operation_result.dart';
import '../modules/profile/profile.dart';
import '../modules/profile/terms_conditions/terms_conditions.dart';
import '../modules/profile/update_email/update_email.dart';
import '../modules/sales_reports/component/order_details.dart';
import '../modules/sales_reports/component/sales_report_search_result.dart';
import '../modules/sales_reports/component/search_open_po.dart';
import '../modules/sales_reports/print_sales_report/print_sales_report.dart';
import '../modules/sales_reports/salesreports.screen.dart';
import '../modules/settings/settings.screen.dart';
import '../modules/splash/splash.screen.dart';
import '../modules/webview/webview.screen.dart';
import '../utils/bindings.dart';
import '../widgets/no_connection.dart';

part './app_routes.dart';
// import '../utilities/bindings.dart';

class AppRoutes {
  AppRoutes._(); //this is to prevent anyone from instantiating this object
  static final routes = [
    GetPage(name: Routes.SPLASH, page: () => SplashScreen()),
    GetPage(name: Routes.ENROLL, page: () => EnrollHomeScreen()),
    GetPage(name: Routes.ENROLL_CONFIRMATION, page: () => EnrollConfirmation()),
    GetPage(name: Routes.ENROLL_COMPLETE, page: () => EnrollComplete()),
    GetPage(name: Routes.ENROLL_TERMS, page: () => EnrollmentTermsScreen()),
    GetPage(name: Routes.ENROLL_DETAILS_MAIN, page: () => EnrollmentDetailsHomeScreen()),
    GetPage(name: Routes.INVENTORY, page: () => InventoryHomeScreen()),
    GetPage(name: Routes.INVENTORY_SEARCH, page: () => InventorySearchProducts()),
    GetPage(name: Routes.INVENTORY_SEARCH_RESULT, page: () => InventorySearchResult()),
    GetPage(name: Routes.EASY_SHIP_REPORT, page: () => EasyShipHomeScreen()),
    GetPage(name: Routes.EASY_SHIP_ORDER_LIST, page: () => EasyShipOrdersList()),
    GetPage(name: Routes.ORDER_ENTRY, page: () => OrderEntryHomeScreen()),
    GetPage(name: Routes.ORDER_ENTRY_LIST, page: () => OrderEntryList()),
    GetPage(name: Routes.ORDER_ENTRY_CHECKOUT, page: () => CheckoutPage()),
    GetPage(name: Routes.ENROLL_USER_INFO, page: () => EnrollmentUserInfoScreen()),
    GetPage(name: Routes.ENROLL_SUMMARY, page: () => EnrollmentSummaryScreen()),
    GetPage(name: Routes.OPEN_PO_SEARCH_PRODUCTS, page: () => SearchProducts()),
    GetPage(name: Routes.ORDER_ENTRY_TABLE, page: () => OrderEntryTable()),
    GetPage(name: Routes.ORDER_ENTRY_SUMMARY, page: () => OrderEntrySummary()),
    GetPage(name: Routes.MAIN_HOME, page: () => MainHomeScreen()),
    GetPage(name: Routes.LOGIN_HOME, page: () => LoginScreen()),
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
    GetPage(name: Routes.SALES_REPORT_SEARCH_RESULT, page: () => SalesReportSearchResult()),
    GetPage(name: Routes.OPEN_PO_PURCHASE_ORDER_DETAILS, page: () => PurchaseOrderDetailsPage()),
    GetPage(name: Routes.SALES_REPORT_ORDER_DETAILS, page: () => SalesReportOrderDetials()),
    GetPage(name: Routes.SALES_REPORT_SEARCH, page: () => SearchSalesReport()),
    GetPage(name: Routes.BARCODE_DETAILS, page: () => BarCodeDetails()),
    GetPage(name: Routes.BARCODE_SEARCH, page: () => BarCodeSearchScreen()),
    GetPage(
        name: Routes.BARCODE,
        page: () => BarcodeHomeScreen(),
        binding: BarcodeBindings()),
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
