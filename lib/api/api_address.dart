const String encodetype = "base64";
const String encodeValue = "Mjk3MDQ2NjoxMjM0";
const String baseDscTh = "https://dsc-th.unicity.com/";

class Address {
  static const String baseDscTh = "https://dsc-th.unicity.com/";
  static const String baseUrl = "https://hydra.unicity.net/v5a/";
  static const String loginTokens = "/loginTokens";
  static const String customerData = "/customers/{id}";
  static const String profilePicture = "/customers/{id}/profilePicture";
  static const String managedWarehouse = "/customers/me/managedwarehouses";
  static const String inventoryRecords = "/warehouses/{id}/inventoryRecords";
  static const String inventoryMovementRecords =
      "/warehouses/{id}/inventoryMovementRecords";
  static const String ordersAndRmas = "/warehouses/{id}/ordersAndRmas";
  static const String customers = "/customers";
  static const String orderTerms = "/orderTerms";
  static const String orderLines = "/orderlines";
  static const String orders =
      "/warehouses/9e41f330617aa2801b45620f8ffc5615306328fa0bd2255b0d42d7746560d24c/orders";
  static const String customersPath = "customers";
  static const String memberCalls2Base = "https://member-calls2.unicity.com/";
  static const String memberCallsBase = "https://member-calls.unicity.com/";
  static const String validOrders = "ALL/DSC/THA/getdata.php";
  static const String allDsc = "ALL/DSC/";
  static const String allDscPath = "ALL/DSC";
  static const String dictionary = "dictionary/publish";
  static const String dscHome = "$baseDscTh/";
  static const String resource = "$baseDscTh/data/";
  static const String poOrder = "$baseDscTh/po_1.php";
  static const String validateIdCard =
      "api/unishop/v1/th/validate_address/idcard";
  static const String verifyEnroll = "THA/THA_DSC_Enroll_ValidationV2.asp";
  static const String validateEmail = "ALL/Email_Validation.asp";
  static const String cashCoupon = "unishop-fn-misc/cashcoupon_quota/";
  static const String inventoryPrint =
      "$baseDscTh/administrator/print/inventory.php?user_id";
  static const String period = "period.asp";
  static const String clearOrderCache = "etlV2/cache/clearAll";
  static const String orderVerify = "ALL/DSC/THA/barcode/order_verify.php";
  static const String sendOrderOnline =
      "ALL/DSC/THA/email/send_order_online_TH.php";
  static const String printOrderItems =
      "$baseDscTh/administrator/print/ordertranitems.php";
  static const String orderedItems =
      "${baseDscTh}invoice.php?link=https://hydra.unicity.net/v5a/orders";
  static const String forceResetPassword = "etlV2/user/forceResetPassword";
  static const String salesOrderDetails = "orders/{orderCode}";
}
