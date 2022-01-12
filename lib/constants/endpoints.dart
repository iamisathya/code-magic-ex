// ignore_for_file: constant_identifier_names

class EndPoints {
  EndPoints._();

  //base
  static const String DSC_TH_BASE = "https://dsc-th.unicity.com/";
  static const String HYDRA_BASE = "https://hydra.unicity.net/v5a/";
  static const String MEMBER_CALLS2_BASE = "https://member-calls2.unicity.com/";
  static const String MEMBER_CALLS_BASE = "https://member-calls.unicity.com/";

  // others end points
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

  static const String validOrders = "ALL/DSC/THA/getdata.php";
  static const String barcodeDetails = "ALL/DSC/THA/barcode/redirect.php";
  static const String dscBarcodeDetails = "barcode/redirect_api.php";
  static const String hydraProducts = "products-v2/publish";
  static const String hydraProductsV2 = "products-v2/adapter";
  static const String addressList = "unishop-fn-misc/city/search";
  static const String barcodeItems =
      "ALL/DSC/THA/barcode/check/library/get_items.php";
  static const String dscBarcodeItems =
      "barcode/check/library/get_items_api.php";
  static const String getBarcodeNumbers =
      "ALL/DSC/THA/barcode/check/library/edit.php";
  static const String verifyEachBarcodeNumber =
      "ALL/DSC/THA/barcode/check/library/verify.php";
  static const String saveBarcodeNumber =
      "ALL/DSC/THA/barcode/check/library/save.php";
  static const String allDsc = "ALL/DSC/";
  static const String allDscPath = "ALL/DSC";
  static const String dictionary = "dictionary/publish";
  static const String dscHome = "$DSC_TH_BASE/";
  static const String resource = "$DSC_TH_BASE/data/";
  static const String poOrder = "$DSC_TH_BASE/po_1.php";
  static const String validateIdCard =
      "api/unishop/v1/th/validate_address/idcard";
  static const String verifyEnroll = "THA/THA_DSC_Enroll_ValidationV2.asp";
  static const String validateEmail = "ALL/Email_Validation.asp";
  static const String cashCoupon = "unishop-fn-misc/cashcoupon_quota/";
  static const String inventoryPrint =
      "$DSC_TH_BASE/administrator/print/inventory.php?user_id";
  static const String period = "period.asp";
  static const String clearOrderCache = "etlV2/cache/clearAll";
  static const String orderVerify = "ALL/DSC/THA/barcode/order_verify.php";
  static const String sendOrderOnline =
      "ALL/DSC/THA/email/send_order_online_TH.php";
  static const String printOrderItems =
      "$DSC_TH_BASE/administrator/print/ordertranitems.php";
  static const String orderedItems =
      "${DSC_TH_BASE}invoice.php?link=https://hydra.unicity.net/v5a/orders";
  static const String forceResetPassword = "etlV2/user/forceResetPassword";
  static const String salesOrderDetails = "orders/{orderCode}";
  static const String deliveryShiping =
      "https://hydra.unicity.net/v5a/warehouses/9e41f330617aa2801b45620f8ffc5615306328fa0bd2255b0d42d7746560d24c/shippingmethods?type=WillCall";
}
