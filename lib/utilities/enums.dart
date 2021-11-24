enum EasyShipSortTypes {
  record,
  baNumber,
  name,
  orderId,
  date,
  time,
  total,
  totalPV
}

enum InventorySortTypes {
  itemCode,
  itemName,
  pv,
  price,
  quantityOnHand,
  totalAccumulatedPrice,
  totalPV
}

enum StockTypes { onHand, outOfStock }

enum OpenPoTypes {
  poNumber,
  date,
  time,
  totalPv,
  totalPrice,
  status,
  attachment,
}

enum CartUpdate {
  increament,
  decreament,
}

enum EasyShipTypes { orderNumber, period, productName, itemCode, pv, price }

enum SnackBarType {
  error,
  waring,
  success,
}

enum LocaleTypes {
  en,
  th,
  lo,
  km,
  ms,
}

enum DateSelectorType { startDate, endDate }

enum OrderStatus { pending, error, success, unknown }

enum TextTypes {
  headline1, //60
  headline2, //48
  headline3, //34
  headline4, //24
  headline5, //20
  headline6, //18
  subtitle1, //16
  subtitle2, //14
  bodyText1, //14
  bodyText2, //12
  caption, //12
  button,
  overline
}

enum OrderEntryItemFilters { allProduct, easyShipSet }

enum OrderEntrySummaryFilters { myCart, paymentType }

enum PaymentTypes { payWithDsc }

enum PaymentOptions {
  creditCard,
  cashOnDelivery,
  cashCounterPay,
  ecPay,
  promptPay,
  bankWire,
  none
}

enum CardType {
  master,
  visa,
  verve,
  discover,
  americanExpress,
  dinersClub,
  jcb,
  others,
  invalid
}
