const String encodetype = "base64";
const String encodeValue = "Mjk3MDQ2NjoxMjM0";

class Address {
  static const String baseUrl = "https://hydra.unicity.net/v5a/";
  static const String loginTokens = "/loginTokens";
  static const String customerData = "/customers/{id}";
  static const String managedWarehouse = "/customers/me/managedwarehouses";
  static const String inventoryRecords = "/warehouses/{id}/inventoryRecords";
  static const String inventoryMovementRecords =
      "/warehouses/{id}/inventoryMovementRecords";
  static const String ordersAndRmas = "/warehouses/{id}/ordersAndRmas";
  static const String customers = "/customers";
  static const String orderTerms = "/orderTerms";
  static const String orderLines = "/orderlines";
  static const String orders = "/warehouses/{id}/orders";
  static const String customersPath = "customers";
  static const String memberCalls2Base = "https://member-calls2.unicity.com/";
  static const String memberCallsBase = "https://member-calls.unicity.com/";
  static const String validOrders = "ALL/DSC/THA/getdata.php";
  static const String allDsc = "ALL/DSC/";
  static const String allDscPath = "ALL/DSC";
  static const String dictionary = "dictionary/publish";
  static const String dscHome = "https://dsc-th.unicity.com/";
  static const String resource = "https://dsc-th.unicity.com/data/";
  static const String poOrder = "https://dsc-th.unicity.com/po_1.php";
}
