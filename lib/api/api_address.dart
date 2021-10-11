const String encodetype = "base64";
const String encodeValue = "Mjk3MDQ2NjoxMjM0";
const String baseDscTh = "https://dsc-th.unicity.com/";
const String gToken = "_ga=GA1.2.1316239299.1632121654; PHPSESSID=dbpq6231h0pe0v9hc0oav8brm5; _gid=GA1.2.1973291869.1632382277; __cf_bm=g83McmerfcqxtdhiGFATq8b8A99IpLJEv.uiyDhy0WY-1632416053-0-AZdaMG45KBS/h/MQBVdgAJyPzzY0uX6Ql/zW6Fggzg5UAf3zaJ+Az41w2nWVVkuZHTrNqabsoWfFzKU4oLbY1Mqld5KRAzkCNNT/DW2dNSvun1nFras+le1rMdxwSFw0JA==";
const String gTokenBarcode = "_ga=GA1.2.1316239299.1632121654; PHPSESSID=dbpq6231h0pe0v9hc0oav8brm5; _gid=GA1.2.1201615372.1632894042; __cf_bm=8aVjR86.q3wgw92UX0sP6KqSET_LxGVg1rYmWD86YIk-1632933883-0-ATTJS2nxUB8qw3qVJFGgqpiQUgMadHRzHvVb28BVBZ0HbMR5V6qqOXn9h8v5ldjaCNVdLVYNIPucMo0f9Unp+l8/j8In2VSBNC7WAqjw9FB4q6KXK+yWfoKEs01RdGYtsA==";
const String gTokenBarcodeNew = "_ga=GA1.2.1316239299.1632121654; PHPSESSID=dbpq6231h0pe0v9hc0oav8brm5; _gid=GA1.2.946094527.1633924655; __cf_bm=yaRf3jogS5U0eMnUYptzMZbJ0HIXeYogugs5Pjg.8AA-1633924659-0-AbAldf+75e3ficrz6iWsfX0skAYw0SQDUfNDjAm+l974Kwt6kgvzI6cUuL7t7uM2k4AmaIJMYrZeo2HHgTiFo+sqSoWc1KdZhCKJzP2jll+Su8rpCkSe8xXb9KWLkELS3g==";

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
  static const String dscBase = "https://dsc-th.unicity.com/";
  static const String memberCallsBase = "https://member-calls.unicity.com/";
  static const String validOrders = "ALL/DSC/THA/getdata.php";
  static const String barcodeDetails = "ALL/DSC/THA/barcode/redirect.php";
  static const String barcodeItems = "ALL/DSC/THA/barcode/check/library/get_items.php";
  static const String dscBarcodeItems = "barcode/check/library/get_items.php";
  static const String getBarcodeNumbers = "ALL/DSC/THA/barcode/check/library/edit.php";
  static const String verifyEachBarcodeNumber = "ALL/DSC/THA/barcode/check/library/verify.php";
  static const String saveBarcodeNumber = "ALL/DSC/THA/barcode/check/library/save.php";
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
